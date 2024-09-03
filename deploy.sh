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

# Recover the variable from public/[network].contract-addresses.json
contract_addresses_file="./public/$network.contract-addresses.json"
if [ ! -f "$contract_addresses_file" ]; then
    echo "Error: $contract_addresses_file does not exist"
    exit 1
fi

# Extract the correct contract address based on the protocol
if [ "$protocol" == "soroswap" ]; then
    factory_address=$(jq -r '.soroswap_factory' "$contract_addresses_file")
elif [ "$protocol" == "phoenix" ]; then
    factory_address=$(jq -r '.phoenix_factory' "$contract_addresses_file")
    export PHOENIX_FACTORY=$factory_address
    echo $factory_address
    echo Using PHOENIX_FACTORY $PHOENIX_FACTORY
elif [ "$protocol" == "aqua" ]; then
    router_address=$(jq -r '.aqua_router' "$contract_addresses_file")
    export AQUA_ROUTER=$router_address
    echo $router_address
    echo Using AQUA_ROUTER $AQUA_ROUTER

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