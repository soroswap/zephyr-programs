#!/bin/bash

# URLs to fetch the JSON data from
MAINNET_SOROSWAP_URL="https://raw.githubusercontent.com/soroswap/core/main/public/mainnet.contracts.json"
TESTNET_SOROSWAP_URL="https://raw.githubusercontent.com/soroswap/core/main/public/testnet.contracts.json"
TESTNET_PHOENIX_URL="https://raw.githubusercontent.com/soroswap/aggregator/main/public/testnet.contracts.json"
MAINNET_COMET_URL="https://raw.githubusercontent.com/blend-capital/blend-utils/refs/heads/main/mainnet.contracts.json"
TESTNET_COMET_URL="https://raw.githubusercontent.com/blend-capital/blend-utils/refs/heads/main/testnet.contracts.json"

echo using MAINNET_SOROSWAP_URL $MAINNET_SOROSWAP_URL
echo using TESTNET_SOROSWAP_URL $TESTNET_SOROSWAP_URL
echo using TESTNET_PHOENIX_URL $TESTNET_PHOENIX_URL
echo using MAINNET_COMET_URL $MAINNET_COMET_URL
echo using TESTNET_COMET_URL $TESTNET_COMET_URL

echo " "
echo "---"
echo " "

# Fetch and extract the data
soroswap_factory_mainnet=$(curl -s $MAINNET_SOROSWAP_URL | jq -r '.ids.factory')
soroswap_router_mainnet=$(curl -s $MAINNET_SOROSWAP_URL | jq -r '.ids.router')

soroswap_factory_testnet=$(curl -s $TESTNET_SOROSWAP_URL | jq -r '.ids.factory')
soroswap_router_testnet=$(curl -s $TESTNET_SOROSWAP_URL | jq -r '.ids.router')

phoenix_factory_testnet=$(curl -s $TESTNET_PHOENIX_URL | jq -r '.ids.phoenix_factory')

comet_pool_mainnet=$(curl -s $MAINNET_COMET_URL | jq -r '.ids.comet')
comet_pool_testnet=$(curl -s $TESTNET_COMET_URL | jq -r '.ids.comet')

echo using soroswap_factory_mainnet $soroswap_factory_mainnet
echo using soroswap_router_mainnet $soroswap_router_mainnet
echo using soroswap_factory_testnet $soroswap_factory_testnet
echo using soroswap_router_testnet $soroswap_router_testnet
echo using phoenix_factory_testnet $phoenix_factory_testnet
echo using comet_pool_mainnet $comet_pool_mainnet
echo using comet_pool_testnet $comet_pool_testnet

echo " "
echo "---"
echo " "

# Update the mainnet contracts without deleting existing fields
jq --arg soroswap_factory_mainnet "$soroswap_factory_mainnet" \
   --arg soroswap_router_mainnet "$soroswap_router_mainnet" \
   --arg comet_pool_mainnet "$comet_pool_mainnet" \
   '. + {soroswap_factory: $soroswap_factory_mainnet, soroswap_router: $soroswap_router_mainnet, comet_pool: $comet_pool_mainnet}' \
   public/mainnet.contracts.json > tmp.json && mv tmp.json public/mainnet.contracts.json

# Update the testnet contracts without deleting existing fields
jq --arg soroswap_factory_testnet "$soroswap_factory_testnet" \
   --arg soroswap_router_testnet "$soroswap_router_testnet" \
   --arg phoenix_factory_testnet "$phoenix_factory_testnet" \
   --arg comet_pool_testnet "$comet_pool_testnet" \
   '. + {soroswap_factory: $soroswap_factory_testnet, soroswap_router: $soroswap_router_testnet, phoenix_factory: $phoenix_factory_testnet,  comet_pool: $comet_pool_testnet}' \
   public/testnet.contracts.json > tmp.json && mv tmp.json public/testnet.contracts.json

echo "Updated JSON files created."
