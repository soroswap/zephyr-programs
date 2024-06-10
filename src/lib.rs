

use zephyr_sdk::{prelude::*, soroban_sdk::{xdr::{ScVal, ContractEvent, Hash }, String as SorobanString, Address},  EnvClient, DatabaseDerive};

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
    timestamp: ScVal,
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

#[derive(DatabaseDerive, Clone)]
#[with_name("rsv_ch")]
struct ReservesChangeTable {
    address: ScVal,
    reserve_a: ScVal,
    reserve_b: ScVal,
    timestamp: ScVal,
}

#[test]
fn test() {
    println!("{:?}", stellar_strkey::Contract::from_string("CA4HEQTL2WPEUYKYKCDOHCDNIV4QHNJ7EL4J4NQ6VADP7SYHVRYZ7AW2").unwrap().0);
}

// TESTNET
pub(crate) const ROUTER_CONTRACT_ADDRESS: [u8; 32] = [127, 197, 94, 23, 33, 148, 103, 211, 162, 233, 81, 173, 95, 220, 1, 161, 237, 180, 13, 170, 227, 144, 203, 90, 148, 132, 197, 164, 119, 105, 200, 63];
pub(crate) const FACTORY_CONTRACT_ADDRESS: [u8; 32] = [99, 29, 123, 212, 115, 110, 58, 27, 118, 239, 235, 171, 246, 226, 188, 255, 248, 141, 90, 250, 210, 78, 66, 170, 62, 169, 51, 227, 38, 187, 237, 211];

//MAINNET
// pub(crate) const ROUTER_CONTRACT_ADDRESS: [u8; 32] = [13, 213, 199, 16, 234, 106, 74, 35, 179, 34, 7, 253, 19, 14, 173, 249, 201, 206, 137, 159, 67, 8, 233, 62, 79, 254, 83, 251, 175, 16, 138, 4];
// pub(crate) const FACTORY_CONTRACT_ADDRESS: [u8; 32] = [56, 114, 66, 107, 213, 158, 74, 97, 88, 80, 134, 227, 136, 109, 69, 121, 3, 181, 63, 34, 248, 158, 54, 30, 168, 6, 255, 203, 7, 172, 113, 159];


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

    for row in rows {

        let pair_address: Address = env.from_scval(&row.address);

        let pair_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
        .filter(|event| {
            let contract_id_str = SorobanString::from_str(&env.soroban(), &stellar_strkey::Contract(event.contract_id.as_ref().unwrap().0).to_string());
            contract_id_str == pair_address.to_string()
        })
        .collect();
    
        pairs::events::handle_contract_events(&env, pair_contract_events, row);
        
    }
    
    
}


