use core::panic;

use soroban_sdk::{
    contracttype,
    xdr::{Hash, ScMap},
};
use stellar_strkey::Strkey;
use zephyr_sdk::{
    prelude::*,
    soroban_sdk::xdr::{LedgerEntryData, ScVal},
    DatabaseDerive, EnvClient,
};

#[contracttype]
#[derive(Clone, Default, Debug, Eq, PartialEq)]
pub struct Record {
    pub balance: i128,
    pub weight: i128,
    pub scalar: i128,
    pub index: u32,
}

// Data Keys for Pool' Storage Data
#[derive(Clone)]
#[contracttype]
pub enum DataKey {
    Factory,       // Address of the Factory Contract
    Controller,    // Address of the Controller Account
    SwapFee,       // i128
    AllTokenVec,   // Vec<Address>
    AllRecordData, // Map<Address, Record>
    TokenShare,    // Address
    TotalShares,   // i128
    PublicSwap,    // bool
    Finalize,      // bool
    Freeze,        // bool
}

#[derive(DatabaseDerive, Clone, Debug)]
#[with_name("comet")]
struct PairsTable {
    address: ScVal,
    token_a: ScVal,
    token_b: ScVal,
    reserve_a: ScVal,
    reserve_b: ScVal,
}

#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();
    let contract_address_str: &'static str = env!("COMET_POOL");

    let contract_address_scval =
        if let Strkey::Contract(contract) = Strkey::from_string(&contract_address_str).unwrap() {
            ScVal::Address(soroban_sdk::xdr::ScAddress::Contract(Hash(contract.0)))
        } else {
            panic!("pool address can't be decoded")
        };

    env.log().debug(
        format!(
            "Executing Zephyr Program. Indexing Comet Contract: {:?}",
            &contract_address_str
        ),
        None,
    );

    let pool_contract = stellar_strkey::Contract::from_string(&contract_address_str)
        .unwrap()
        .0;

    let rows = env.read::<PairsTable>();
    env.log().debug(format!("rows: {:?}", &rows), None);

    let entry = env
        .read_full_contract_entry_by_key(pool_contract, DataKey::AllRecordData)
        .unwrap()
        .unwrap();
    let LedgerEntryData::ContractData(data) = entry.entry.data else {
        panic!()
    };

    let ScVal::Map(Some(ScMap(map_vec))) = data.val else {
        panic!()
    };

    let token_0 = map_vec.get(0).unwrap().key.clone();
    let token_1 = map_vec.get(1).unwrap().key.clone();

    let ScVal::Map(Some(ScMap(record_0_vec))) = map_vec.get(0).unwrap().val.clone() else {
        panic!()
    };
    let ScVal::Map(Some(ScMap(record_1_vec))) = map_vec.get(1).unwrap().val.clone() else {
        panic!()
    };

    let reserve_0 = record_0_vec.first().unwrap().val.clone();
    let reserve_1 = record_1_vec.first().unwrap().val.clone();

    let table = PairsTable {
        address: contract_address_scval,
        reserve_a: reserve_0,
        reserve_b: reserve_1,
        token_a: token_0,
        token_b: token_1,
    };

    if rows.iter().any(|row| row.address == table.address) {
        env.update()
            .column_equal_to_xdr("address", &table.address)
            .execute(&table)
            .ok();
    } else {
        table.put(&env);
    };
}
