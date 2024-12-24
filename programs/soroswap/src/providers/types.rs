pub struct AddLiquidityEvent {
    pub token_a: Address,
    pub token_b: Address,
    pub pair: Address,
    pub amount_a: i128,
    pub amount_b: i128,
    pub to: Address,
    pub liquidity: i128,
}

pub struct RemoveLiquidityEvent {
    pub token_a: Address,
    pub token_b: Address,
    pub pair: Address,
    pub amount_a: i128,
    pub amount_b: i128,
    pub to: Address,
    pub liquidity: i128,
}