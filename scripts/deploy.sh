#!/bin/bash

# Check if protocol, network and dev/prod arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 [protocol] [network] [dev|prod]"
    exit 1
fi

protocol=$1
network=$2
environment=$3
force=$4

echo Using $protocol in $network with envirioment $environment

## Check if the protocol is valid
if [ "$network" == "mainnet" ]; then
    MAINNET_FLAG=true
elif [ "$network" == "testnet" ]; then
    MAINNET_FLAG=false
else
    echo "Error: Invalid network"
    exit 1
fi
echo Using mainnet flag $MAINNET_FLAG

## Check if environment is valid
if [ "$environment" == "dev" ]; then
    JWT_VARIABLE="JWT_token_${network}_DEVELOPMENT"
    zephyr_programs_addresses_file="/workspace/.dev.tables/$network.zephyr-tables.json"
    ## create folder .dev.tables if it does not exist
    mkdir -p /workspace/.dev.tables
elif [ "$environment" == "prod" ]; then
    JWT_VARIABLE="JWT_token_${network}"
    zephyr_programs_addresses_file="/workspace/public/$network.zephyr-tables.json"
else
    echo "Error: Invalid environment"
    exit 1 
fi

## Check if force is valid
if [ "$force" == "force" ]; then
    FORCE_FLAG=true
else
    FORCE_FLAG=false
fi
echo Using JWT variable $JWT_VARIABLE
echo Using zephyr tables file $zephyr_programs_addresses_file
echo "Using JWT ${!JWT_VARIABLE}"
echo "⚠️ Using force flag $FORCE_FLAG ⚠️"




# Recover the variable from public/[network].contracts.json
contract_addresses_file="/workspace/public/$network.contracts.json"
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

elif [ "$protocol" == "comet" ]; then
    address=$(jq -r '.comet_pool' "$contract_addresses_file")
    
    echo address from json: $address
    
    export COMET_POOL=$address

    echo Using env variable COMET_POOL $COMET_POOL

else
    echo "Error: Invalid protocol"
    exit 1
fi

# Change directory to the protocol
cd "/workspace/programs/$protocol" || exit 1


echo "Will deploy to $protocol on $network using contract mainnet flag $MAINNET_FLAG and --force $FORCE_FLAG"
echo "---"
echo "Using JWT ${!JWT_VARIABLE} in pwd $(pwd)"
echo "---"
cargo test -- --nocapture
output=$(mercury-cli --jwt ${!JWT_VARIABLE} --local false --mainnet $MAINNET_FLAG  deploy --force $FORCE_FLAG)

echo Got output $output
##########
##########

echo " "
echo " "
echo " -- "
echo "  "
echo "  "

echo Saving zephyr tables in $zephyr_programs_addresses_file

# Initialize file if it doesn't exist
if [ ! -f "$zephyr_programs_addresses_file" ]; then
    echo "{}" > "$zephyr_programs_addresses_file"
    echo "Initialized $zephyr_programs_addresses_file with an empty JSON object."
fi

# Initialize file with empty JSON object if it's empty
if [ ! -s "$zephyr_programs_addresses_file" ]; then
    echo "{}" > "$zephyr_programs_addresses_file"
    echo "Initialized $zephyr_programs_addresses_file with an empty JSON object."
fi

# Save tables depending on protocol
if [ "$protocol" == "soroswap" ]; then

    tables=$(echo "$output" | grep -o 'zephyr_[a-f0-9]\{32\}')
    # Print the extracted addresses
    echo "Tables: ${tables[0]}"

    counter=0
    for table in $tables; do
        # Define the variable name
        var_name="zephyr_table_$counter"
        
        # Set the environment variable
        export $var_name=$table
        
        # Increment the counter
        counter=$((counter + 1))
    done
    echo zephyr_table_0 $zephyr_table_0
    echo zephyr_table_1 $zephyr_table_1
    echo zephyr_table_2 $zephyr_table_2

    # first table is events
    jq --arg table "$zephyr_table_0" '.soroswap_events = $table' "$zephyr_programs_addresses_file" > tmp.$$.json    
    mv tmp.$$.json "$zephyr_programs_addresses_file"

    # second table is pairs
    jq --arg table "$zephyr_table_1" '.soroswap_pairs = $table' "$zephyr_programs_addresses_file" > tmp.$$.json    
    mv tmp.$$.json "$zephyr_programs_addresses_file"

    # second table is rsv_ch
    jq --arg table "$zephyr_table_2" '.soroswap_rsv_ch = $table' "$zephyr_programs_addresses_file" > tmp.$$.json    
    mv tmp.$$.json "$zephyr_programs_addresses_file"

    echo New  $protocol $network zephyr tables file:
    cat $zephyr_programs_addresses_file

elif [ "$protocol" == "phoenix" ]; then
    zephyr_table=$(echo $output | grep -o 'zephyr_[a-f0-9]\{32\}')
    echo "Zephyr table: $zephyr_table"

    jq --arg table "$zephyr_table" '.phoenix_pairs = $table' "$zephyr_programs_addresses_file" > tmp.$$.json    
    mv tmp.$$.json "$zephyr_programs_addresses_file"
    echo New $protocol $network zephyr tables file:
    cat $zephyr_programs_addresses_file

elif [ "$protocol" == "aqua" ]; then
    zephyr_table=$(echo $output | grep -o 'zephyr_[a-f0-9]\{32\}')
    echo "Zephyr table: $zephyr_table"

    jq --arg table "$zephyr_table" '.aqua_pairs = $table' "$zephyr_programs_addresses_file" > tmp.$$.json    
    mv tmp.$$.json "$zephyr_programs_addresses_file"
    echo New $protocol $network zephyr tables file:
    cat $zephyr_programs_addresses_file

elif [ "$protocol" == "comet" ]; then
    zephyr_table=$(echo $output | grep -o 'zephyr_[a-f0-9]\{32\}')
    echo "Zephyr table: $zephyr_table"

    jq --arg table "$zephyr_table" '.comet = $table' "$zephyr_programs_addresses_file" > tmp.$$.json    
    mv tmp.$$.json "$zephyr_programs_addresses_file"
    echo New $protocol $network zephyr tables file:
    cat $zephyr_programs_addresses_file

else
    echo "Error: Invalid protocol"
    exit 1
fi

echo " "
echo " Saved!"


# # Function to transform the address from zephyr_... to allZephyr...
# transform_address() {
#     local original_address="$1"
    
#     # Step 1: Remove the prefix (zephyr_)
#     local stripped_address="${original_address#zephyr_}"

#     # Step 2: Capitalize the first letter of each alphabetic segment
#     # We'll use a combination of sed and bash parameter expansion
#     local capitalized_address=$(echo "$stripped_address" | sed -E 's/([a-zA-Z])([a-zA-Z0-9]*)/\U\1\L\2/g')

#     # Step 3: Prepend the new prefix 'allZephyr'
#     local final_address="allZephyr${capitalized_address}"

#     echo "$final_address"
# }




# if [ -z "$contract_address" ]; then
#     echo "Error: Failed to retrieve contract address from $contract_addresses_file"
#     exit 1
# fi

# # Deploy your program using the contract address
# # Add your deployment logic here

# echo "Deployment successful!"