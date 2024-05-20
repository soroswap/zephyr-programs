use zephyr_sdk::{prelude::*, soroban_sdk::{xdr::{ScVal, ContractEvent, Hash, ContractEventBody}, Symbol}, EnvClient, DatabaseDerive};


#[derive(DatabaseDerive, Clone)]
#[with_name("test")]
struct TestTable {
    hello: ScVal,
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

    env.log().debug(
        format!(
            "Processing ledger {} events, total: {}",
            env.reader().ledger_sequence(), contract_events.len()
        ),
        None,
    );

    for event in contract_events {
        let ContractEventBody::V0(event) = &event.body;

        env.log().debug(
            format!(
                "Event with data {:?} and topics {:?}",
               event.data, event.topics
            ),
            None,
        );


    }

}