

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
    println!("{:?}", stellar_strkey::Contract::from_string("CBHNQTKJD76Q55TINIT3PPP3BKLIKIQEXPTQ32GUUU7I3CHBD5JECZLW").unwrap().0);
}

// TESTNET
pub(crate) const ROUTER_CONTRACT_ADDRESS: [u8; 32] = [78, 216, 77, 73, 31, 253, 14, 246, 104, 106, 39, 183, 189, 251, 10, 150, 133, 34, 4, 187, 231, 13, 232, 212, 165, 62, 141, 136, 225, 31, 82, 65];

pub(crate) const FACTORY_CONTRACT_ADDRESS: [u8; 32] = [34, 151, 99, 1, 61, 107, 172, 116, 215, 37, 209, 146, 165, 49, 136, 45, 0, 167, 131, 14, 144, 146, 62, 167, 94, 145, 187, 169, 167, 160, 116, 124];

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


