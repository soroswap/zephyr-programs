if [ $# -ne 1 ]; then
    echo "Usage: $0 [network]"
    exit 1
fi

network=$1

echo Using $network

catchup_numbers_file="/workspace/.$network.catchups_numbers"
if [ ! -f "$catchup_numbers_file" ]; then
    echo "Error: $catchup_numbers_file does not exist"
    exit 1
fi

while true; do
  for catchup_number in $(cat $catchup_numbers_file); do
    response=$(curl -s -X GET "https://api.mercurydata.app/catchups/$catchup_number")
    if echo $response | grep -q "completed"; then
      echo "Catchup $catchup_number is completed!"
    else
      echo "Catchup $catchup_number is still in progress..."
    fi
  done

  # Wait for 10 seconds before checking again
  sleep 10
done
