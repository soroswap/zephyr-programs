
#!/bin/bash

# Clear the catchup numbers file
catchup_numbers_file="/workspace/.testnet.catchups_numbers"
> ${catchup_numbers_file}


# Run catchup command 1
echo "---"
echo "Running catchup command 1..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCNZ5E4BJL6ZP3G5GMTM7VNCFGE5RRHUFTGYV6PFNQYJ7LUE5PYLNJU7 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 2
echo "---"
echo "Running catchup command 2..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAO5NMT7WWPC5ONZ2Q5J3STJGKLHQKZRSYJ6BMVCY5KAVIN7N2BLK2FS --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 3
echo "---"
echo "Running catchup command 3..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCAXXAWLBUDOKQLPIQE25KEH6V6E7737CS3TTMPVIX22QXCC6VYF3SUY --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 4
echo "---"
echo "Running catchup command 4..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC2FFQ45HVYKBWV3F57WC6DC5ELLIGMHOMW6SK47U6PX7TH4EY6VNQV6 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 5
echo "---"
echo "Running catchup command 5..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA2JIFI6Z2T7FBJKJ4XMKXOCLZGKL37KNSWB7NKXATRWFHBX7CZWKIT2 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 6
echo "---"
echo "Running catchup command 6..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCBEIHPQ6AXEOTZVDOFSYNUXRQ47KAYIXGJKUZTEQOARKMUU5S3H42CH --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

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
  