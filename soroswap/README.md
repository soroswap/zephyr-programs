# zephyr-indexer

inside the docker image setup the JWT for soroswap zephyr program

`export MERCURY_JWT=<YOUR_MERCURY_JWT_TOKEN>`

`mercury-cli --jwt $MERCURY_JWT --local false --mainnet false deploy`

## Steps for the deploy

### 1. Get and Set Your Mercury Token

```bash
cd mercury-helpers
yarn token
cd ..
export MERCURY_JWT=your_token_here
```

Replace `your_token_here` with your actual Mercury JWT token.

### 2. Deploy Zephyr Program

```bash
mercury-cli --jwt $MERCURY_JWT --local false --mainnet true deploy
```

- To deploy in testnet, change `--mainnet` to `false`.

### 3. Run Catchups for Router and Factory

```bash
mercury-cli --jwt $MERCURY_JWT --local false --mainnet true catchup --contracts "router_address"
mercury-cli --jwt $MERCURY_JWT --local false --mainnet true catchup --contracts "factory_address"
```

You can monitor the catchup progress at:

`https://mainnet.mercurydata.app/catchups/{catchup_id}`

Wait until all catchups are completed before proceeding.

### 4. Subscribe to All Pairs

Once the router and factory catchups are completed:

1. Go to `mercury-helpers/src/scripts/pairs-subscribe.ts`.
2. Choose between `mainnetPairsTable` or `testnetPairsTable` to subscribe to the pairs you desire.
3. Run the subscription command:

```bash
cd mercury-helpers
yarn pairs:subscribe
```

### 5. Run Catchups for All Pairs

After subscribing to the pairs, run:

```bash
yarn pairs:catchups
```

This will generate `pairs-catchups-mainnet.sh` with the commands needed to catch up each pair. To avoid overloading the system:

- Run the first 5 pairs and wait until they complete.
- Then, proceed with the next set of 5 pairs, and so on. (to avoid mercury crash)

Once all catchups are completed, your data should be fully synchronized.

---

**Next Steps:**

- Verify that all data is correct and synchronized.
