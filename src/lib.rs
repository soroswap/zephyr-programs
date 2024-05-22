use zephyr_sdk::{prelude::*, soroban_sdk::{xdr::{ScVal, ContractEvent, Hash, ContractEventBody}, Symbol}, EnvClient, DatabaseDerive};

mod types;
mod events;

#[derive(DatabaseDerive, Clone)]
#[with_name("events")]
struct EventsTable {
    e_type: ScVal,
    token_a: ScVal,
    token_b: ScVal,
    amount_a: ScVal,
    amount_b: ScVal,
    account: ScVal,
}

#[test]
fn test() {
    println!("{:?}", stellar_strkey::Contract::from_string("CB74KXQXEGKGPU5C5FI22X64AGQ63NANVLRZBS22SSCMLJDXNHED72MO").unwrap().0);
}

pub(crate) const ROUTER_CONTRACT_ADDRESS: [u8; 32] = [127, 197, 94, 23, 33, 148, 103, 211, 162, 233, 81, 173, 95, 220, 1, 161, 237, 180, 13, 170, 227, 144, 203, 90, 148, 132, 197, 164, 119, 105, 200, 63];


#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();

    let contract_events: Vec<ContractEvent> = env
    .reader()
    .soroban_events()
    .into_iter()
    .filter(|event| event.contract_id == Some(Hash(ROUTER_CONTRACT_ADDRESS)))
    .collect();

    for event in contract_events {
        let ContractEventBody::V0(event) = &event.body;

        let action: Symbol = env.from_scval(&event.topics[1]);

        let data = &event.data;

        if action == Symbol::new(&env.soroban(), "remove") {
            env.log().debug(
                format!(
                    "Action is remove"
                ),
                None,
            );

            let table: EventsTable = events::get_event_from_remove(&env, data);

            table.put(&env);
        }

        if action == Symbol::new(&env.soroban(), "add") {
            env.log().debug(
                format!(
                    "Action is add"
                ),
                None,
            );

            let table: EventsTable = events::get_event_from_add(&env, data);

            table.put(&env);
        }

        if action == Symbol::new(&env.soroban(), "swap") {
            env.log().debug(
                format!(
                    "Action is swap"
                ),
                None,
            );

            let table: EventsTable = events::get_event_from_swap(&env, data);
            
            table.put(&env);
        }

    }

}