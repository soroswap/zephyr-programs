if [ $# -ne 2 ]; then
    echo "Usage: $0 [network] [dev|prod]"
    exit 1
fi

network=$1
environment=$2


echo Using $network 

if [ "$network" == "mainnet" ]; then
    MAINNET_FLAG=true
elif [ "$network" == "testnet" ]; then
    MAINNET_FLAG=false
else
    echo "Error: Invalid network"
    exit 1
fi


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
echo Using JWT variable $JWT_VARIABLE
echo Using zephyr tables file $zephyr_programs_addresses_file
echo "Using JWT ${!JWT_VARIABLE}"




# Recover the variable from public/[network].contracts.json
contract_addresses_file="/workspace/public/$network.contracts.json"
if [ ! -f "$contract_addresses_file" ]; then
    echo "Error: $contract_addresses_file does not exist"
    exit 1
fi


SOROSWAP_FACTORY=$(jq -r '.soroswap_factory' "$contract_addresses_file")
SOROSWAP_ROUTER=$(jq -r '.soroswap_router' "$contract_addresses_file")
# AQUA_ROUTER=$(jq -r '.aqua_router' "$contract_addresses_file")

echo "  "
echo " -- "
echo " "
echo SOROSWAP_FACTORY $SOROSWAP_FACTORY
echo SOROSWAP_ROUTER $SOROSWAP_ROUTER
# echo AQUA_ROUTER $AQUA_ROUTER
echo " "
echo Init catch ups using mercury CLI


echo "Catching contracts using $JWT_VARIABLE", with mainnet flag $MAINNET_FLAG
output=$(mercury-cli --jwt ${!JWT_VARIABLE} --local false --mainnet $MAINNET_FLAG catchup \
    --contracts $SOROSWAP_FACTORY \
    --contracts $SOROSWAP_ROUTER \
    --project-name zephyr-soroswap)

echo "---"

echo " "
echo Got output $output
catchup_number=$(echo "$output" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')
echo " "
echo "Catchup number: $catchup_number"

echo $catchup_number > /workspace/.$network.catchup_number
echo Catchup number $catchup_number saved in /workspace/.$network.catchup_number

echo "---"
echo " "

# Infinite loop to check the catchup status
while true; do
    # Make the GET request
    response=$(curl -s -X GET "https://api.mercurydata.app/catchups/$catchup_number")

    echo Got response $response
    
    # Check if the response contains the "completed" status
    if echo "$response" | grep -q "completed"; then
        echo "Catchup $catchup_number is completed!"
        break
    else
        echo "Catchup $catchup_number is still in progress..."
    fi
    
    # Wait for 10 second before trying again
    sleep 10
done

# echo "Catching up AQUA_ROUTER $AQUA_ROUTER using $JWT_VARIABLE", with mainnet flag $MAINNET_FLAG
# mercury-cli --jwt ${!JWT_VARIABLE} --local false --mainnet $MAINNET_FLAG catchup --contracts $AQUA_ROUTER
# echo "---"