use soroban_sdk::contracttype;

// SYNC EVENT

#[contracttype]
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct SyncEvent {
    pub new_reserve_0: i128,
    pub new_reserve_1: i128,
}