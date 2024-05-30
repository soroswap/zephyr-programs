

use zephyr_sdk::{prelude::*, soroban_sdk::{xdr::{ScVal, ContractEvent, Hash, ContractEventBody }, Symbol, String as SorobanString},  EnvClient, DatabaseDerive};

pub mod router;
pub mod factory;
pub mod pairs;

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

#[derive(DatabaseDerive, Clone)]
#[with_name("pairs")]
struct PairsTable {
    address: ScVal,
    token_a: ScVal,
    token_b: ScVal,
    reserve_a: ScVal,
    reserve_b: ScVal,
}

#[test]
fn test() {
    println!("{:?}", stellar_strkey::Contract::from_string("CB74KXQXEGKGPU5C5FI22X64AGQ63NANVLRZBS22SSCMLJDXNHED72MO").unwrap().0);
}

pub(crate) const ROUTER_CONTRACT_ADDRESS: [u8; 32] = [127, 197, 94, 23, 33, 148, 103, 211, 162, 233, 81, 173, 95, 220, 1, 161, 237, 180, 13, 170, 227, 144, 203, 90, 148, 132, 197, 164, 119, 105, 200, 63];
pub(crate) const FACTORY_CONTRACT_ADDRESS: [u8; 32] = [99, 29, 123, 212, 115, 110, 58, 27, 118, 239, 235, 171, 246, 226, 188, 255, 248, 141, 90, 250, 210, 78, 66, 170, 62, 169, 51, 227, 38, 187, 237, 211];





#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();


    let contract_events = env
    .reader()
    .soroban_events();

    let router_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
    .filter(|event| event.contract_id == Some(Hash(ROUTER_CONTRACT_ADDRESS)))
    .collect();

    let factory_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
    .filter(|event| event.contract_id == Some(Hash(FACTORY_CONTRACT_ADDRESS)))
    .collect();

    router::events::handle_contract_events(&env, router_contract_events);

    factory::events::handle_contract_events(&env, factory_contract_events);


    let rows = env.read::<PairsTable>();

    env.log().debug(
        format!(
            "Rows: {:?}", rows.len()
        ),
        None,
    );

    for row in rows {
        let pair_address: SorobanString = env.from_scval(&row.address);

        env.log().debug(
            format!(
                "Pair {:?}", pair_address
            ),
            None,
        );  
        
        let pair_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
        .filter(|event| {
            let contract_id_str = SorobanString::from_str(&env.soroban(), &stellar_strkey::Contract(event.contract_id.as_ref().unwrap().0).to_string());
            contract_id_str == pair_address
        })
        .collect();

        env.log().debug(
            format!(
                "Pair events: {:?}", pair_contract_events.len()
            ),
            None,
        );  

        pairs::events::handle_contract_events(&env, pair_contract_events, row);
    }
    
    
}