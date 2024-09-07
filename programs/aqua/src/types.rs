use soroban_sdk::{contracttype, Address, Vec, Symbol, Val, BytesN};

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct AddPoolEvent {
    pub pool_address: Address,
    pub pool_type: Symbol,
    pub subpool_salt: BytesN<32>,
    pub init_args: Vec<Val>,
}

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct WithdrawEvent {
    pub pool_id: Address,
    pub amounts: Vec<u128>,
    pub share_amount: u128,
}

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct SwapEvent {
    pub pool_id: Address,
    pub token_in: Address,
    pub token_out: Address,
    pub in_amount: u128,
    pub out_amt: u128,
}

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct DepositEvent {
    pub pool_id: Address,
    pub amounts: Vec<u128>,
    pub share_amount: u128,
}