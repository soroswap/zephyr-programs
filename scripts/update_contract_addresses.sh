#!/bin/bash

# URLs to fetch the JSON data from
MAINNET_SOROSWAP_URL="https://raw.githubusercontent.com/soroswap/core/main/public/mainnet.contracts.json"
TESTNET_SOROSWAP_URL="https://raw.githubusercontent.com/soroswap/core/main/public/testnet.contracts.json"
TESTNET_PHOENIX_URL="https://raw.githubusercontent.com/soroswap/aggregator/main/public/testnet.contracts.json"

echo using MAINNET_SOROSWAP_URL $MAINNET_SOROSWAP_URL
echo using TESTNET_SOROSWAP_URL $TESTNET_SOROSWAP_URL
echo using TESTNET_PHOENIX_URL $TESTNET_PHOENIX_URL

echo " "
echo "---"
echo " "

# Fetch and extract the data
soroswap_factory_mainnet=$(curl -s $MAINNET_SOROSWAP_URL | jq -r '.ids.factory')
soroswap_router_mainnet=$(curl -s $MAINNET_SOROSWAP_URL | jq -r '.ids.router')

soroswap_factory_testnet=$(curl -s $TESTNET_SOROSWAP_URL | jq -r '.ids.factory')
soroswap_router_testnet=$(curl -s $TESTNET_SOROSWAP_URL | jq -r '.ids.router')

phoenix_factory_testnet=$(curl -s $TESTNET_PHOENIX_URL | jq -r '.ids.phoenix_factory')

echo using soroswap_factory_mainnet $soroswap_factory_mainnet
echo using soroswap_router_mainnet $soroswap_router_mainnet
echo using soroswap_factory_testnet $soroswap_factory_testnet
echo using soroswap_router_testnet $soroswap_router_testnet
echo using phoenix_factory_testnet $phoenix_factory_testnet

echo " "
echo "---"
echo " "

# Update the mainnet contracts without deleting existing fields
jq --arg soroswap_factory_mainnet "$soroswap_factory_mainnet" \
   --arg soroswap_router_mainnet "$soroswap_router_mainnet" \
   '. + {soroswap_factory: $soroswap_factory_mainnet, soroswap_router: $soroswap_router_mainnet}' \
   public/mainnet.contracts.json > tmp.json && mv tmp.json public/mainnet.contracts.json

# Update the testnet contracts without deleting existing fields
jq --arg soroswap_factory_testnet "$soroswap_factory_testnet" \
   --arg soroswap_router_testnet "$soroswap_router_testnet" \
   --arg phoenix_factory_testnet "$phoenix_factory_testnet" \
   '. + {soroswap_factory: $soroswap_factory_testnet, soroswap_router: $soroswap_router_testnet, phoenix_factory: $phoenix_factory_testnet}' \
   public/testnet.contracts.json > tmp.json && mv tmp.json public/testnet.contracts.json

echo "Updated JSON files created."
