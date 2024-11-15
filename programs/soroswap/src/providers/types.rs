use soroban_sdk::contracttype;

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct MintEvent {
    pub amount_0: i128,
    pub amount_1: i128,
    pub liquidity: i128,
}

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct BurnEvent {
    pub amount_0: i128,
    pub amount_1: i128,
    pub liquidity: i128,
}