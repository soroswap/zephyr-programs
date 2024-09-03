#!/bin/bash

# Check if protocol and network arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 [protocol] [network]"
    exit 1
fi

protocol=$1
network=$2

echo Usins $protocol in $network

if [ "$network" == "mainnet" ]; then
    MAINNET_FLAG=true
elif [ "$network" == "testnet" ]; then
    MAINNET_FLAG=false
else
    echo "Error: Invalid network"
    exit 1
fi

# Recover the variable from public/[network].contracts.json
contract_addresses_file="./public/$network.contracts.json"
if [ ! -f "$contract_addresses_file" ]; then
    echo "Error: $contract_addresses_file does not exist"
    exit 1
fi

# Extract the correct contract address based on the protocol
if [ "$protocol" == "soroswap" ]; then
    factory_address=$(jq -r '.soroswap_factory' "$contract_addresses_file")
    router_address=$(jq -r '.soroswap_router' "$contract_addresses_file")

    echo factory_address from json: $factory_address
    echo router_address from json: $router_address

    export SOROSWAP_FACTORY=$factory_address
    export SOROSWAP_ROUTER=$router_address

    echo Using env variable SOROSWAP_FACTORY $SOROSWAP_FACTORY
    echo Using env variable SOROSWAP_ROUTER $SOROSWAP_ROUTER


elif [ "$protocol" == "phoenix" ]; then
    factory_address=$(jq -r '.phoenix_factory' "$contract_addresses_file")

    echo factory_address from json: $factory_address

    export PHOENIX_FACTORY=$factory_address

    echo Using env variable PHOENIX_FACTORY $PHOENIX_FACTORY


elif [ "$protocol" == "aqua" ]; then
    router_address=$(jq -r '.aqua_router' "$contract_addresses_file")
    
    echo router_address from json: $router_address
    
    export AQUA_ROUTER=$router_address

    echo Using env variable AQUA_ROUTER $AQUA_ROUTER

else
    echo "Error: Invalid protocol"
    exit 1
fi

# Change directory to the protocol
cd "$protocol" || exit 1
JWT_VARIABLE="JWT_${protocol}_${network}"


echo "Will deploy to $protocol on $network using contract mainnet flag $MAINNET_FLAG"
echo "---"
echo "Using JWT ${!JWT_VARIABLE} in pwd $(pwd)"
echo "---"

mercury-cli --jwt ${!JWT_VARIABLE} --local false --mainnet $MAINNET_FLAG  deploy


# if [ -z "$contract_address" ]; then
#     echo "Error: Failed to retrieve contract address from $contract_addresses_file"
#     exit 1
# fi

# # Deploy your program using the contract address
# # Add your deployment logic here

# echo "Deployment successful!"