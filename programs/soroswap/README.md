# Zephyr Program for Soroswap AMM

This program will create 3 tables as defined in the `zephyr.toml` file:

- The Soroswap Router Events Table `ssw_rt_ev`
- The Soroswap Pairs Table `ssw_pairs`
- The Soroswap Reserves Changes Table `ssw_rs_ch`

These tables are filled like this:

- The Router Events Table is easy, because it records every event in the `SoroswapRouter` contract, nothing more, nothing less. It records every thime there is a `remove` (remove liquidity), `add` (add liquidity) and `swap`.
```rust
router::events::handle_contract_events(&env, filtered_router_events_with_txhash);
```

- The Soroswap Pairs Table is being filled evey time there is a `new_pair` event in the `SoroswapFactory` contract.
```rust
factory::events::handle_contract_events(&env, filtered_factory_events_with_txhash);
```

And finally, after we have both the Router Events Table and the Pairs Table, up to dated, if there is any event emited by any of our pairs, we will handle all `sync` events.

```rust
pairs::events::handle_contract_events(&env, pair_contract_events, pair);
```

The `sync` event at a Liquidity Pool level it gets executed after every `deposit`, `swap` or `withdraw` at the `SoroswapPair` contract.
Every time there is a `sync` event, the corresponding row of the Soroswap Pair Table gets updated!



# Pricing Module in Soroswap (`programs/soroswap/src/pairs/pricing.rs`)
---

## Definitions 

- **DECIMALS**: Defines the number of digits for decimal handling.

- **XLM-USDC and XLM-USDX**: These are stablecoin pairs with XLM that serve as a reference to determine the value of XLM in USD terms.

- **WHITELIST**: A list of token addresses to be included in the calculations, aiming to avoid using irrelevant tokens in price analysis. Currently, all tokens from the list at [https://raw.githubusercontent.com/soroswap/token-list/main/tokenList.json](https://raw.githubusercontent.com/soroswap/token-list/main/tokenList.json) are used, which intends to provide a set of tokens considered secure.

  In Soroswap, the two largest pools (XLM-USCX and XLM-USDC) hold approximately 400,000 USD and 300,000 USD respectively, representing over 90% of the TVL. The plan is to include all currently used tokens in the `WHITELIST` and potentially filter only the most relevant ones in the future.

- **MINIMUM_USD_THRESHOLD_NEW_PAIRS**: Represents the minimum liquidity threshold in USD required for a new pair to be considered valid for calculations. This ensures that pairs with very low liquidity do not introduce significant errors in prices or metrics. On Uniswap, it is set at 400,000 USD. For Soroswap, given the current size of the pools, the initial plan is to have no minimum threshold.

- **MINIMUM_LIQUIDITY_THRESHOLD_XLM**: Defines the minimum XLM liquidity required for a pair to be considered in price calculations. Similar to the USD threshold, but expressed in XLM. Its purpose is to ensure that pairs with very low liquidity do not distort price calculations and to prevent inactive pairs with irrelevant values from being included. On Uniswap, it is set at 2 ETH; for Soroswap, there will initially be no minimum threshold.

## Functions (English)

### `get_xlm_price_in_usd`

**Description**: Calculates the price of XLM in USD terms using the USDC-XLM and USDX-XLM pairs.

**Inputs**:  
- `env`: A reference to the `EnvClient` environment to retrieve pair information.

**Output**:  
- The price of XLM in USD.

**Logic**:  
1. Reads the reserves from the USDC-XLM and USDX-XLM pairs.  
2. Calculates individual prices and their weights based on liquidity.  
3. Returns the weighted price if both pairs are available, the direct price of a single pair if only one exists, or zero if none are available.

---

### `find_xlm_per_token`

**Description**: Finds the value of XLM for each token in the `WHITELIST`.

**Inputs**:  
- `env`: The `EnvClient` environment to retrieve pairs.  
- `token_address`: The target token address.

**Output**:  
- The price of the token in terms of XLM.

**Logic**:  
1. Searches for pairs related to the token in the Mercury pairs table.  
2. Calculates the price based on available reserves.  
3. Returns 0 if the token does not have a valid pair with sufficient liquidity.

---

### `get_tracked_volume_usd`

**Description**: Calculates the tracked volume in USD for a given swap.

**Inputs**:  
- `env`: The `EnvClient` environment.  
- `token_amount0`, `token_amount1`: The amounts of tokens swapped.  
- `token0_address`, `token1_address`: The addresses of the tokens.

**Output**:  
- The total tracked volume in USD for the swapped tokens.

**Logic**:  
1. Converts each token to XLM using `find_xlm_per_token`.  
2. Converts XLM to USD using `get_xlm_price_in_usd`.  
3. Sums the volumes weighted by price and `WHITELIST`.

---

### `get_tracked_liquidity_usd`

**Description**: Calculates the tracked liquidity in USD.

**Inputs**:  
- `env`: The `EnvClient` environment.  
- `token_amount0`, `token_amount1`: The amounts of tokens in the pool.  
- `token0_address`, `token1_address`: The addresses of the tokens.

**Output**:  
- The total liquidity in USD.

**Logic**:  
1. Similar to `get_tracked_volume_usd`, but considers doubling the weighting for whitelisted assets.  
2. Converts each token to XLM and then to USD.  
3. Calculates the total liquidity based on the weighted sum.
