use zephyr_sdk::{
    prelude::*,
    soroban_sdk::{
        Symbol,
        Address,
    },
    EnvClient,
    PrettyContractEvent
};
use crate::router::types;
use crate::LiquidityProviderTable;
use crate::PairsTable;
use crate::ScVal;

pub(crate) fn get_pool_total_supply(env: &EnvClient, pool_address: &Address) -> i128 {
    let rows: Vec<PairsTable> = env.read_filter()
        .column_equal_to_xdr("address", &env.to_scval(pool_address.clone()))
        .read()
        .unwrap_or_default();
    
    if !rows.is_empty() {
        let pair = &rows[0];
        // Get reserve values
        let reserve_a: i128 = env.from_scval(&pair.reserve_a);
        let reserve_b: i128 = env.from_scval(&pair.reserve_b);
        if reserve_a > 0 || reserve_b > 0 {
            return reserve_a + reserve_b;
        }
    }
    0
}

pub(crate) fn get_provider_data(env: &EnvClient, data: &ScVal, event_type: &str) -> LiquidityProviderTable {
    if event_type == "add" {
        let values: types::AddLiquidityEvent = env.from_scval(data);
        let total_supply = get_pool_total_supply(env, &values.pair);
        
        // Calculate percentage (scaled by 1_000_000 for precision)
        let percentage = if total_supply > 0 {
            ((values.liquidity as f64) / (total_supply as f64) * 1_000_000.0) as i128
        } else {
            1_000_000 // First provider = 100%
        };

        LiquidityProviderTable {
            provider_address: env.to_scval(values.to.clone()),
            pool_address: env.to_scval(values.pair.clone()),
            shares: env.to_scval(values.liquidity.clone()),
            percentage: env.to_scval(percentage),
        }
    } else {
        let values: types::RemoveLiquidityEvent = env.from_scval(data);
        let total_supply = get_pool_total_supply(env, &values.pair);
        
        let percentage = if total_supply > values.liquidity {
            ((values.liquidity as f64) / (total_supply as f64) * 1_000_000.0) as i128
        } else {
            0 // removing all liquidity
        };

        LiquidityProviderTable {
            provider_address: env.to_scval(values.to.clone()),
            pool_address: env.to_scval(values.pair.clone()),
            shares: env.to_scval(values.liquidity.clone()),
            percentage: env.to_scval(percentage),
        }
    }
}

pub(crate) fn handle_contract_events(env: &EnvClient, contract_events: Vec<(PrettyContractEvent, [u8; 32])>) {
    for (event, _txhash) in contract_events {
        let action_result = env.try_from_scval::<Symbol>(&event.topics[1]);
        
        match action_result {
            Ok(action) => {
                let data = &event.data;
                if action == Symbol::new(&env.soroban(), "add") {
                    env.log().debug(
                        format!("Event captured: add liquidity for provider"),
                        None,
                    );
                    
                    let table = get_provider_data(&env, data, "add");
                    
                    let rows: Vec<LiquidityProviderTable> = env.read_filter()
                        .column_equal_to_xdr("provider_address", &table.provider_address)
                        .column_equal_to_xdr("pool_address", &table.pool_address)
                        .read()
                        .unwrap_or_default();
                    
                    if !rows.is_empty() {
                        let update = env.update()
                            .column_equal_to_xdr("provider_address", &table.provider_address)
                            .column_equal_to_xdr("pool_address", &table.pool_address)
                            .execute(&table);

                        if update.is_err() {
                            env.log().error(
                                format!("Error updating provider: {:?}", update.err()),
                                None,
                            );
                        }
                    } else {
                        table.put(&env);
                    }
                } else if action == Symbol::new(&env.soroban(), "remove") {
                    env.log().debug(
                        format!("Event captured: remove liquidity for provider"),
                        None,
                    );
                    
                    let table = get_provider_data(&env, data, "remove");
                    
                    let shares: i128 = env.from_scval(&table.shares);
                    if shares > 0 {
                        // Update if there are still shares
                        let update = env.update()
                            .column_equal_to_xdr("provider_address", &table.provider_address)
                            .column_equal_to_xdr("pool_address", &table.pool_address)
                            .execute(&table);

                        if update.is_err() {
                            env.log().error(
                                format!("Error updating provider: {:?}", update.err()),
                                None,
                            );
                        }
                    } else {
                        // If shares are 0, update it to show 0 shares and 0 percentage
                        let update = env.update()
                            .column_equal_to_xdr("provider_address", &table.provider_address)
                            .column_equal_to_xdr("pool_address", &table.pool_address)
                            .execute(&table);

                        if update.is_err() {
                            env.log().error(
                                format!("Error updating provider with zero shares: {:?}", update.err()),
                                None,
                            );
                        }
                    }
                }
            },
            Err(e) => {
                env.log().debug(format!("Failed to convert to Symbol: {:?}", e), None);
                env.log().debug(format!("Failed with event: {:?}", event), None);
            }
        }
    }
}