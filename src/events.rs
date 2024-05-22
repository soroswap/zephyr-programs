use zephyr_sdk::{ soroban_sdk::xdr::ScVal, EnvClient };

use crate::{ types, EventsTable };



pub(crate) fn get_event_from_swap(env: &EnvClient, data: &ScVal) -> EventsTable {
    let values: types::SwapEvent = env.from_scval(data);
                
    let token_a = values.path.get(0).unwrap();
    let token_b = values.path.get(1).unwrap();
    let amount_a = values.amounts.get(0).unwrap();
    let amount_b = values.amounts.get(1).unwrap();

    let table = EventsTable {
        token_a: env.to_scval(token_a.clone()),
        token_b: env.to_scval(token_b.clone() ),
        amount_a: env.to_scval(amount_a.clone()),
        amount_b: env.to_scval(amount_b.clone()),
        account: env.to_scval(values.to.clone()),
        e_type: env.to_scval("swap"),
    };

    table
}

pub(crate) fn get_event_from_add(env: &EnvClient, data: &ScVal) -> EventsTable {
    let values: types::AddLiquidityEvent = env.from_scval(data);

    let table = EventsTable {
        token_a: env.to_scval(values.token_a.clone()),
        token_b: env.to_scval(values.token_b.clone() ),
        amount_a: env.to_scval(values.amount_a.clone()),
        amount_b: env.to_scval(values.amount_b.clone()),
        account: env.to_scval(values.to.clone()),
        e_type: env.to_scval("add"),
    };

    table
}

pub(crate) fn get_event_from_remove(env: &EnvClient, data: &ScVal) -> EventsTable {
    let values: types::RemoveLiquidityEvent = env.from_scval(data);

    let table = EventsTable {
        token_a: env.to_scval(values.token_a.clone()),
        token_b: env.to_scval(values.token_b.clone() ),
        amount_a: env.to_scval(values.amount_a.clone()),
        amount_b: env.to_scval(values.amount_b.clone()),
        account: env.to_scval(values.to.clone()),
        e_type: env.to_scval("remove"),
    };
    
    table
}