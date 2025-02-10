use zephyr_sdk::{ prelude::*, soroban_sdk::{xdr::{ ScVal }, Symbol}, EnvClient, PrettyContractEvent };

use crate::{PairsTable, ReservesChangeTable};

use crate::pairs::types;
use crate::router::pricing::calculate_tvl;
use zephyr_sdk::soroban_sdk::String as SorobanString;

pub(crate) fn get_pair_from_sync(env: &EnvClient, data: &ScVal, row:PairsTable) -> PairsTable {
    let values: types::SyncEvent = env.from_scval(data);
    
    // Convert reserves to i128 for TVL calculation
    let reserve_a: i128 = env.from_scval(&env.to_scval(values.new_reserve_0.clone()));
    let reserve_b: i128 = env.from_scval(&env.to_scval(values.new_reserve_1.clone()));
    
    // Convert token addresses to SorobanString
    let token_a: SorobanString = env.from_scval(&row.token_a);
    let token_b: SorobanString = env.from_scval(&row.token_b);
    
    // Calculate TVL
    let tvl = calculate_tvl(env, reserve_a, reserve_b, token_a, token_b);
    
    env.log().debug(
        format!(
            "Pair TVL calculated: {} USD", 
            tvl as f64 
        ),
        None,
    );
                
    let table = PairsTable {
        token_a: row.token_a.clone(),
        token_b: row.token_b.clone(),
        address: row.address.clone(),
        reserve_a: env.to_scval(values.new_reserve_0.clone()),
        reserve_b: env.to_scval(values.new_reserve_1.clone()),
        tvl_usd: env.to_scval(tvl),
    };

    table
}

pub(crate) fn handle_contract_events(env: &EnvClient, contract_events: Vec<(PrettyContractEvent, [u8; 32])>, row:PairsTable) {
    let timestamp = env.reader().ledger_timestamp();

    for (event, _txhash) in contract_events {
        // Attempt to convert to a Symbol safely using a Result
        let action_result = env.try_from_scval::<Symbol>(&event.topics[1]);

        match action_result {
            Ok(action) => {
                let data = &event.data;
                env.log().debug(format!("Handeling event action: {:?}", &action), None);

                if action == Symbol::new(&env.soroban(), "sync") {
                    env.log().debug(
                        format!(
                            "Event captured: sync"
                        ),
                        None,
                    );
                    
                    let table: PairsTable = get_pair_from_sync(&env, data, row.clone());
        
                    let reserves_change_table = ReservesChangeTable {
                        address: row.address.clone(),
                        reserve_a: table.reserve_a.clone(),
                        reserve_b: table.reserve_b.clone(),
                        timestamp: env.to_scval(timestamp),
                    };
        
                    reserves_change_table.put(&env);
        
                    let update = env.update().column_equal_to_xdr("address", &row.address).execute(&table);
        
                    if update.is_err() {
                        env.log().error(
                            format!(
                                "Error updating pair: {:?}",
                                update.err()
                            ),
                            None,
                        );
                    }else {
                        env.log().debug(
                            format!(
                                "Pair updated"
                            ),
                            None,
                        );
                    }
                }
            }
            Err(e) => {
                // Log the error or handle the case where it's not a Symbol
                env.log().debug(format!("Failed to convert to Symbol: {:?}", e), None);
                env.log().debug(format!("Failed with event : {:?}", event), None);
            }
        }
        
    }
}