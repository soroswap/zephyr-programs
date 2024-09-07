
#!/bin/bash

# Clear the catchup numbers file
catchup_numbers_file="/workspace/.mainnet.catchups_numbers"
> ${catchup_numbers_file}


# Check the status of each catchup
while true; do
  for catchup_number in $(cat ${catchup_numbers_file}); do
    response=$(curl -s -X GET "https://api.mercurydata.app/catchups/${catchup_number}")
    
    if echo "${response}" | grep -q "completed"; then
      echo "Catchup ${catchup_number} is completed!"
    else
      echo "Catchup ${catchup_number} is still in progress..."
    fi
  done

  # Wait for 10 seconds before checking again
  sleep 10
done
  