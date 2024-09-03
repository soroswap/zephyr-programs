# zephyr-programs

## Setup

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

3.- Build the Docker Image [NEED TO DO IT ONLY ONCE]
`docker compose build`

3.- Run the Docker Container
Be sure to do this after setting your .env, if you do some changes into your .env, you`ll need to re do this again

`docker compose up -d`

4.- Enter to the Docker Terminal

`bash run.sh`

## Check that the contract addresses you want to index are correctly defined
Check
```bash
public/mainnet.contracts.json
public/testet.contracts.json
```

## Update the contract addresses
Contract addresses can be brought from different repos like 
https://raw.githubusercontent.com/soroswap/core/main/public/mainnet.contracts.json
https://raw.githubusercontent.com/soroswap/core/main/public/testnet.contracts.json
https://raw.githubusercontent.com/soroswap/aggregator/main/public/testnet.contracts.json

In order to update your local contract addresses file do

```bash
bash update_contract_addresses.sh
```

## Deploy a Zephyr Program EASY WAY
We have prepared a `deploy.sh` bash that will compile the Zephyr Programs using the addresses defined in `public/[NETWORK].contract-addresses.json` depending on the network and the protocol.
You just need to do
```bash
bash deploy.sh [PROTOCOL] [NETWORK]
```

For example:
```bash
bash deploy.sh soroswap mainnet
```

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

