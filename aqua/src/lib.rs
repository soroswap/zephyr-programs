use soroban_sdk::xdr::ScSymbol;
use zephyr_sdk::{
    prelude::*, 
    soroban_sdk::{contracttype, BytesN, symbol_short, xdr::{LedgerEntryData, ScVal, Hash, ContractEvent, ScString}, Symbol, Address, Vec as SorobanVec, String as SorobanString},  
    EnvClient, DatabaseDerive, PrettyContractEvent, utils
};

mod types;
use types::{
    AddPoolEvent,
    WithdrawEvent,
    SwapEvent,
    DepositEvent
};

fn soroban_string_to_string(env: &EnvClient, string: SorobanString) -> String {
    let sc_val: ScVal = env.to_scval(string);
    if let ScVal::String(ScString(s)) = sc_val {
        s.to_utf8_string().unwrap()
    } else {
        panic!("value is not a string");
    }
}

// https://amm-api.aqua.network/pools/?format=json
// CBQDHNBFBZYE4MKPWBSJOPIYLW4SFSXAXUTSXJN76GNKYVYPCKWC6QUK
// pub(crate) const AQUA_LP_ROUTER_CONTRACT_ADDRESS: [u8; 32] = [96, 51, 180, 37, 14, 112, 78, 49, 79, 176, 100, 151, 61, 24, 93, 185, 34, 202, 224, 189, 39, 43, 165, 191, 241, 154, 172, 87, 15, 18, 172, 47];
const AQUA_LP_ROUTER_CONTRACT_ADDRESS: &'static str = "CBQDHNBFBZYE4MKPWBSJOPIYLW4SFSXAXUTSXJN76GNKYVYPCKWC6QUK";

#[derive(DatabaseDerive, Clone, Debug)]
#[with_name("pairs")]
struct PairsTable {
    address: ScVal,
    token_a: ScVal,
    token_b: ScVal,
    reserve_a: ScVal,
    reserve_b: ScVal,
}

//Aqua Liquidity Pool Router
#[derive(Clone)]
#[contracttype]
pub enum LPRouterDataKey {
    TokensSet(u128),
    TokensSetCounter,
    TokensSetPools(BytesN<32>),
    TokenHash,
    InitPoolPaymentToken,
    InitStandardPoolPaymentAmount,
    InitStablePoolPaymentAmount,
    InitPoolsPaymentsAddress,
    ConstantPoolHash,
    StableSwapPoolHash,
    PoolCounter,
    PoolPlane,
    LiquidityCalculator,
    RewardsConfig,
    RewardTokensList(u64),
    RewardTokensPoolsLiquidity(u64, BytesN<32>),
    Operator,
}

//Aqua Pair
#[derive(Clone)]
#[contracttype]
pub enum PairDataKey {
    TokenA,
    TokenB,
    ReserveA,
    ReserveB,
    FeeFraction,
    Plane,
    Router,
    IsKilledSwap,
    IsKilledDeposit,
    IsKilledClaim,
}

#[contracttype]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
#[repr(u32)]
pub enum PairType {
    Xyk = 0,
}

// pub fn get_from_instance(env: &EnvClient, contract: &str, str_: &str) -> ScVal {
//     let instance = env.read_contract_instance(stellar_strkey::Contract::from_string(contract).unwrap().0).unwrap().unwrap();
//     let LedgerEntryData::ContractData(data) = instance.entry.data else {
//         env.log().error("Damn", None);
        
//         panic!()
//     };
//     let ScVal::ContractInstance(instance) = data.val else {
//         env.log().error("Damn", None);
        
//         panic!()
//     };
//     let val = instance.storage.as_ref().unwrap().0.iter().find(|entry| entry.key == env.to_scval(Symbol::new(env.soroban(), str_)));

//     val.unwrap().val.clone()
// }

// const CONFIG: Symbol = symbol_short!("TokensSetCounter");

#[no_mangle]
pub extern "C" fn on_close() {
    let env = EnvClient::new();
    let lp_router_contract = stellar_strkey::Contract::from_string(&AQUA_LP_ROUTER_CONTRACT_ADDRESS).unwrap().0;
    // let entries = env.read_contract_entries(AQUA_LP_ROUTER_CONTRACT_ADDRESS).unwrap();

    let rows = env.read::<PairsTable>();
    env.log().debug(format!("rows: {:?}", &rows), None);


    // GETTING EVENTS AND LOGGING
    // The problem is that for events and catchups i would need to subscribe to each pair and so on
    // let contract_events = env.reader().soroban_events();

    let lp_router_contract_events: Vec<PrettyContractEvent> = {
        let events = env.reader().pretty().soroban_events();
        events
            .iter()
            .filter_map(|x| {
                if x.contract == lp_router_contract {
                    Some(x.clone())
                } else {
                    None
                }
            })
            .collect()
    };

    // let lp_router_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
    //     .filter(|event| event.contract_id == Some(Hash(lp_router_contract)))
    //     .collect();

    for t_event in lp_router_contract_events {
        env.log().debug(format!("event: {:?}", &t_event), None);
        // let ContractEventBody::V0(event) = t_event.body;

        let action: Symbol = env.from_scval(&t_event.topics[0]);
        let tokens: SorobanVec<Address> = env.from_scval(&t_event.topics[1]);

        if action == Symbol::new(env.soroban(), "deposit") {
        //     // add_supply::<Supply>(&env, &event, contract_address, true);
            env.log().debug("Deposit Event", None);
                        
            handle_add(&env, &action, &t_event, 3, &rows, &tokens)

        } else if action == Symbol::new(env.soroban(), "swap") {
        //     // add_supply::<Supply>(&env, &event, contract_address, false);
            env.log().debug("Swap Event", None);
            
            handle_add(&env, &action, &t_event, 5, &rows, &tokens)

        } else if action == Symbol::new(env.soroban(), "withdraw") {
        //     // add_supply::<Collateral>(&env, &event, contract_address, true);
            env.log().debug("Withdraw Event", None);

            handle_add(&env, &action, &t_event, 3, &rows, &tokens)

        } else if action == Symbol::new(env.soroban(), "add_pool") {
        //     // add_supply::<Collateral>(&env, &event, contract_address, true);
            env.log().debug("Add Pool Event", None);
            
            if let ScVal::Vec(Some(data_vec)) = &t_event.data {

                if data_vec.len() == 4 {
                    let pool_id = data_vec[0].clone();
        
                    let table = PairsTable {
                        address: pool_id,
                        reserve_a: env.to_scval(0),
                        reserve_b: env.to_scval(0),
                        token_a: env.to_scval(tokens.first()),
                        token_b: env.to_scval(tokens.last()),
                    };
        
                    env.log().debug(format!("New action Table: {:?}", table), None);
        
                    if rows.iter().any(|row| row.address == table.address) {
                        env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
                    } else {
                        table.put(&env);
                    }
        
        
                } else {
                    env.log().debug("Unexpected data structure", None);
                }
            } else {
                env.log().debug("Event data is not a Vec", None);
            }
        }
    }

    // env.log().error("Test Error", None);
    // env.log().debug("Test Error", None);
    // env.log().warning("Test Error", None);
    // let pools = {
    //     let mut pools = Vec::new();
    //     let entries = env.read_contract_entries(AQUA_LP_ROUTER_CONTRACT_ADDRESS).unwrap();
    //     for entry in entries {
    //         env.log().debug(format!("entry: {:?}", entry), None);
    //         // if entry.key == env.to_scval(LPRouterDataKey::PoolCounter) {
    //         //     // let LPRouterDataKey::TokensSetPools(address) = entry;
    //         //     let address = 0u128;
    //         pools.push(0u128)
    //         // }
    //     }

    //     pools
    // };
    // env.log().debug(format!("pools: {:?}", pools), None);



    // let entries = env.read_contract_entries(AQUA_LP_ROUTER_CONTRACT_ADDRESS).unwrap();
    // for entry in entries {
    //     env.log().debug(format!("entry: {:?}", entry), None);
    //     // if entry.key == env.to_scval(LPRouterDataKey::PoolCounter) {
    //     //     // let LPRouterDataKey::TokensSetPools(address) = entry;
    //     //     let address = 0u128;
    //     // pools.push(0u128)
    //     // }
    // }

    // for entry in entries {

    //     if entry.key == env.to_scval(LPRouterDataKey::TokensSetCounter) {
    //         env.log().debug(format!("TokensSetCounter Entry: {:?}", entry), None);
    //         let LedgerEntryData::ContractData(data) = entry.entry.data else {panic!()};
    //         env.log().debug(format!("data: {:?}", data), None);

    //         // let ScVal::U128(Some(data)) = data.val else {panic!()};
    //         // env.log().debug(format!("data: {:?}", data), None);

    //     }
    // }
    // let val = get_from_instance(&env, "CBQDHNBFBZYE4MKPWBSJOPIYLW4SFSXAXUTSXJN76GNKYVYPCKWC6QUK", "TokensSetCounter");
    // // let ScVal::U128(tokens_set) = val else {panic!()};
    // env.log().debug(format!("val: {:?}", val), None);




    // for entry in entries {
    //     if let Ok(entry) = env.try_from_scval(&entry.key) {
    //         let LPRouterDataKey::TokensSet(u128) = entry;
    //         // number
    //     }
        // if entry.key == env.to_scval(LPRouterDataKey::PoolCounter) {
        //     env.log().debug(format!("entry: {:?}", entry), None);
            // let LedgerEntryData::ContractData(data) = entry.entry.data else {panic!()};

            // let ScVal::Vec(Some(data)) = data.val else {panic!()};

            // data.iter().for_each(|x| {
            //     let ScVal::Address(addr) = x else {panic!()};

            //     let contract = stellar_strkey::Contract::from_string(&addr.to_string()).unwrap().0;

            //     let pair_entries = env.read_contract_entries(contract).unwrap();

            //     let table = PairsTable {
            //         address: x.clone(),
            //         reserve_a: env.to_scval(0),
            //         reserve_b: env.to_scval(0),
            //         token_a: env.to_scval("0"),
            //         token_b: env.to_scval("0"),
            //     };

            //     for entry in pair_entries {
            //         let LedgerEntryData::ContractData(entry_data) = entry.entry.data else {panic!()};

            //         if entry.key == env.to_scval(CONFIG) {
            //             let config_data : Config = env.from_scval(&entry_data.val);

            //             table.token_a = env.to_scval(config_data.token_a.to_string());
            //             table.token_b = env.to_scval(config_data.token_b.to_string());
            //         }

            //         if entry.key == env.to_scval(PairDataKey::ReserveA){
            //             table.reserve_a = entry_data.val.clone();
            //         }

            //         if entry.key == env.to_scval(PairDataKey::ReserveB){
            //             table.reserve_b = entry_data.val.clone();
            //         }

            //     }

            //     if rows.iter().any(|row| row.address == table.address) {
            //         env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
            //     }else{
            //         table.put(&env);
            //     }

            // });
        // }
        
    // }

   
      
}      

const RESERVEA: Symbol = symbol_short!("ReserveA");
const RESERVEB: Symbol = symbol_short!("ReserveB");

pub(crate) fn handle_add(env: &EnvClient, action: &Symbol, event: &PrettyContractEvent, data_lenght: usize, rows: &Vec<PairsTable>, tokens: &SorobanVec<Address>) {
    if let ScVal::Vec(Some(data_vec)) = &event.data {

        if data_vec.len() == data_lenght {
            let pool_id = data_vec[0].clone();
            let pool_address: Address = env.from_scval(&pool_id);
            let lp_router_contract = stellar_strkey::Contract::from_string(&soroban_string_to_string(env, pool_address.to_string())).unwrap().0;

            // TODO: Should get reserves from the pool_id method "get_reserves"
            // let entries = env.read_contract_entries(lp_router_contract).unwrap();
            // for entry in entries {
                
            //     if entry.key == ScVal::LedgerKeyContractInstance {
            //         env.log().debug(format!("entry: {:?}", entry), None);
            //     }

            // }

            let instance_storage = env.read_contract_instance(lp_router_contract).unwrap();
            
            let mut reserve_a: u128 = 0;
            let mut reserve_b: u128 = 0;

            if let Some(instance) = instance_storage {
                if let LedgerEntryData::ContractData(contract_data_entry) = &instance.entry.data {
                    if let ScVal::ContractInstance(contract_instance) = &contract_data_entry.val {
                        if let Some(storage_map) = &contract_instance.storage {
                            // env.log().debug(format!("storage_map: {:?}", storage_map), None);                            


                            for entry in storage_map.iter() {

                                if let ScVal::Vec(Some(vec)) = &entry.key {
                                    if let Some(ScVal::Symbol(symbol)) = vec.first() {
                            //             env.log().debug(format!("test: {:?}", test), None);

                                        if symbol.to_string() == "ReserveA" {
                                            if let ScVal::U128(parts) = &entry.val {
                                                env.log().debug(format!("LAST: {}", parts.lo), None);
                                                reserve_a = parts.lo.into()
                                            }
                                            // env.log().debug(format!("entry: {:?}", entry.val), None);
                                        //     let ScVal::Address(test) = vec.get(1).unwrap() else {panic!()};
                                        //     env.log().debug(format!("test: {:?}", test), None);
                                        } else if symbol.to_string() == "ReserveB" {
                                            if let ScVal::U128(parts) = &entry.val {
                                                env.log().debug(format!("LAST: {}", parts.lo), None);
                                                reserve_b = parts.lo.into()
                                            }
                                            // env.log().debug(format!("entry: {:?}", entry.val), None);
                                        //     let ScVal::Address(test) = vec.get(1).unwrap() else {panic!()};
                                        //     env.log().debug(format!("test: {:?}", test), None);
                                        }

                                    }
                                }
                            }


                            // for i in 0..storage_map.len() {
                            //     let entry = &storage_map.get(i).unwrap();  // Get the entry by index
                            //     if let ScVal::Vec(Some(vec)) = &entry.key {
                            //         if let Some(ScVal::Symbol(symbol)) = vec.first() {
                            //             match symbol.to_string() {
                            //                 RESERVEA => {
                            //                     if let ScVal::U128(parts) = &entry.val {
                            //                         env.log().debug(format!("ReserveA: {:?}", parts), None);
                            //                     }
                            //                 }
                            //                 RESERVEB => {
                            //                     if let ScVal::U128(parts) = &entry.val {
                            //                         env.log().debug(format!("ReserveB: {:?}", parts), None);
                            //                     }
                            //                 }
                            //                 _ => {} // Handle other cases if needed
                            //             }
                            //         }
                            //     }
                            // }
                        }
                    }
                }
                // let test = env.from_scval(instance.entry.data);
            } else {
                env.log().debug("No instance storage", None);
            }
            

            let table = PairsTable {
                address: pool_id,
                reserve_a: env.to_scval(reserve_a),
                reserve_b: env.to_scval(reserve_b),
                token_a: env.to_scval(tokens.first()),
                token_b: env.to_scval(tokens.last()),
            };

            env.log().debug(format!("New action Table: {:?}", table), None);

            if rows.iter().any(|row| row.address == table.address) {
                env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
            } else {
                table.put(&env);
            }


        } else {
            env.log().debug("Unexpected data structure", None);
        }
    } else {
        env.log().debug("Event data is not a Vec", None);
    }
}