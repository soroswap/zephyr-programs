# zephyr-programs

## Setup
### Setup Environment
0.- Get Your Mercury JWT Tokens.
For this repo youll need 3 accounts and 6 tokens, as each account can manage only one program per network. 
So you will create 1 account for `soroswap`, 1 account for `phoenix` and 1 account for `aqua`.
Then, in https://main.mercurydata.app/ Dashboard click on "Get Access Token" to get yout JWT token.
Make sure to change from Mainnet to Testnet (Menu in the left) in order to get your token for the correct network

1.- Clone this Repo
`git clone https://github.com/soroswap/zephyr-programs.git`

`cd zephyr-programs`

2.- Fill with 3 Mercury JWT Tokens.
Because we will be deploying 3 Zephyr programs, we will need 6 different JWT tokens.

`cp .env.example .env`

Your `.env` should look like this

```bash
JWT_soroswap_mainnet=
JWT_soroswap_testnet=

JWT_phoenix_mainnet=
JWT_phoenix_testnet=

JWT_aqua_mainnet=
JWT_aqua_testnet=

``` 

3.- Build the Docker Image [NEED TO DO IT ONLY ONCE or every time you do changes in the Dockerfile]
`docker compose build`

3.- Run the Docker Container
Be sure to do this after setting your .env, if you do some changes into your .env, you`ll need to re do this again

`docker compose up -d`

4.- Enter to the Docker Terminal

`bash scripts/run.sh`

5.- Install node dependencies
`yarn install`

### Check that the contract addresses you want to index are correctly defined
Check
```bash
public/mainnet.contracts.json
public/testet.contracts.json
```

### Update the contract addresses
Contract addresses can be brought from different repos like 
https://raw.githubusercontent.com/soroswap/core/main/public/mainnet.contracts.json
https://raw.githubusercontent.com/soroswap/core/main/public/testnet.contracts.json
https://raw.githubusercontent.com/soroswap/aggregator/main/public/testnet.contracts.json

In order to update your local contract addresses file do

```bash
bash scripts/update_contract_addresses.sh
```

# Deploy & Catchup:
First we will show you a way to deploy and catchup zephyr programs one by one. If you want to do them all at once (caution, you might overwrite existing tables), jump to next section

## 1.- Deploy your Zephyr Program 
We have prepared a `deploy.sh` bash that will compile the Zephyr Programs using the addresses defined in `public/[NETWORK].contracts.json` depending on the network and the protocol.
You just need to do
```bash
bash scripts/deploy.sh [PROTOCOL] [NETWORK]
```
Where `PROTOCOL in {soroswap, phoenix, aqua}` and `NETWORK  in {mainnet, testnet}`

For example, for Soroswap.Finance on Mainnet youll do
```bash
bash scripts/deploy.sh soroswap mainnet
```

NOTE! This will overwrite any table you have with the same name in the same network!

This will deploy the Zephyr Tables and save them in 
`public/mainnet.zephyr-tables.json`
`public/testnet.zephyr-tables.json`

## 2.- Do Catchup of Factory/Routers Smart Contracts in order to get All Pairs
Currently this will work only for Soroswap
First we need to be updated with all Pairs

In one tab run
```bash
bash scripts/factory_router_catchups.sh mainnet
```
In other tab run
```bash
bash scripts/factory_router_catchups.sh testnet
```
These scripts will start catchups and monitor their status. Also, they will populate `/workspace/.mainnet.catchup_number` and `/workspace/.testnet.catchup_number` files so you can also monitor their status with

```bash
bash scripts/verify_catchup_status.sh mainnet
```
In other tab run
```bash
bash scripts/verify_catchup_status.sh testnet
```
When catchups are ready, these scripts will output something like this:
```bash
Using testnet
Checking catchup status for catchup 22...
Catchup 22 is completed!
```

## 3.- Generate Catchup Scripts for every Pair Contract
Now that our SoroswapFactory has been catched up, our `ssw_pairs` table is up to date so we can get all pairs and generate a script to catch up all pairs contracts!
```bash
yarn pairs:catchups:generate mainnet
yarn pairs:catchups:generate testnet
```
This will generate the files `/workspace/scripts/mainnet.pairs-catchups.sh` and `/workspace/scripts/testnet.pairs-catchups.sh`

## 4.- Run those Catchup Scripts
Then you can finish with
```bash
bash scripts/mainnet.pairs-catchups.sh
bash scripts/testnet.pairs-catchups.sh
```
This will generate a BUNCH of catchup orders that will be stored in 
`/workspace/.testnet.catchups_numbers` and  `/workspace/.mainnet.catchups_numbers`. 
The script, after generating th catchup orders it will check if they are ready.

If you want to check if they are ready later you can do:

```bash
bash scripts/verify_catchups_status.sh testnet
```
or 
```bash
bash scripts/verify_catchups_status.sh mainnet


## Fast Way
1.- Deploy ALL Zephyr Programs in both Mainnet and Testnet at once
```bash
bash scripts/deploy_all.sh
```
This will populate the `public/mainnet.zephyr-tables.json` and the `public/testnet.zephyr-tables.json` files


## Catch up SoroswapFactory and SoroswapRouter
In one tab run
```bash
bash scripts/factory_router_catchups.sh mainnet
```
In other tab run
```bash
bash scripts/factory_router_catchups.sh testnet
```
These scripts will start catchups and monitor their status. Also, they will populate `/workspace/.mainnet.catchup_number` and `/workspace/.testnet.catchup_number` files so you can also monitor their status with

```bash
bash scripts/verify_catchup_status.sh mainnet
```
In other tab run
```bash
bash scripts/verify_catchup_status.sh testnet
```
When catchups are ready, these scripts will output something like this:
```bash
Using testnet
Checking catchup status for catchup 22...
Catchup 22 is completed!
```
## Generate a catchup script for Soroswap Pairs
Not that our SoroswapFactory has been catched up, our `soroswap_pair` table is up to date so we can get all pairs and generate a script to catch up all pairs contracts!
```bash
yarn pairs:catchups:generate mainnet
yarn pairs:catchups:generate testnet
```
This will generate the files `/workspace/scripts/mainnet.pairs-catchups.sh` and `/workspace/scripts/testnet.pairs-catchups.sh`
## Catch up all pairs
Then you can finish with
```bash
bash scripts/mainnet.pairs-catchups.sh
bash scripts/testnet.pairs-catchups.sh
```
This will generate a BUNCH of catchup orders that will be stored in 
`/workspace/.testnet.catchups_numbers` and  `/workspace/.mainnet.catchups_numbers`. 
The script, after generating th catchup orders it will check if they are ready.

If you want to check if they are ready later you can do:

```bash
bash scripts/verify_catchups_status.sh testnet
```
or 
```bash
bash scripts/verify_catchups_status.sh mainnet
```
## Check that everything is working properly
```
yarn test
```


## Slower way: Deploy Zephyr Programs one by one


# Catch Ups
Some Zephyr Programs gets "invoked" for every specific event that is emitted on the contract, like with the `new_pair` event in the `SoroswapFactory` contract, an other Zephyr Programs will just need to get an specific Ledger Entry to get all the necesary information (for example, for Phoenix).

In the case of the "event" based Zephyr Programs, we will need to ask the ZephyrVM to do catch ups for past events. Learn more about this [here](https://docs.mercurydata.app/zephyr-full-customization/general-concepts/accessing-the-ledger-meta-contract-events), [here](https://docs.mercurydata.app/zephyr-full-customization/general-concepts/catchups) and [here](https://blog.xycloo.com/blog/indexing-blend-ybx-pool#catching-up)

We need to do catch ups for:
- SoroswapFactory Contract `new_pair` event
- SoroswapPair Contract `sync` event
- SoroswapRouter `remove`, `add` and `swap` events
- Aqua Router `deposit`, `swap`, `withdraw` and `add_pool` events

Because we can only catch upts SoroswapPairs contract after knowing what pairs do we have we will do this in 2 steps:

1.- Catch ups `SoroswapFactory`, `SoroswapRouter` and `AquaRouter`
```
bash scripts/factory_routr_catchups.sh
```
This will
- subscribe to the contracts
- start catchup
- write the catchup id into [network].catchup_number
- wait until the catchup is ready.


2.- Catch up all the pairs
Once the previous process is ready, now youll need to catchup all the events in every pair contract.
Because we have already catched up all the `new_pair` events, our Pair Table will be up to date.




## Deploy a Zephyr Program MANUAL/HARD WAY

1.- Enter to the program folder
```bash
cd phoenix
```
2.- Verify tests are running ok. 
Zephyr programs need that you define both the CONTRACT ADDRESS of the contract that you will be indexing and the network. The contract address you will be indexing is defined in the `PHOENIX_FACTORY` environmental variable.

Be aware that the required enviornmental variables and their names will depend on the protocol!!!!


```bash
PHOENIX_FACTORY=CB4SVAWJA6TSRNOJZ7W2AWFW46D5VR4ZMFZKDIKXEINZCZEGZCJZCKMI cargo test  -- --nocapture
```

3.- Deploy the zephyr program
When deploying, besides defininf the `PHOENIX_FACTORY` env variable  youll need to define the network with the the `--mainnet` flag. `--mainnet true` means Mainnet, and `--mainnet false` means testnet

For Mainnet youll do
```bash
PHOENIX_FACTORY=CB4SVAWJA6TSRNOJZ7W2AWFW46D5VR4ZMFZKDIKXEINZCZEGZCJZCKMI mercury-cli --jwt $JWT_phoenix_mainnet --local false --mainnet true deploy
```

For Testnet youll do
```bash
PHOENIX_FACTORY=CB4SVAWJA6TSRNOJZ7W2AWFW46D5VR4ZMFZKDIKXEINZCZEGZCJZCKMI mercury-cli --jwt $JWT_phoenix_testnet --local false --mainnet false deploy
```


This will build the program into `./target/wasm32-unknown-unknown/release/[YOUR_PROGRAM].wasm` and it will deploy it into the Zephyr VM.

The outout will be something like this
```bash
Parsing project configuration ...
Building binary ...
Deploying tables ...
[+] Table "zephyr_af0e4a6a909cc9ea0185197f8cfefac3" created successfully
Registering indexes (if any) ...
Registering dashboard (if any) ...
Deploying wasm ...
Reading wasm ./target/wasm32-unknown-unknown/release/zephyr_phoenix.wasm
(Size of program is 318015)
[+] Deployed was successful!
Successfully deployed Zephyr program.
```

Where `zephyr_af0e4a6a909cc9ea0185197f8cfefac3` is the address of your program.


4.- Check your program in https://main.mercurydata.app/
In Dashboard > Manage Program 
Or
https://main.mercurydata.app/custom-ingestion
Start Streaming the logs and check that the Program is INdexing the correct contract address
be aware to use a different JWT token for every program
TODO: Complete readme and enviroment to work with multiple zephyr programs, create a JWT for each program, automate scripts 

