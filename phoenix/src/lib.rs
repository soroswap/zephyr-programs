use zephyr_sdk::{prelude::*, soroban_sdk::{contracttype, symbol_short, xdr::{ScVal, LedgerEntryData }, Address, Symbol},  EnvClient, DatabaseDerive};
use std::env;
use std::fs;
// use serde_json::Value;

#[derive(DatabaseDerive, Clone)]
#[with_name("pairs")]
struct PairsTable {
    address: ScVal,
    token_a: ScVal,
    token_b: ScVal,
    reserve_a: ScVal,
    reserve_b: ScVal,
}

// MAINNET CONTRACT: CB4SVAWJA6TSRNOJZ7W2AWFW46D5VR4ZMFZKDIKXEINZCZEGZCJZCKMI
// pub(crate) const FACTORY_CONTRACT_ADDRESS: [u8; 32] = [218, 84, 31, 49, 226, 201, 127, 151, 106, 85, 127, 229, 77, 127, 214, 20, 83, 199, 183, 54, 49, 135, 253, 221, 62, 169, 188, 21, 187, 147, 233, 135]; // TESTNET
// const FACTORY_CONTRACT_ADDRESS: &'static str = "CB4SVAWJA6TSRNOJZ7W2AWFW46D5VR4ZMFZKDIKXEINZCZEGZCJZCKMI";

//Phoenix Factory
#[derive(Clone, Copy)]
#[repr(u32)]
#[contracttype]
pub enum FactoryDataKey {
    Config = 1,
    LpVec = 2,
    Initialized = 3,
}


//Phoenix Pair
#[derive(Clone, Copy)]
#[repr(u32)]
#[contracttype]
pub enum PairDataKey {
    TotalShares = 0,
    ReserveA = 1,
    ReserveB = 2,
    Admin = 3,
    Initialized = 4,
}

#[contracttype]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(u32)]
pub enum PairType {
    Xyk = 0,
}

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct Config {
    pub token_a: Address,
    pub token_b: Address,
    pub share_token: Address,
    pub stake_contract: Address,
    pub pool_type: PairType,
    pub total_fee_bps: i64,
    pub fee_recipient: Address,
    pub max_allowed_slippage_bps: i64,
    pub max_allowed_spread_bps: i64,
    pub max_referral_bps: i64,
}


pub(crate) fn get_contract_from_config_file() -> [u8; 32] {
    // Read the configuration file
    let config_file: &str = "config.json";
    let config_data: std::string::String = fs::read_to_string(config_file).expect("Unable to read config file");

    // Parse the JSON data
    let config_json: serde_json::Value = serde_json::from_str(&config_data).expect("JSON was not well-formatted");

    // Get the network argument passed during the build
    let network = env::var("NETWORK").unwrap_or_else(|_| "no_network".to_string());

    // if network is not testnet or mainnet panics
    if network != "testnet" && network != "mainnet" {
        panic!("Invalid network argument. Please use either testnet or mainnet {:?}", network);
    }

    // Get the contract address for the selected network
    let address_str = config_json[&network].as_str().expect("address not found in json for that network");

    let factory_contract = stellar_strkey::Contract::from_string(&address_str).unwrap().0;

    factory_contract
}



#[test]
fn test() {

    println!("Using address{:?}", get_contract_from_config_file());
}

const CONFIG: Symbol = symbol_short!("CONFIG");

#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();

    let factory_contract = get_contract_from_config_file();

    let entries = env.read_contract_entries(factory_contract).unwrap();

    let rows = env.read::<PairsTable>();

    for entry in entries {
        if entry.key == env.to_scval(FactoryDataKey::LpVec) {
            let LedgerEntryData::ContractData(data) = entry.entry.data else {panic!()};

            let ScVal::Vec(Some(data)) = data.val else {panic!()};

            data.iter().for_each(|x| {
                let ScVal::Address(addr) = x else {panic!()};

                let contract = stellar_strkey::Contract::from_string(&addr.to_string()).unwrap().0;

                let pair_entries = env.read_contract_entries(contract).unwrap();

                let mut table = PairsTable {
                    address: x.clone(),
                    reserve_a: env.to_scval(0),
                    reserve_b: env.to_scval(0),
                    token_a: env.to_scval("0"),
                    token_b: env.to_scval("0"),
                };

                for entry in pair_entries {
                    let LedgerEntryData::ContractData(entry_data) = entry.entry.data else {panic!()};

                    if entry.key == env.to_scval(CONFIG) {
                        let config_data : Config = env.from_scval(&entry_data.val);

                        table.token_a = env.to_scval(config_data.token_a.to_string());
                        table.token_b = env.to_scval(config_data.token_b.to_string());
                    }

                    if entry.key == env.to_scval(PairDataKey::ReserveA){
                        table.reserve_a = entry_data.val.clone();
                    }

                    if entry.key == env.to_scval(PairDataKey::ReserveB){
                        table.reserve_b = entry_data.val.clone();
                    }

                }

                if rows.iter().any(|row| row.address == table.address) {
                    env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
                }else{
                    table.put(&env);
                }

            });
        }
        
    }

   
      
}            


