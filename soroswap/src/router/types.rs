use soroban_sdk::{contracttype, Address, Vec};


// ADD LIQUIDITY EVENT
#[contracttype] 
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct AddLiquidityEvent {
    pub token_a: Address,
    pub token_b: Address,
    pub pair: Address,
    pub amount_a: i128,
    pub amount_b: i128,
    pub liquidity: i128,
    pub to: Address
}


// REMOVE LIQUIDITY EVENT
#[contracttype] 
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct RemoveLiquidityEvent {
    pub token_a: Address,
    pub token_b: Address,
    pub pair: Address,
    pub amount_a: i128,
    pub amount_b: i128,
    pub liquidity: i128,
    pub to: Address
}


// SWAP EVENT
#[contracttype] 
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct SwapEvent {
    pub path: Vec<Address>,
    pub amounts: Vec<i128>,
    pub to: Address
}
