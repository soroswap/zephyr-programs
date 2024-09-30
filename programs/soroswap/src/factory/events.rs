use zephyr_sdk::{ prelude::*, soroban_sdk::{xdr::{ ScVal}, Symbol}, EnvClient, PrettyContractEvent };

use crate::PairsTable;

use crate::factory::types;

pub(crate) fn get_pair_from_new_pair(env: &EnvClient, data: &ScVal) -> PairsTable {
    let values: types::NewPairEvent = env.from_scval(data);
                
    let zero:i128 = 0;

    let table = PairsTable {
        token_a: env.to_scval(values.token_0.clone()),
        token_b: env.to_scval(values.token_1.clone() ),
        address: env.to_scval(values.pair.clone()),
        reserve_a: env.to_scval(zero.clone()),
        reserve_b: env.to_scval(zero.clone()),
    };

    table
}

pub(crate) fn handle_contract_events(env: &EnvClient, contract_events: Vec<(PrettyContractEvent, [u8; 32])>) {


    for (event, _txhash) in contract_events {

        env.log().debug(format!("Factory event.topics: {:?}", &event.topics.clone()), None);

        let action: Symbol = env.from_scval(&event.topics[1]);

        let data = &event.data;

        if action == Symbol::new(&env.soroban(), "new_pair") {
            env.log().debug(
                format!(
                    "Event captured: new_pair"
                ),
                None,
            );
            
            let table: PairsTable = get_pair_from_new_pair(&env, data);

            let rows: Vec<PairsTable> = env.read_filter().column_equal_to_xdr("address", &table.address).read().unwrap();
            

            if rows.len() > 0 {
                let update = env.update().column_equal_to_xdr("address", &table.address).execute(&table);

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

            }else{
                table.put(&env);
            }
        }
    }
}