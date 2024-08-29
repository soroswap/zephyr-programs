use zephyr_sdk::{
    prelude::*, 
    soroban_sdk::{contracttype, BytesN, xdr::{ContractEventBody, ScVal, Hash, ContractEvent}, Symbol, Address, Vec as SorobanVec},  
    EnvClient, DatabaseDerive
};

mod types;
use types::{
    AddPoolEvent,
    WithdrawEvent,
    SwapEvent,
    DepositEvent
};

// https://amm-api.aqua.network/pools/?format=json
// CBQDHNBFBZYE4MKPWBSJOPIYLW4SFSXAXUTSXJN76GNKYVYPCKWC6QUK
pub(crate) const AQUA_LP_ROUTER_CONTRACT_ADDRESS: [u8; 32] = [96, 51, 180, 37, 14, 112, 78, 49, 79, 176, 100, 151, 61, 24, 93, 185, 34, 202, 224, 189, 39, 43, 165, 191, 241, 154, 172, 87, 15, 18, 172, 47];

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
    // let entries = env.read_contract_entries(AQUA_LP_ROUTER_CONTRACT_ADDRESS).unwrap();

    let rows = env.read::<PairsTable>();
    env.log().debug(format!("rows: {:?}", &rows), None);


    // GETTING EVENTS AND LOGGING
    // The problem is that for events and catchups i would need to subscribe to each pair and so on
    let contract_events = env.reader().soroban_events();
    let lp_router_contract_events: Vec<ContractEvent> = contract_events.clone().into_iter()
        .filter(|event| event.contract_id == Some(Hash(AQUA_LP_ROUTER_CONTRACT_ADDRESS)))
        .collect();
    for t_event in lp_router_contract_events {
        env.log().debug(format!("event: {:?}", &t_event), None);
        let ContractEventBody::V0(event) = t_event.body;

        let action: Symbol = env.from_scval(&event.topics[0]);
        let tokens: SorobanVec<Address> = env.from_scval(&event.topics[1]);

        if action == Symbol::new(env.soroban(), "deposit") {
            // add_supply::<Supply>(&env, &event, contract_address, true);
            env.log().debug("Deposit Event", None);
                        
            let data: DepositEvent = env.from_scval(&event.data);

            let table = PairsTable {
                address: env.to_scval(data.pool_id.clone()),
                reserve_a: env.to_scval(0),
                reserve_b: env.to_scval(0),
                token_a: env.to_scval(tokens.first()),
                token_b: env.to_scval(tokens.last()),
            };

            if rows.iter().any(|row| row.address == table.address) {
                env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
            } else {
                table.put(&env);
            }

        } else if action == Symbol::new(env.soroban(), "swap") {
            // add_supply::<Supply>(&env, &event, contract_address, false);
            env.log().debug("Swap Event", None);
            
            let data: SwapEvent = env.from_scval(&event.data);

            let table = PairsTable {
                address: env.to_scval(data.pool_id.clone()),
                reserve_a: env.to_scval(0),
                reserve_b: env.to_scval(0),
                token_a: env.to_scval(tokens.first()),
                token_b: env.to_scval(tokens.last()),
            };

            if rows.iter().any(|row| row.address == table.address) {
                env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
            } else {
                table.put(&env);
            }

        } else if action == Symbol::new(env.soroban(), "withdraw") {
            // add_supply::<Collateral>(&env, &event, contract_address, true);
            env.log().debug("Withdraw Event", None);

            let data: WithdrawEvent = env.from_scval(&event.data);

            let table = PairsTable {
                address: env.to_scval(data.pool_id.clone()),
                reserve_a: env.to_scval(0),
                reserve_b: env.to_scval(0),
                token_a: env.to_scval(tokens.first()),
                token_b: env.to_scval(tokens.last()),
            };

            if rows.iter().any(|row| row.address == table.address) {
                env.update().column_equal_to_xdr("address", &table.address).execute(&table).ok();
            } else {
                table.put(&env);
            }

        } else if action == Symbol::new(env.soroban(), "add_pool") {
            // add_supply::<Collateral>(&env, &event, contract_address, true);
            env.log().debug("Add Pool Event", None);
            let data: AddPoolEvent = env.from_scval(&event.data);

            let table = PairsTable {
                address: env.to_scval(data.pool_address.clone()),
                reserve_a: env.to_scval(0),
                reserve_b: env.to_scval(0),
                token_a: env.to_scval(tokens.first()),
                token_b: env.to_scval(tokens.last()),
            };

            table.put(&env);
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


