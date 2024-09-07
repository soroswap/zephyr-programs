if [ $# -ne 1 ]; then
    echo "Usage: $0 [network]"
    exit 1
fi

network=$1

echo Using $network

catchup_number_file="/workspace/.$network.catchup_number"
if [ ! -f "$catchup_number_file" ]; then
    echo "Error: $catchup_number_file does not exist"
    exit 1
fi

catchup_number=$(cat "$catchup_number_file")

echo "Checking catchup status for catchup $catchup_number..."

# Infinite loop to check the catchup status
while true; do
    # Make the GET request
    response=$(curl -s -X GET "https://api.mercurydata.app/catchups/$catchup_number")
    
    # Check if the response contains the "completed" status
    if echo "$response" | grep -q "completed"; then
        echo "Catchup $catchup_number is completed!"
        break
    else
        echo "Catchup $catchup_number is still in progress..."
    fi
    
    # Wait for 1 second before trying again
    sleep 1
done
