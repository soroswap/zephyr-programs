use zephyr_sdk::{ 
    prelude::*, 
    soroban_sdk::{
        xdr::{ ScVal }, 
        Symbol,
        String as SorobanString
    }, 
    PrettyContractEvent, 
    EnvClient 
};

use crate::EventsTable;
use crate::router::types;
use crate::router::pricing::{get_xlm_price_in_usd, find_xlm_per_token, get_tracked_volume_usd};

pub(crate) fn get_event_from_swap(env: &EnvClient, data: &ScVal, tx_hash: [u8; 32]) -> EventsTable {
    let values: types::SwapEvent = env.from_scval(data);
                
    let token_a = values.path.get(0).unwrap();
    let token_b = values.path.get(1).unwrap();
    let amount_a = values.amounts.get(0).unwrap();
    let amount_b = values.amounts.get(1).unwrap();

    let token_a_str: SorobanString = env.from_scval(&env.to_scval(token_a.clone()));
    let token_b_str: SorobanString = env.from_scval(&env.to_scval(token_b.clone()));
    
    let amount_a_i128: i128 = env.from_scval(&env.to_scval(amount_a.clone()));
    let amount_b_i128: i128 = env.from_scval(&env.to_scval(amount_b.clone()));

    let xlm_price = get_xlm_price_in_usd(env);
    let token_a_price_usd = find_xlm_per_token(env, token_a_str.clone()) * xlm_price;
    let token_b_price_usd = find_xlm_per_token(env, token_b_str.clone()) * xlm_price;

    let volume_usd = get_tracked_volume_usd(
        env,
        amount_a_i128,
        token_a_str,
        amount_b_i128,
        token_b_str
    );

    let table = EventsTable {
        token_a: env.to_scval(token_a.clone()),
        token_b: env.to_scval(token_b.clone()),
        amount_a: env.to_scval(amount_a.clone()),
        amount_b: env.to_scval(amount_b.clone()),
        account: env.to_scval(values.to.clone()),
        e_type: env.to_scval("swap"),
        timestamp: env.to_scval(env.reader().ledger_timestamp()),
        tx_hash: env.to_scval(tx_hash),
        token_a_price_usd: env.to_scval(token_a_price_usd),
        token_b_price_usd: env.to_scval(token_b_price_usd),
        volume_usd: env.to_scval(volume_usd),
    };

    table
}

pub(crate) fn get_event_from_add(env: &EnvClient, data: &ScVal, tx_hash: [u8; 32]) -> EventsTable {
    let values: types::AddLiquidityEvent = env.from_scval(data);

    let token_a_str: SorobanString = values.token_a.to_string();
    let token_b_str: SorobanString = values.token_b.to_string();
    
    let amount_a_i128: i128 = env.from_scval(&env.to_scval(values.amount_a.clone()));
    let amount_b_i128: i128 = env.from_scval(&env.to_scval(values.amount_b.clone()));

    let xlm_price = get_xlm_price_in_usd(env);
    let token_a_price_usd = find_xlm_per_token(env, token_a_str.clone()) * xlm_price;
    let token_b_price_usd = find_xlm_per_token(env, token_b_str.clone()) * xlm_price;
    let volume_usd = get_tracked_volume_usd(
        env,
        amount_a_i128,
        token_a_str,
        amount_b_i128,
        token_b_str
    );

    let table = EventsTable {
        token_a: env.to_scval(values.token_a.clone()),
        token_b: env.to_scval(values.token_b.clone()),
        amount_a: env.to_scval(values.amount_a.clone()),
        amount_b: env.to_scval(values.amount_b.clone()),
        account: env.to_scval(values.to.clone()),
        e_type: env.to_scval("add"),
        timestamp: env.to_scval(env.reader().ledger_timestamp()),
        tx_hash: env.to_scval(tx_hash),
        token_a_price_usd: env.to_scval(token_a_price_usd),
        token_b_price_usd: env.to_scval(token_b_price_usd),
        volume_usd: env.to_scval(volume_usd),
    };

    table
}

pub(crate) fn get_event_from_remove(env: &EnvClient, data: &ScVal, tx_hash: [u8; 32]) -> EventsTable {
    let values: types::RemoveLiquidityEvent = env.from_scval(data);

    let token_a_str: SorobanString = values.token_a.to_string();
    let token_b_str: SorobanString = values.token_b.to_string();
    
    let amount_a_i128: i128 = env.from_scval(&env.to_scval(values.amount_a.clone()));
    let amount_b_i128: i128 = env.from_scval(&env.to_scval(values.amount_b.clone()));

    let xlm_price = get_xlm_price_in_usd(env);
    let token_a_price_usd = find_xlm_per_token(env, token_a_str.clone()) * xlm_price;
    let token_b_price_usd = find_xlm_per_token(env, token_b_str.clone()) * xlm_price;
    let volume_usd = get_tracked_volume_usd(
        env,
        amount_a_i128,
        token_a_str,
        amount_b_i128,
        token_b_str
    );

    let table = EventsTable {
        token_a: env.to_scval(values.token_a.clone()),
        token_b: env.to_scval(values.token_b.clone()),
        amount_a: env.to_scval(values.amount_a.clone()),
        amount_b: env.to_scval(values.amount_b.clone()),
        account: env.to_scval(values.to.clone()),
        e_type: env.to_scval("remove"),
        timestamp: env.to_scval(env.reader().ledger_timestamp()),
        tx_hash: env.to_scval(tx_hash),
        token_a_price_usd: env.to_scval(token_a_price_usd),
        token_b_price_usd: env.to_scval(token_b_price_usd),
        volume_usd: env.to_scval(volume_usd),
    };
    
    table
}

pub(crate) fn handle_contract_events(env: &EnvClient, contract_events: Vec<(PrettyContractEvent, [u8;32])>) {
    for (event, tx_hash) in contract_events {
        let action: Symbol = env.from_scval(&event.topics[1]);

        let data = &event.data;

        if action == Symbol::new(&env.soroban(), "remove") {
            env.log().debug(
                format!(
                    "Event captured: remove"
                ),
                None,
            );

            let table: EventsTable = get_event_from_remove(&env, data, tx_hash);

            table.put(&env);
        }

        if action == Symbol::new(&env.soroban(), "add") {
            env.log().debug(
                format!(
                    "Event captured: add"
                ),
                None,
            );

            let table: EventsTable = get_event_from_add(&env, data, tx_hash);

            table.put(&env);
        }

        if action == Symbol::new(&env.soroban(), "swap") {
            env.log().debug(
                format!(
                    "Event captured: swap"
                ),
                None,
            );

            let table: EventsTable = get_event_from_swap(&env, data, tx_hash);
            
            table.put(&env);
        }
    }
}