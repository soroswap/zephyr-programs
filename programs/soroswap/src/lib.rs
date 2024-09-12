

use zephyr_sdk::{prelude::*, soroban_sdk::{xdr::{ScVal, ContractEvent, Hash }, String as SorobanString, Address}, PrettyContractEvent,  EnvClient, DatabaseDerive};

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
    tx_hash: ScVal,
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
    let factory_address_str: &'static str = env!("SOROSWAP_FACTORY");
    let router_address_str: &'static str = env!("SOROSWAP_ROUTER");
    println!("{:?}", factory_address_str);
    println!("{:?}", router_address_str);
}

#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();

    let factory_address_str: &'static str = env!("SOROSWAP_FACTORY");
    let router_address_str: &'static str = env!("SOROSWAP_ROUTER");

    env.log().debug(format!("✅Indexing Soroswap Factory: {:?}", &factory_address_str), None);
    env.log().debug(format!("✅Indexing Soroswap Router: {:?}", &router_address_str), None);

    let factory_address_bytes: [u8; 32]=stellar_strkey::Contract::from_string(factory_address_str).unwrap().0;
    let router_address_bytes: [u8; 32]=stellar_strkey::Contract::from_string(router_address_str).unwrap().0;

    /* let contract_events = env
    .reader()
    .soroban_events();

    let factory_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
    .filter(|event| event.contract_id == Some(Hash(factory_address_bytes)))
    .collect(); 

    let router_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
    .filter(|event| event.contract_id == Some(Hash(router_address_bytes)))
    .collect(); */

    let contract_events_with_txhash: Vec<(PrettyContractEvent, [u8; 32])> = env.reader().pretty().soroban_events_and_txhash();

    let filtered_router_events_with_txhash: Vec<(PrettyContractEvent, [u8; 32])> = contract_events_with_txhash.clone().into_iter()
    .filter(|(event, _txhash)| event.raw.contract_id == Some(Hash(router_address_bytes))).collect();

    let filtered_factory_events_with_txhash: Vec<(PrettyContractEvent, [u8; 32])> = contract_events_with_txhash.clone().into_iter()
    .filter(|(event, _txhash)| event.raw.contract_id == Some(Hash(factory_address_bytes))).collect();

    //handle the events from the router contract
    router::events::handle_contract_events(&env, filtered_router_events_with_txhash);

    //handle the events from the factory contract
    factory::events::handle_contract_events(&env, filtered_factory_events_with_txhash);



    // At this point our PairsTable is up to date. Now we can handle the events from the Pairs
    let rows = env.read::<PairsTable>();

    for row in rows {

        let pair_address: Address = env.from_scval(&row.address);

        // We filter to see if there is any event related to our Pair
        let pair_contract_events: Vec<ContractEvent> = contract_events_with_txhash.clone().into_iter()
        .filter(|(event, _txhash)| {
            let contract_id_str = SorobanString::from_str(&env.soroban(), &stellar_strkey::Contract(event.raw.contract_id.as_ref().unwrap().0).to_string());
            contract_id_str == pair_address.to_string()
        })
        .collect();
    
        // Handle the Event
        pairs::events::handle_contract_events(&env, pair_contract_events, row);
        
    }
    
    
}


