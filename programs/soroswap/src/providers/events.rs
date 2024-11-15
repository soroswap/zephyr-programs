use zephyr_sdk::{ prelude::*, soroban_sdk::{xdr::{ ScVal }, Address, Symbol}, PrettyContractEvent, EnvClient };

use thiserror::Error;
use crate::ProvidersTable;

#[derive(Error, Debug)]
pub enum ProviderError {
    #[error("Invalid liquidity value: {0}")]
    InvalidLiquidity(String),
    #[error("Invalid total supply: {0}")]
    InvalidTotalSupply(String),
    #[error("Failed to convert address: {0}")]
    AddressConversionError(String),
    #[error("Failed to process event data: {0}")]
    EventDataError(String),
    #[error("Failed to process action: {0}")]
    ActionProcessingError(String),
}

type Result<T> = std::result::Result<T, ProviderError>;

/// Validates and processes provider data
fn validate_provider_data(liquidity: i128, total_supply: i128) -> Result<f64> {
    if liquidity < 0 {
        return Err(ProviderError::InvalidLiquidity(
            "Liquidity cannot be negative".to_string(),
        ));
    }

    if total_supply <= 0 {
        return Err(ProviderError::InvalidTotalSupply(
            "Total supply must be positive".to_string(),
        ));
    }

    // Calculate share percentage with checked arithmetic
    let share_percentage = (liquidity as f64)
        .checked_div(total_supply as f64)
        .ok_or_else(|| ProviderError::InvalidLiquidity("Division overflow".to_string()))?
        * 100.0;

    Ok(share_percentage)
}

pub(crate) fn get_provider_from_mint(
    env: &EnvClient,
    data: &ScVal,
    address: ScVal,
    pool_address: ScVal,
    total_supply: i128,
    tx_hash: [u8; 32],
) -> Result<ProvidersTable> {
    let values: types::MintEvent = env.from_scval(data).map_err(|e| {
        ProviderError::EventDataError(format!("Failed to deserialize mint event: {}", e))
    })?;

    let share_percentage = validate_provider_data(values.liquidity, total_supply)?;

    Ok(ProvidersTable {
        provider_address: address,
        pool_address,
        shares: env.to_scval(values.liquidity),
        share_percentage,
        token_a_amount: env.to_scval(values.amount_0),
        token_b_amount: env.to_scval(values.amount_1),
        timestamp: env.to_scval(env.reader().ledger_timestamp()),
        action: "MINT".to_string(),
        tx_hash: env.to_scval(tx_hash.to_vec()),
    })
}

pub(crate) fn get_provider_from_burn(
    env: &EnvClient,
    data: &ScVal,
    address: ScVal,
    pool_address: ScVal,
    total_supply: i128,
    tx_hash: [u8; 32],
) -> Result<ProvidersTable> {
    let values: types::BurnEvent = env.from_scval(data).map_err(|e| {
        ProviderError::EventDataError(format!("Failed to deserialize burn event: {}", e))
    })?;

    let share_percentage = validate_provider_data(values.liquidity, total_supply)?;

    Ok(ProvidersTable {
        provider_address: address,
        pool_address,
        shares: env.to_scval(values.liquidity),
        share_percentage,
        token_a_amount: env.to_scval(values.amount_0),
        token_b_amount: env.to_scval(values.amount_1),
        timestamp: env.to_scval(env.reader().ledger_timestamp()),
        action: "BURN".to_string(),
        tx_hash: env.to_scval(tx_hash.to_vec()),
    })
}

pub(crate) fn handle_contract_events(
    env: &EnvClient,
    contract_events: Vec<(PrettyContractEvent, [u8; 32])>,
    pool_address: ScVal,
    total_supply: i128,
) {
    for (event, tx_hash) in contract_events {
        match process_event(env, event, &pool_address, total_supply, tx_hash) {
            Ok(_) => {
                env.log().debug("Successfully processed event", None);
            }
            Err(e) => {
                env.log().error(
                    format!("Failed to process event: {}", e),
                    Some(format!("{:?}", e)),
                );
                // Continue processing other events even if one fails
                continue;
            }
        }
    }
}

fn process_event(
    env: &EnvClient,
    event: PrettyContractEvent,
    pool_address: &ScVal,
    total_supply: i128,
    tx_hash: [u8; 32],
) -> Result<()> {
    let action = env
        .try_from_scval::<Symbol>(&event.topics[1])
        .map_err(|e| ProviderError::ActionProcessingError(format!("Invalid action: {}", e)))?;

    let provider_address = match event.topics.get(2) {
        Some(address_scval) => env
            .try_from_scval::<Address>(address_scval)
            .map_err(|e| ProviderError::AddressConversionError(format!("Invalid address: {}", e)))?,
        None => {
            return Err(ProviderError::AddressConversionError(
                "Missing provider address".to_string(),
            ))
        }
    };

    let data = &event.data;
    let provider_scval = env.to_scval(provider_address);

    match action.as_ref() {
        "mint" => {
            let table = get_provider_from_mint(
                env,
                data,
                provider_scval,
                pool_address.clone(),
                total_supply,
                tx_hash,
            )?;
            table.put(env);
            env.log().debug("Provider mint event recorded", None);
        }
        "burn" => {
            let table = get_provider_from_burn(
                env,
                data,
                provider_scval,
                pool_address.clone(),
                total_supply,
                tx_hash,
            )?;
            table.put(env);
            env.log().debug("Provider burn event recorded", None);
        }
        _ => {
            env.log().debug(format!("Unhandled action: {:?}", action), None);
        }
    }

    Ok(())
}