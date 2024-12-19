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
