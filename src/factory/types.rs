use soroban_sdk::{contracttype, Address};


// NEW PAIR CREATED EVENT: new_pair
#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct NewPairEvent {
    pub token_0: Address,
    pub token_1: Address,
    pub pair: Address,
    pub new_pairs_length: u32
}
