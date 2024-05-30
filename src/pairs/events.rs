use zephyr_sdk::{ prelude::*, soroban_sdk::{xdr::{ ContractEvent,  ContractEventBody, ScVal}, Symbol}, EnvClient };

use crate::PairsTable;

use crate::pairs::types;

pub(crate) fn get_pair_from_sync(env: &EnvClient, data: &ScVal, row:PairsTable) -> PairsTable {
    let values: types::SyncEvent = env.from_scval(data);
                
    let table = PairsTable {
        token_a: row.token_a.clone(),
        token_b: row.token_b.clone(),
        address: row.address.clone(),
        reserve_a: env.to_scval(values.new_reserve_0.clone()),
        reserve_b: env.to_scval(values.new_reserve_1.clone()),
    };

    table
}

pub(crate) fn handle_contract_events(env: &EnvClient, contract_events: Vec<ContractEvent>, row:PairsTable) {
    for event in contract_events {
        let ContractEventBody::V0(event) = &event.body;

        let action: Symbol = env.from_scval(&event.topics[1]);

        let data = &event.data;

        if action == Symbol::new(&env.soroban(), "sync") {
            env.log().debug(
                format!(
                    "Event captured: sync"
                ),
                None,
            );
            
            let table: PairsTable = get_pair_from_sync(&env, data, row.clone());

            env.log().debug(
                format!(
                    "Updating pair new reserve a:{:?}, new reserve b: {:?}", &table.reserve_a, &table.reserve_b
                ),
                None,
            );
            

            env.update().column_equal_to_xdr("address", &row.address).execute(&table);
        }

        if action == Symbol::new(&env.soroban(), "deposit") {
            env.log().debug(
                format!(
                    "Pair Event captured: deposit"
                ),
                None,
            );
        }

        if action == Symbol::new(&env.soroban(), "swap") {
            env.log().debug(
                format!(
                    "Pair Event captured: Swap"
                ),
                None,
            );
        }

        if action == Symbol::new(&env.soroban(), "withdraw") {
            env.log().debug(
                format!(
                    "Pair Event captured: Withdraw"
                ),
                None,
            );
        }

    }
}