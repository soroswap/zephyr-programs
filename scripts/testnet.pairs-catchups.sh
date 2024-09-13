
#!/bin/bash

# Clear the catchup numbers file
catchup_numbers_file="/workspace/.testnet.catchups_numbers"
> ${catchup_numbers_file}


# Run catchup command 1
echo "---"
echo "Running catchup command 1..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCY3GGM4Q65MF2E4CAL7QKL4YDQPB2YOMYMA3MVUXZG2T3NISOTCI46Y")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 2
echo "---"
echo "Running catchup command 2..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCUEAROFR3UWAFU6NVEEOQRUVOUBYRPYWQI3BZ6XIPOQ3V7UF2ABFSJ3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 3
echo "---"
echo "Running catchup command 3..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCPO76DGVTIFACXLZF35DYFTP42KGI3YHBMQYSTAY46UAR6FB4CJG5QH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 4
echo "---"
echo "Running catchup command 4..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCVAJLQCLWDWXNJEGN74UJU7O4PIYM2XI6DMNSIV7A3YRDIDMK5NLQPS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 5
echo "---"
echo "Running catchup command 5..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CATOIM476JF37G465V2ILTLV7HSKRLLHHZGOLWWIMO3OARZHYU5UYX4G")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 6
echo "---"
echo "Running catchup command 6..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCCH4QLGIYTEZJRUI7ALD5ZLTYP3FN2ERX3PFC65USE4HBUK6ZDKJOHD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 7
echo "---"
echo "Running catchup command 7..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCIHLBC3ZGUOR5IFJIKLHAV7KQBQJEB3HQZZV5LS3A5O3DJHZ74JRD57")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 8
echo "---"
echo "Running catchup command 8..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAYSKULYMPAUBCU4OS5M2PZ3RVRH7IU53XNPPIOB6WEUXPK7E2SNDRHE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 9
echo "---"
echo "Running catchup command 9..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAJ5FMDL7TRBBZN2UODCNECRYAAFGISXUZMRQK3275MPACDCVYUWUIIE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 10
echo "---"
echo "Running catchup command 10..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBXEPAQNPTEDTFHXTWV3WOFHTUNTJJXN43SIVZYRNB6JRVJPNNS6A5RS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 11
echo "---"
echo "Running catchup command 11..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDLVBCCJPALOGLQKNTDZORZKTNLZPTXNTEBGBMMOBRFV5OTONTK3LIO5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 12
echo "---"
echo "Running catchup command 12..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAAK4UR5AJR3SQZEJYWSAQ7DSC6EHRA56ETMUBMMFQWLIV34BAZYXQNR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 13
echo "---"
echo "Running catchup command 13..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDIIFWVFMCEOHYERWRT7RRX2TOAV7RAFZTHOSBF2OV2EIFLHM3XHU5N2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 14
echo "---"
echo "Running catchup command 14..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBZY7XCCZ2OX25VDXEN7ILWCAE67647YULG2JCMGPSLGQN5GWBO6KSMB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 15
echo "---"
echo "Running catchup command 15..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA6D4GV7VMEX265OEXZVCTYG4WLF56X5XMRLIC7IFPIUJNTRXR2VG32O")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 16
echo "---"
echo "Running catchup command 16..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCXOMUE5YK74MCCDD3RSRQDRQPHAQBT63XVIJ57MONTJOZYAS3AD2NHZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 17
echo "---"
echo "Running catchup command 17..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAKVGRRUCVOAYWA7PKZQ3N7MUDRFSCXCU2JI54QKCB4QYNQ55M6YSMYZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 18
echo "---"
echo "Running catchup command 18..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCAKZ3ZN5EO2LGHE5DEBUO4M4TVV3BSGL33CAU2NZ5CUZTIV7UZVYLGR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 19
echo "---"
echo "Running catchup command 19..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBI4D2H2HVXFAXYPUPO3ZELIRGEVOND2P4GXZSC36CDVGIRIZCZ64MTI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 20
echo "---"
echo "Running catchup command 20..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBD3UT4AFBIBR7DSQ3ZBNKQWFLLWP4WIF7XH4YE4PZQQ5YGJH3UNATWG")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 21
echo "---"
echo "Running catchup command 21..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CADOBNZ234E7QFSZSGESUHQMLGHKSH4A3A5EL6UKYVBAZLXY7SWU7564")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 22
echo "---"
echo "Running catchup command 22..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD4UJC2TC6IVA6PHW6PBBD6PQS67J4B2U5XXHWKKSPTTTXP522CFFKMB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 23
echo "---"
echo "Running catchup command 23..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCTHHN742DO7T4IGKZYDXQY7BUVBWDE2YEVTZ4TUNQ2RPLMJJXMYUFVS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 24
echo "---"
echo "Running catchup command 24..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDAUJFQTBS56VCMFW6W5EQFV5PRJ2OCXYAONWLH54XTLGZLXJ4253BYI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 25
echo "---"
echo "Running catchup command 25..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBG4NWZJGHYUZFXWEEL24FL4KMIVYA5T4I4GSNV52X3VVMOQRCO77JW6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 26
echo "---"
echo "Running catchup command 26..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBPTF2EOIGEA4ULLK3NCQLL65B7IQTXY6JUJZ3XTRM2YIKSZY26WHCTW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 27
echo "---"
echo "Running catchup command 27..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAXRHGQGPZFX7M4UIDMTK4ZZ6IKOD27Y5QEEJWQP4JFWVUCIASKCOG2R")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 28
echo "---"
echo "Running catchup command 28..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDKQGJFRTFFGSLNDZXTRZHJLTMP7DJVLIIW5TEER5JBLFPISHKLQQNNH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 29
echo "---"
echo "Running catchup command 29..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDFR42PLUARE23HVHJNDMCAWNZVIC2M2F5NS2RXA64A3TQTH5IJQOG6C")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 30
echo "---"
echo "Running catchup command 30..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAXXIUX7R3RQ3SQ6Z5TZDFSEOTOWIUW2IHZCYBHM2YU6N3XXUYGTRVSR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 31
echo "---"
echo "Running catchup command 31..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQPV2QIBNMYRQAELPYCIQLKZZWCRO3HE4JM6Y2N2DKIAWXYCIQAYXFQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 32
echo "---"
echo "Running catchup command 32..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCS7CA6OM26XIJO6FCZOONSYQA5Y77UYT4EC3DL2TD5YGOYP2XB3XTEA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 33
echo "---"
echo "Running catchup command 33..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC3BY2KLOX44MV6LJEEBKW3D5N4SQJYE6IHTI27D27W2MDTL2T6TA2EH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 34
echo "---"
echo "Running catchup command 34..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CADXJAZYEQBM5HM4UAVPJRARA53OXJ4RVJGBBJQWATQLGPY4FYZ576YT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 35
echo "---"
echo "Running catchup command 35..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAHUF4JHRVZJ3BNYQRRGWRVARUYLLFWIJFGMWWTGJHY6I36ILTU772TH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 36
echo "---"
echo "Running catchup command 36..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBJI7SG2E6F6OX7VJBTPTDADDMWL3BYDDQ6I7UXIHEG46BBKT2J3AVYO")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 37
echo "---"
echo "Running catchup command 37..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQNSI4WPWRBSSMJTRYXGBJGOMFAO2ZXYE4CD4OW2R5WQSB4IMBM2LW3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 38
echo "---"
echo "Running catchup command 38..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC4HJM64DVJFROF2P6IEEBKEYR4YNBVT4ROTMUEYV5Z4V6KOPVXWT2CA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 39
echo "---"
echo "Running catchup command 39..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCPMREXUHYSBZS5N7SBMZ4R2GNRCST2JYQT2ZWWNORNHFHYSXX7S3DHB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 40
echo "---"
echo "Running catchup command 40..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCZWFXSSDILLSWU3F2KOSQFFPLDQNOZYVHMLVKYUCAM2AWQYJCUS2A5U")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 41
echo "---"
echo "Running catchup command 41..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB5ZW6CJAGSUGD3VV2WC5GGICADDSNOR3PZQCOLEBOV6S3CQWNTNIFNC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 42
echo "---"
echo "Running catchup command 42..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDS76LWERPU4TLTKVN5LRWQLMHPFSEG7J7EBQOR7LMZSXSR6EU53NI4R")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 43
echo "---"
echo "Running catchup command 43..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDS5ENXB3UQQBENALU53D27LBQH473RPUXUGYS4QXNROJSYJQMDIIZWZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 44
echo "---"
echo "Running catchup command 44..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA3EZBEFAHOV7RTW27ZU7WIENMHKSZULQ4G7425AU3TMX7OFNBSKUAF6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 45
echo "---"
echo "Running catchup command 45..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBRJTSB3CMTDJMPILIPICN4NNKUIJ6Y5V2YXAO4KYIQND7ECHNNKDM46")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 46
echo "---"
echo "Running catchup command 46..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCUBWK4LCK463BTU4EMPBNXGM3HBMHANIDNA3LAFI6URPANTNTFBUILO")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 47
echo "---"
echo "Running catchup command 47..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAACARE2LB42UCBRHT2MCPJOCYDOCMKUJMDETTRIUZZW46GMFVVD3XI4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 48
echo "---"
echo "Running catchup command 48..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAEQLXKP5TNHELLXBXGXKXUPCLS2546THG7HZLGVJR54KI6233L2YBK3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 49
echo "---"
echo "Running catchup command 49..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDCYKVB3NO4XAZEG72447DAMXVFYPKRDDP3MJIREC3SR6VAAO2SXRYFH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 50
echo "---"
echo "Running catchup command 50..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAVSRFAPP7CIWF3WSR3WQFI237BNSZZBQPSF6HLWDW2WQGCUBJUMVDM5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 51
echo "---"
echo "Running catchup command 51..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBQ42JC6NCZVGVCN52KIHUS762BPBZVCN5WPVTO5DNA3RPK7KAB3KBRK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 52
echo "---"
echo "Running catchup command 52..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDAPG53F2PSWMAR5GHNXUOVBGFGFY7MTMKIVMZMEKJR3IOI23H6PH5UA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 53
echo "---"
echo "Running catchup command 53..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA3BJ64A2S4DSPTLNDTGRB5N2ZXRH77L5U7NBX2LWNCAKNNFG5JJM37R")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 54
echo "---"
echo "Running catchup command 54..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDUVMCW2HTXKI6L5ZTACCQEKPFQS2RRVDCWU4FURKRZYAVIQVFRUAOL3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 55
echo "---"
echo "Running catchup command 55..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCYBJPTEH5GVGTHM6X2SOZQB7PAM2BHUJGBH4DNPIQUI7EOCUPUDJ5KV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 56
echo "---"
echo "Running catchup command 56..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDHZ3UIDURORMT2NRDME66ZRWUL3G3JADCIF5PKTJKQ3TJ4IM2KB3SDI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 57
echo "---"
echo "Running catchup command 57..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBBCOPUICJ7OWTAUO74ZQYHHQU4MQFKUT3PAIRJ676OBUXGQPVX4SR6W")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 58
echo "---"
echo "Running catchup command 58..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC6NULKHWP7ELNQNLU33RU5EV5TJZPSASYNJACOIC2GUHWCK25GFCSXY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 59
echo "---"
echo "Running catchup command 59..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB455E3J6VM3ETNMEBI25U6DXCNOCIP4MJTJ6OYUNOCYSNYP3VTXDWTP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 60
echo "---"
echo "Running catchup command 60..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQYZSQGO5C7LOOFMPTQDRD77CDH6XERK3NUH5Z7VOY3VZTUXQXD4MIE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 61
echo "---"
echo "Running catchup command 61..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CASNMNLLIPHGHJEV3BY7EMQPHT5PMIYTFX3IBLZWOEZ65SZFL5X3WFRB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 62
echo "---"
echo "Running catchup command 62..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCF76OGQR3QCJB6A6FUP2IYSVYQETVDTBID43XRJ7WGEAN2N6H7JZNSV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 63
echo "---"
echo "Running catchup command 63..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCWBJVKPTHFBOIKAO6UR6KIAP62TESSESBKYEHYHNTYPNRHWDIRUQPD4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 64
echo "---"
echo "Running catchup command 64..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC3GVDGXWSJ36NGXIN6YN4F7KV7FRNB5ATZZZYE2MPH2GMKQ52GZK2GU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 65
echo "---"
echo "Running catchup command 65..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDVM7YGNM6P3ADF7Q7WHUNHYLRKIFK2OVFZAPLBCFWS7K356XRB4GHRE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 66
echo "---"
echo "Running catchup command 66..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBTGLCC2R5TQBWX4T7GJ2S5FKEFVT3KBWJH4522OTU2I3LQH5V2MJBA3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 67
echo "---"
echo "Running catchup command 67..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCTWOSWEE4PXZNOUBZT5GWNOIU5MKYLP2TMSZUO6SEMSG6K4BBBEPQZP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 68
echo "---"
echo "Running catchup command 68..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCRVSAJWKYKHBHFQYIEEQUVJTYIKM4OUWZDULNWZNZ45YFIAN7PHYJAD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 69
echo "---"
echo "Running catchup command 69..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA3L4PLTSMIX6PEIYNHXIPAQPYUKAN6CFJDQPHOTVARA25XUYTU2DOVK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 70
echo "---"
echo "Running catchup command 70..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD64JML3MDYWXSYOAHIJYFCO6WVDF6NG7EBHCMTJE73TCTZMYO3SVXJD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 71
echo "---"
echo "Running catchup command 71..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA7TEACL7IP6DKNYLRUXXCWPPBQWF3ZPBMWZ5VCPRM2T33TCVPKIO7UV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 72
echo "---"
echo "Running catchup command 72..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDATSWOYUMJJEDCXS3ZOOZ6Y2KJRKLBWHTA2LSVNCVVUYKK44XYBZ2UJ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 73
echo "---"
echo "Running catchup command 73..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBUG6H2WGOKZDAZEWRXSHLFJS5B7BUZ7IXDNLPDQNFRNG5CF73K7WYUQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 74
echo "---"
echo "Running catchup command 74..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCAC27IW3SUEFZT5ZNISJ2XHNNEXZE5XOSSJAHUQDJMLG5PN52XCA5QG")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 75
echo "---"
echo "Running catchup command 75..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBVPVBUOOFOMQV5GV4PGCBEJGYUNMN6G6BGMD7NZ6Z247F3K4IKZD65M")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 76
echo "---"
echo "Running catchup command 76..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCEMO5HQODF3MAZZHZ2L3UYCNCNSLDSFL3V5ZSLB5ZX2HYQEDY5EPKJH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 77
echo "---"
echo "Running catchup command 77..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBMAFW35H3ZA6LIMUABUZSKIDLFOSO6WWLLMCZATVKFUX24OGANQ7FO6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 78
echo "---"
echo "Running catchup command 78..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB3CJIAYZMNLOUBP2LBCIAFWJCJCHAFP7TWWLHPSBT4O4EPWUCFTGUP2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 79
echo "---"
echo "Running catchup command 79..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCMQESV7ISOZOJ6E6GDKRRYT7IHL4DD5JDWNDLQATQSTWKLW4TWSSCSE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 80
echo "---"
echo "Running catchup command 80..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA3SKKFL7FQDLJM7IUDY4GJ4UKSP2N6EUVS5ACX3XQNOECIKAGIT74C7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 81
echo "---"
echo "Running catchup command 81..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBLCIAI4SSK5RPP3G6DNYFJWX2GCSRS2JMDITNSHYD4K4X6UXZ43ZRFQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 82
echo "---"
echo "Running catchup command 82..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDORNU5WFG657L2W2B4TWWZXKP5OOXTQQTHRHSGSTB6KOCPH3CVX4Y4S")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 83
echo "---"
echo "Running catchup command 83..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBFRIONJEHIKJCVFBNOO4P2DIAEELVQCLQK2JDIU5KLSZCSTM5BD562T")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 84
echo "---"
echo "Running catchup command 84..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAS3FOMFW7ZYQ2TUQ5VEKTSPR5CDG6ZF6T2VQUNW27UJQKQA3KT45F2O")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 85
echo "---"
echo "Running catchup command 85..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCERX7TUL2EAVRRSG27HCB4MJQIY3MCDI2EMCG25VT3CLUIEVMX6FRUK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 86
echo "---"
echo "Running catchup command 86..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQQGVTOENWIAS27RKYSD3WWHAQKB4HV6TMA6IT2UAGG37MEXW3XOWOY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 87
echo "---"
echo "Running catchup command 87..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDNFXB3XIZTLT46ZPGNMGM24ZEFC3UEIVYAOX3GJ3ZAMCHKBFDYYAALI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 88
echo "---"
echo "Running catchup command 88..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB5QBZ3SMV3ZZKOUL2VAHSNV3LHY7RTW6A4ERXXFC5WYKGEN772V2DNS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 89
echo "---"
echo "Running catchup command 89..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAC7HYMQ2JBECPISPU5ZVWKP52WVZHFHCFH7JFP5EDUSIJZ434FJXXFE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 90
echo "---"
echo "Running catchup command 90..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAHLNU5AA5VPDBHXIV6WXTCNZVNKWTE2QMZX4PQLNTCDZESVOSUNEKYA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 91
echo "---"
echo "Running catchup command 91..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDQFAKOOGJHJUFSZQJXGNOE7KUKKENZBAU5AHTYBHWLECLWBHMT4CC5W")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 92
echo "---"
echo "Running catchup command 92..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDIFNWXFRYWRV7Y4KEPTVHMXAUESIEYK4E3YJHJPCLYWHVEJKDTPWYVZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 93
echo "---"
echo "Running catchup command 93..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDB7NJC4DAURBPMJHI7DG56J3XMLAIXHR5HQJDVXVT3G5YOWCW2YI7MV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 94
echo "---"
echo "Running catchup command 94..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC6ETAW4KTFUAGCXMW7NI4ZQ2EIUUQRX3MSZKFKT25EQCBIOBR4NUB3U")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 95
echo "---"
echo "Running catchup command 95..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB4KSUC72Y6Z3ROK6GAKJYQ4ZP224OC4WVFQ2ZQAXP4TBLXYTDAVVUKK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 96
echo "---"
echo "Running catchup command 96..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDM747TGDQKROXJE4NJYMVZZ3OC6RVSZZGOBFUV6MXQ34UWRKE6PKLTZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 97
echo "---"
echo "Running catchup command 97..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDVJQLE6NT5A5ZGUTFXKG6QCZJXBS6UJPMJLPJ24PFKXKZ5X2N2HTUAS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 98
echo "---"
echo "Running catchup command 98..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCECX64ORIA4H3GR3UUW3CKDPCUDWRHMCGEQAXMK2UESVPK73FZ5VCBB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 99
echo "---"
echo "Running catchup command 99..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDAUSH2MMOTDS3N6L5R4PCXQVB6WWLOQ2FF7JGPHEOPIUFRFKFFRMCI4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 100
echo "---"
echo "Running catchup command 100..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CATFICEZAQLAKLE6K5MIHGVBDEREUPKNVT44N65HUHBMYG4BPZG3BQBZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 101
echo "---"
echo "Running catchup command 101..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBFFJFS72WPWS7AT7QBM5HXKI6DBBYCH5TNJAZXKJKZ57STM3XQIBKWW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 102
echo "---"
echo "Running catchup command 102..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDAKYGCYOV6POYSACUWM4SN23EPMEFKHFXOMGW4TM7NISQCNMUFN4FDQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 103
echo "---"
echo "Running catchup command 103..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDZTIQNZAVNJDLT5HCG2HH2RBINXHCXEEE6QZKKKHUUPTUCHF4QWVZ6X")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 104
echo "---"
echo "Running catchup command 104..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBWHFOA6VF3CJHQXNM6W7UJO3LEIPHKBWEFQDZKINJFV74EBN7F32G6P")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 105
echo "---"
echo "Running catchup command 105..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDTEEHLZ6TP3P55LNKUUEMDHR5EKE5VRY4LWJCJ7TGGR7HVUPT3QONVC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 106
echo "---"
echo "Running catchup command 106..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDQT6DN4AGM3RSXXUPX2L4QMZXCSEKBZD4Z6WN3RINOITX4Q4EXF4LST")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 107
echo "---"
echo "Running catchup command 107..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB2VOSFFK2OZQ54OZKA53QSQKZVIMK6ID4NEY3B3K6B3MDMOP4EPJ6OI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 108
echo "---"
echo "Running catchup command 108..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDNRTDIF3XTDTRFE4P7R5C5IUV6K6DXUZGSK5VFRNLOCJUCYQG7IVUOY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 109
echo "---"
echo "Running catchup command 109..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBUEBRZWLLV35QYJALI2RH7U6UQOT3EWLCEBL6HF236WVMVAIR6DVRJA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 110
echo "---"
echo "Running catchup command 110..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDRIB32P7JFIZL3HEVYWZBZMV2J57TS6T4IPBVTT6UUZ7CT26TEGITLY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 111
echo "---"
echo "Running catchup command 111..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDQEWR7HFMIKQQICPW3QZWJZ277Q55H3TKNO4WQVJQQMOUXUW2ZESSKT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 112
echo "---"
echo "Running catchup command 112..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD736EY5ZLR4ZNDPZ5RGBIKLMQGUNLSA5WAHFKMK6FMTWVJH6ZW6QWN5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 113
echo "---"
echo "Running catchup command 113..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAV24OZCECWTPL2QS5DUMIZOTL6LCT5HT6K3XY37THZT44PTVXYJXKCY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 114
echo "---"
echo "Running catchup command 114..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBCM4JFZDBMCOJIECR2E5YCN3NM42JCO3DBYD2QQ56ZSKA64RDZ2SB2P")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 115
echo "---"
echo "Running catchup command 115..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCZ6PQWAXRAE623JBI4JR5VVBEGVRQRKBTKAJ7V6ENNIJ7LQTP6ZXWBN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 116
echo "---"
echo "Running catchup command 116..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CADDE7TLWZ6CBG4GGL5PO244KHNRUQPYO5GMFVW4UJ6LD7YO7JSDGRZV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 117
echo "---"
echo "Running catchup command 117..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBCUWNOQL6TPHWDSUGODTZOTOEUKMI6RV66MUHXOML5Y5MS77VRISKZS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 118
echo "---"
echo "Running catchup command 118..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBJU2TNFQB63LMVFEUD3KMXPYATF63GC6IJM5XFG2W4JEW54LTXW52GV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 119
echo "---"
echo "Running catchup command 119..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCMVXZ3VH5NDCEMQJNREY26G6SGLMMYQAWXEXW2XUXEGJ5OK6LS7MXWR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 120
echo "---"
echo "Running catchup command 120..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CACX6MGUGRPNCDAHJXJE4ETJ6FDLNWPJ6K2CICAFGGLNA3A2BTRBEBYR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 121
echo "---"
echo "Running catchup command 121..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBC5DMLROWZXYSPVEQSFB5GFEEHDO4Y5HJJK54XOYQLKVVTNAAT3T5IJ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 122
echo "---"
echo "Running catchup command 122..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQ22RT3GPDFE4YU6KRSGBOHTDFRJOC62QRVGAYPE764I3Z2ZKVULWBN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 123
echo "---"
echo "Running catchup command 123..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDPPKRD72XOSQN2BFVXXT22UQB3GLFKMSS5BVOI5Z3EWMZYYWA64ZSO4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 124
echo "---"
echo "Running catchup command 124..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCVN45GNP6LPTB7XYAL62KNCNDSFBCWOOBYLBNVSXKB74T4AIR2HJOY6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 125
echo "---"
echo "Running catchup command 125..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAEEZ6DYC2S2MN5RBS6Q7GR67ASODOHFCQTXKPBL2FM32A6GE64DIBDR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 126
echo "---"
echo "Running catchup command 126..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBQO3YANUKWZOGIITHXHFWWAAT6GOHPYM2YEVMX72EJPRXIV5XVCAOIF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 127
echo "---"
echo "Running catchup command 127..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA67DZBZXIAPSZKRUFXKTUGORWUKSH5ZEVDAJLXGKBHTNKXM7Q2353NT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 128
echo "---"
echo "Running catchup command 128..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAJC4GYDLEMFX5VM5SUVKKN4M7RG7QPRLZMMVQU6DDK4IDPB6YYK5573")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 129
echo "---"
echo "Running catchup command 129..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBBRYOZT64NLCIYNBK3IGTD2XN5VRTJI75CLK6YC5ZQ2UZUJJ6XCW6CH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 130
echo "---"
echo "Running catchup command 130..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA6I6CCZ6YXPGDVUJAXNIUDP466KRA2OTTKQHVE6CTKML225B6XHLNAA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 131
echo "---"
echo "Running catchup command 131..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDMJUIS6ULYBE6TIRML377U2JUMAXZUS4IODJHO4J5TJPBFFPZC4TFOQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 132
echo "---"
echo "Running catchup command 132..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDAD2HMAVMFBZI7NONZ3CTY2HYT5YX7HJNONHIBSXPGFGX5E4STAOBQZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 133
echo "---"
echo "Running catchup command 133..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAWO37MYAPQIJQLIZAHHDNHDAKTHUBVCQ3EENLYAAZELZYN5HIE25KCF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 134
echo "---"
echo "Running catchup command 134..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAGPPC5KUS4CQWLUZVBVNR6WQHIHBJCMBB4RVCICFUCU3IUEC5GS5ZGZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 135
echo "---"
echo "Running catchup command 135..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBIIVW433QQH5KA2TS62ZR2EK7CK26R54RTMR5UDKRD7KOWWX3GSZ35Y")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 136
echo "---"
echo "Running catchup command 136..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBYCD3QYTHDCZSDAOGZ2Z3HYD5KOIXWYOL7QYCQFAK3N7BK4HJGHD5WT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 137
echo "---"
echo "Running catchup command 137..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDXCIWORENZTDP75LTUCZMSRFTXBEYKYBO2J7AJTQ6HVDDBWK22FLRRX")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 138
echo "---"
echo "Running catchup command 138..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBLFMPWVAVLXPV2MSJNYHKOJSEQUOSZSXA2ZB3EG2IRK5ESLQ256SX4E")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 139
echo "---"
echo "Running catchup command 139..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDUGQ6WEWOIFL2M2OBVCDUJ7SXJVT4S3F35M7ZNTTVKXJ6LTZVJGTRVK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 140
echo "---"
echo "Running catchup command 140..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCHAKI5QK7EW6OZETJAM3UDHBWGC5FB2X4CUS3D5X4M6F3AW6YIMDNZN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 141
echo "---"
echo "Running catchup command 141..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CALTWMT7SOXXQLTXBF2CFH56ALROIUQXG5ILFDCZUIQDL66FDN53RTTP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 142
echo "---"
echo "Running catchup command 142..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAYW3JPANC2V42QOWREMLYX742DEMZDHU34GLQDCXJNHFSL7DHPIIYF6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 143
echo "---"
echo "Running catchup command 143..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAA3YGYM2FV7YXUOEZWO6LXTV4TFHLGP6QGLUE4CKR5JZ6ATIINJ3H7K")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 144
echo "---"
echo "Running catchup command 144..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBGFCVJUXFJ2GF26VUYEZRWR57C6TPDJ45H57HMPRGYV3HNEUHOZMBFL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 145
echo "---"
echo "Running catchup command 145..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB2PMPH3KBHU3JEIVHLMDFL5ZGL4JON64OTKGKP7VYXERMTSKTROULKB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 146
echo "---"
echo "Running catchup command 146..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCB4V6PUUYDVW5XSEH6PJQERXFI6Z7BPE3ZRDHAHEU4TMMXC2HQ5G336")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 147
echo "---"
echo "Running catchup command 147..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCAMI32T22FIXTM4NY7MAXGWUXHJVYB5UTR66DTEI6K63XH5UAAOPWNU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 148
echo "---"
echo "Running catchup command 148..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDPXLWK2HMPJTPKDXODFKW3ENZXU5S76AH2RTY2JOJGBTS6W4ZREQRHW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 149
echo "---"
echo "Running catchup command 149..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDM7D5ZTFRYXWVAOV6FRTEZHJ3TTSZBES55MFVWU5TBGTIFWW7Y575VK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 150
echo "---"
echo "Running catchup command 150..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBG5PBJ57AVRCPSWFWVY5YWZCIVDD4J6YF3MGN4MMMW6CNCNFUYK2FKW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 151
echo "---"
echo "Running catchup command 151..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAEZZLUOBLJ7TOVOBKRFVBHC67WDOUO5X6WELY6TVASIEQZUQGDUQQ3G")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 152
echo "---"
echo "Running catchup command 152..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAG7K2HSYW5GDUGC3A4VJWSN7QIDTH5AP4VYADZLQQFINT6T2PQTOJWA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 153
echo "---"
echo "Running catchup command 153..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBQZD5Z3FUYZAUZJZKH5NXBIPVAS23ZPX4ICA33JZGEKND4D75KIZVE4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 154
echo "---"
echo "Running catchup command 154..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDMAJZMUTCGTCMG4C6VGX3PSFK7MN4BJDMSPXTRWD6XTZ3H35KAXV7ET")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 155
echo "---"
echo "Running catchup command 155..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBB34QDFKGWPXXPE7ADHNI6SADUWNG72X75KFAA7WIITJG7KPZTYY4JQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 156
echo "---"
echo "Running catchup command 156..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB2SGNPUKMZQRDOGGKXGWZ2B4LZE6JCVV6N43BE7CZ5RGNTLNB5WMJHA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 157
echo "---"
echo "Running catchup command 157..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA5AWNJJIKXGAC57IGWHIDRE5FDNTWE7KB7SNUS6SXLRAOTJTRZZVVVF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 158
echo "---"
echo "Running catchup command 158..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAX4MBQQWSFIGMFNRBLRCFBWKPD6KGV2FFYMXYXGCEC2QFCYKVVG2VCR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 159
echo "---"
echo "Running catchup command 159..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCOQROCWDFIJQBMO26XYKUOGGVTQJB56FZLZKGU5YQISOJVPGS4I63UU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 160
echo "---"
echo "Running catchup command 160..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBJFAK3OX6USYDONO27X3WXU5PV3IAABGSIKDFWYZGBR2LJM4OCAOZBU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 161
echo "---"
echo "Running catchup command 161..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBD5KMVHGFRDNV2AJCYHIJZ3JTAF4LLTZ7FHE4SCVTQHAA76N25KVYOW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 162
echo "---"
echo "Running catchup command 162..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBM2JZMZQLVMOCUBHLOR23SALYUJNI2LJPZEM2Q437YHCMKQX3NWVL7F")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 163
echo "---"
echo "Running catchup command 163..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCGDX2UVMRGYJN4FNUEZXDMC7TB454WACAK36V7CMNO6BXTG7QZPUAAV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 164
echo "---"
echo "Running catchup command 164..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA7P5PP6WFO7O54KUI767KOLKE5QOQZSGKZAQQGBGIC6O4BSS5PWYGU2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 165
echo "---"
echo "Running catchup command 165..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDSHL427TZTKPWXRU5HH7EUVSYIQ7NTAJP36H5TK2XNF73Q6HIDFO6HF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 166
echo "---"
echo "Running catchup command 166..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBDIGAAO7E5ENSBT225JMXKYPLVU2ON3XJZOM4MQMJDP6AIQBEFFS6PL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 167
echo "---"
echo "Running catchup command 167..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCXQTTTEGKI6AJBWOEXEFGJXTCYTSA7GRCS4JDO6ZIVEWO7K462H5TTX")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 168
echo "---"
echo "Running catchup command 168..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCMLPWDCOFELZDDIVWW2R6EWRGEH6OXYLJBZJNSHKCNLIE6OZSRM56SC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 169
echo "---"
echo "Running catchup command 169..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBHXPJFSAPDQWN53QB4HWRIOTNOW4MWZMKRGQM3GDCAKKYGWRU56WIM2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 170
echo "---"
echo "Running catchup command 170..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBBGBS3LFYPIQKICWOBHBKHZVEWGQW72XHUXHP5LAE6AQKTKYDIJJPUD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 171
echo "---"
echo "Running catchup command 171..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAZYCQ6BKKMNFSEOKNSIRI57LUNKLSBUMX7STGHYKLFHLGQCBUZX5ZZX")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 172
echo "---"
echo "Running catchup command 172..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB7XH3RPQ3BDPDZ7SP5AR5IGTNTW64OYPAIOR4R7HNXQSLJXU5ATIZTZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 173
echo "---"
echo "Running catchup command 173..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDEYTSSAM5QZYXR355OQXHDDK7Y2D7UOFUPOILW7SXVKYHYWMRYOCI5H")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 174
echo "---"
echo "Running catchup command 174..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDIVH2ZNEDE2DIYFOBG2DTFLYO36UB3C2244Z4OIYXHNJ3LRAV5DB5GR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 175
echo "---"
echo "Running catchup command 175..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCOF7KX2YVFJ5W3EYUUXOKLYGYQVXVLVRBM54LPKEQT7W6FK5GWFRDXR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 176
echo "---"
echo "Running catchup command 176..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDDI6OR2XHPFBIWWZHGTSCAGJOWCBP3MIMRTSUKLUQSUBONFRKG2UUFE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 177
echo "---"
echo "Running catchup command 177..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDKO5WL65JLNASGR2CI3HPHL63BZJILZXU6BGJQYK6QRCWZBFRRAWGIA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 178
echo "---"
echo "Running catchup command 178..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CARIHUNL3VBGCYFMG7PAGYUNBNSTC7EQYSB7BKWRP3AMXYV5E4PIJWMR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 179
echo "---"
echo "Running catchup command 179..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBOM2SNUHQYIVPOK3MODEUDGKUY6GW6I46NXFUIMD4LMT7PPRN2YWTYV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 180
echo "---"
echo "Running catchup command 180..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA2RXPIVIE2NFKUQDWY3R66L5XMRSLNGWZYUL4MUUNNXXMUF7EEBMTTO")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 181
echo "---"
echo "Running catchup command 181..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCOEIUPXOY4DLBSL6L24JIM2YT2RGFBVF3PSTO75AIV2PB4OR3LRWIS7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 182
echo "---"
echo "Running catchup command 182..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD7HOIBNLOTTTOY7DK4OGR4H3HL3B72R4IW7EH73ETAIAHU7PPNMSAJ5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 183
echo "---"
echo "Running catchup command 183..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDXSNMIT4AGYYKCDO3SO5SBZCRPOFP4JVM4JUGEWWEBNXTTTZSMGFKLM")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 184
echo "---"
echo "Running catchup command 184..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCIINHDKIGL4KC7BY66VEUSIVI744XZGW7C67ZK5JTZEWRGARYHLAEV6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 185
echo "---"
echo "Running catchup command 185..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCA6KULKRX64FK5G76V5YMSEUAKB44FAWKS22ZHV5LSYE5F4VXEBAG22")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 186
echo "---"
echo "Running catchup command 186..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCRMAHIOEQTRXGNCEURD72S26HKUAALQ2L365SEW6MVSEAKZ4ZX5LCTN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 187
echo "---"
echo "Running catchup command 187..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAXZ22LJ6B5626OZ36NYMYGDMQN6Z4BJDBBK33V6KOXJ3HXRZ3NXKQU7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 188
echo "---"
echo "Running catchup command 188..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBPJ3ZFJX4LSETLSSUZE56LWUWMUIGKOTOLODNWDYVKV62F5NMHELFT4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 189
echo "---"
echo "Running catchup command 189..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCCAW3IEHMJX63DB7BFZ5THO45WNZKSVYVMKKUYPLW46TAD2ZZFF36PC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 190
echo "---"
echo "Running catchup command 190..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCRS4JYSSSFC4AK2QRDEJIYW23HSCBLFJQZMC35YBLFSJAK4FHTWWOHC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 191
echo "---"
echo "Running catchup command 191..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCVHU3IKN4O7XE4TDJPTIG7WXFH3AGHO6DA76DXMNCXEP4AHJLQMYCVN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 192
echo "---"
echo "Running catchup command 192..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCBRMAH4QEMQ6UWN42UQFN7CH7X6HJCAGJBKUYRKKQBOONUVKEE7UMQ2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 193
echo "---"
echo "Running catchup command 193..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAUO2IYNZMU4VZWZSUL6EH2X3XJA6RL323PGBBAPETGATKSNMQXNOC2G")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 194
echo "---"
echo "Running catchup command 194..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDFNYCH6AIW5MVZID4FL6PU4Z5NCSCUNCLTJYKOSWQ27SGQNGUPLU72D")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 195
echo "---"
echo "Running catchup command 195..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAZHUXCH5V4ZKUXO4IMUO5U2WHGD5GPJEX5AUPUNYPQXX4L2WRKPEQHE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 196
echo "---"
echo "Running catchup command 196..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC74FBBFTMB4OHRYKFHNM6EKMNNTSJZCL6DVJVS25PJHRL664BISECMR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 197
echo "---"
echo "Running catchup command 197..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCHA3M4WQ45UUP5SITVVM7IJSPL2J6D3FVMWNE3EH3C2VBKMEXS7FQL4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 198
echo "---"
echo "Running catchup command 198..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBGESKTJCPYN3VIVI6QFIGXXRRYZLY3OQB3VPVYHLC32ZMGSPDQCWZVH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 199
echo "---"
echo "Running catchup command 199..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDQEW43VJ7Z4QFZSPJTEURDINB3GLV2G6R4LGFZ7J7LAHG4Z3JM2ZQYW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 200
echo "---"
echo "Running catchup command 200..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCV75AGQHAMEA3DNGWE4NU2FDRJUFMTFZHPXDBKZG2CMPTDH5JFA7OBE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 201
echo "---"
echo "Running catchup command 201..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDO5JAKUTXH4M6XCYF4J6VNE7IOMGUU6KD33UW6EJLAKRPTXPTNORWWM")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 202
echo "---"
echo "Running catchup command 202..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC4NO3NB5XEWYHEU4UO76HTPO6P5M7XXDNIO4UGSUSIYR3FH5PP4JL6D")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 203
echo "---"
echo "Running catchup command 203..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQ5XTKTTNXQM5ERGXD5YPSCR4DQUQMS4OKBBJVNV4EMUS6MEZJMMCWE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 204
echo "---"
echo "Running catchup command 204..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDAAYMMMGKU5WTN4QJBG2EWPTF734IOKFQ5OPUOAWGNSUOML7BQKN6R6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 205
echo "---"
echo "Running catchup command 205..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAYMYKVSTSSKE6GZ5BU76SCQBF4X5ZI3AHLMSNGHTHESPFW3IVWGRRVI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 206
echo "---"
echo "Running catchup command 206..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDQ3UZTT4PUAMFPTZ3RON32NVNZD7LZJZHUQCJDW2S6BRWCF2G77CFMI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 207
echo "---"
echo "Running catchup command 207..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDZDRUGXY3CUF5LI53H7GAFMB4D76X6NWYLNO52HEAPGUHLLEBEPOR6N")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 208
echo "---"
echo "Running catchup command 208..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDXNZGJBSTIWLDUKODZTCRHAQMAVREADQYK3W3SWBGBJEDEQKYS4KKNY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 209
echo "---"
echo "Running catchup command 209..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD5ENZWYMSF3XNNL6BU2QFD4LVOZJSEBI4GR56QTH2Z5S5FRXQRNRXCR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 210
echo "---"
echo "Running catchup command 210..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD5YVN5ZI4C2TEWFQMZUWO2Q4GJURIAXFI5HRU4WZEJKCZVL6OSGWUWU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 211
echo "---"
echo "Running catchup command 211..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBJAVRU62MC6C64Y23RUIXTBTKEH2JUUJ25HXAQFAU63S2DXCUDGC3HX")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 212
echo "---"
echo "Running catchup command 212..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCXVKSQ745WHCJPMP3K57ED3277EB7YO47Q3L47PQ3LRV3NEY6AAYIV7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 213
echo "---"
echo "Running catchup command 213..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD7U7UX623XHB67TCRWWSGYTX6EHFRPHND7JP6BT7GD6QDBKZNUUCUBM")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 214
echo "---"
echo "Running catchup command 214..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAP5MIYES2ZLR6UIUGDWKJZPUTSRGW33XFLZLUH523I7DNSJ2HOE7GW7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 215
echo "---"
echo "Running catchup command 215..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDVYWQLB2SHM7NHKJKLP7TUVXKW2OA24NZCLGGWS6MDCQDNW2QWQVIWP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 216
echo "---"
echo "Running catchup command 216..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCL6DODHIWYNRZSROYDOJZP6CSNKJY3MQHGCFM3H6Y3FRBJEHPEHQM5X")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 217
echo "---"
echo "Running catchup command 217..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAQR7WMAMNX6Z7L47PVCMEJAFDHO7F2H5SONGZNDYI3QAP22VFD3SHDJ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 218
echo "---"
echo "Running catchup command 218..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCZHY67RIE5H6SDJMDRSEZVXPCJDGSUXEDZCI6UVLCK5XEGZAXLA766C")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 219
echo "---"
echo "Running catchup command 219..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBN7SZOZ6JN6L5CP27VWNCORTVW7NXR3S2KGU4RUK3O4WICEOHMU2JNP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 220
echo "---"
echo "Running catchup command 220..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAM7AF53ZAUSTZCOPNJF4PEHNVQ6XUGL3GW6HBNW5PRKYIEGPBPKDRCP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 221
echo "---"
echo "Running catchup command 221..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCICN47QDTTLFABRF2BXCNZIRICAQT7SWT32DS5XQQOW3CWOBG3GVYDE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 222
echo "---"
echo "Running catchup command 222..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCYEP4QSBI42T26B6XDB2VJ73C5NEUIIRV2XLQJ3GUKS5KROMAFZA2FA")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 223
echo "---"
echo "Running catchup command 223..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC74GYUPCRNCBK5BX6DL5XSA76LUY5R6NOHEWNDN6QQELEKQNXNYV7UH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 224
echo "---"
echo "Running catchup command 224..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB2J5IYMIT3LZ6AVYJZXM5XXAYCWASMRI4GTQLBOQ26BXWESCKOJOKQ3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 225
echo "---"
echo "Running catchup command 225..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCCZPVATHHOSSAZN7TOEZP6DKPU6UVVICTD57HS565CHBEOHXYUZPY65")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 226
echo "---"
echo "Running catchup command 226..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBWRLJUJMGU7B2PVUPU42PUDMGFXJIRTGAKF55W2YG2NLESERA53H3Z7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 227
echo "---"
echo "Running catchup command 227..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBUHCRPZ57PTDPOIQRMQ46YRT2WYRIMHCIBQRI6JLIFVNA7FPZXRLN6M")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 228
echo "---"
echo "Running catchup command 228..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDOWXOFB6FP2FBQSJXOCRYDYFEFDTESWHSJ43GMAFP7DLAORLNVYFZCG")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 229
echo "---"
echo "Running catchup command 229..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBRETM6LLKFJOORERKZXY7KGIRYAZP5OUUCS77DPHOCPD2BFMOBAB2HB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 230
echo "---"
echo "Running catchup command 230..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA47WN2UELDT6KR24U5FOQWBJXRUVHQ2FZ35RQK33JTBU4GRZLWCSNW3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 231
echo "---"
echo "Running catchup command 231..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB7JQYSL2QRXWP33EADPS47NP6KUMTIS7WVAOVV27LSWMDD5LBZS5V6Y")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 232
echo "---"
echo "Running catchup command 232..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAV3BWTQZ34SUQCKNPUJBIM7SX33QRSWB5FLN775LIZXTC2KJUEAKIKW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 233
echo "---"
echo "Running catchup command 233..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CALNM5VISAUIXLDMCA5LFTWT76KMDKARHZG5K4MG7ZKRTGLQQZFW3XD3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 234
echo "---"
echo "Running catchup command 234..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCXT753PJUEVNCWVLMO7U7XYTMA4JBXKQWUZKILFLZ5YAT7U2XFXK5U2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 235
echo "---"
echo "Running catchup command 235..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAALKRJVCC3HBMRX2IR4RJQKUKJCVLHP57JRK3ELIL4XYRUCTG53LRGS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 236
echo "---"
echo "Running catchup command 236..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD7YTZDMKCEUITK5RPNNO6JKJJBLXAZFHQIOJOT6N3LFGEW5SNVIDAZY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 237
echo "---"
echo "Running catchup command 237..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC323RTLPHXDCL5TDQ6IJ4JQSHQ45JS56L3GJNHECP6XR2KXAAAV4VJH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 238
echo "---"
echo "Running catchup command 238..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDKPDKBPELIRTMVVOYDBWN23HX7FQDCIIFYER7JIGDDHVSUPPBSDRG5L")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 239
echo "---"
echo "Running catchup command 239..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBS3IQ2XCJUUWWCZLMXV4KAGCMKDMOFFBTN7GGYPFVB6TKJ2H6MCLCAH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 240
echo "---"
echo "Running catchup command 240..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC5WLIFMTXRHDCVH7PTJFJ46UVVGNBYLNCG35XF34VU7IWIFHDS7SA6R")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 241
echo "---"
echo "Running catchup command 241..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAAXF6ORSZXWZATPCHNMLYOIEL57JB4FWPO4X5W2MT2YP4VN2RWNR7UW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 242
echo "---"
echo "Running catchup command 242..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBUWW2R3LZYQDY2JCI3GZGRJ6MJ6UJIOAUE46P3JMWFSHA3RYC37OWHH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 243
echo "---"
echo "Running catchup command 243..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCVXZ25TZTWMRANOTOAGFE3LBYD6J6C2NJU4XMZIX26TNVP4FS7PW6ID")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 244
echo "---"
echo "Running catchup command 244..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDNT5UGXHX7EOHFEEIBLDNG32NBOI4HKMQXRJE2J4V2HCASG2MNQY4WF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 245
echo "---"
echo "Running catchup command 245..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAYWGHR4YS2FG3VBHJQCCF47IHACFSDVDIMOOFC6WQZKKQKWXFNTU7U4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 246
echo "---"
echo "Running catchup command 246..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDF5HBRA3C6IS5367Q2OJTSTYMJQQ4UGAI3PIP67XNWYJGUML7YURAOM")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 247
echo "---"
echo "Running catchup command 247..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CANYYTONTYJGHFDA6ZQHHHTXG4KJPDVPDNM6UBBEI72UAY7T7GK4HUVD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 248
echo "---"
echo "Running catchup command 248..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD2R2ZEZDGUPO4EVAD3LHCSHAEYM6VRPAY4N6NSH32REOWQBT4IW7VQL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 249
echo "---"
echo "Running catchup command 249..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDYRC3R5UHL5GZRVCVBCHDMIM2JY6LTG4F2AVKNM2BS37DPZ53GDPYP4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 250
echo "---"
echo "Running catchup command 250..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBUBTJF7UWZVMDRS33J5Z7YUBC7ZXD37RLM73YMBDKDCD3ZCJSFF7V3L")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 251
echo "---"
echo "Running catchup command 251..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAOZKIRIOV35ZUWA4POK6LXPUS4QYEFEJH7O7N6HLJLZWK2CB7JZ4B52")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 252
echo "---"
echo "Running catchup command 252..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCYCQGO4OZMGYOSJFQULS3FNHCGE7OWIS2OFPXQ4CA2BP5VHNOEYLLUE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 253
echo "---"
echo "Running catchup command 253..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD2XWE4KILQK2QZWGLI2HELLKGMSOYA4E5FIKOSHGG52TPM4XPJW63GI")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 254
echo "---"
echo "Running catchup command 254..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBDJPL34RBG252JOXEASEWJ75BVKMKP3L4OBPLOT37HMBIS2SJENB4JM")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 255
echo "---"
echo "Running catchup command 255..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC2MHBC466INETDW7CF7RICSB2SQTW32C3JBOBRAECROQ3FNEKQEL4NK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 256
echo "---"
echo "Running catchup command 256..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDZ55QQNWCZCGHQC3SXR4AYEX6N63CT3UMBRBIXU5O7OU7POMZDXCITV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 257
echo "---"
echo "Running catchup command 257..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC5RC634BU4RDPUISK3N4DT3LH2TMZWAZJGZEEOK2647VIAVXNYAMZBK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 258
echo "---"
echo "Running catchup command 258..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDBWDGRPLMQ7QNK3NJTNY37SNG5MBNFADDAYTBWMC5O7HZAUGHPB7IH6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 259
echo "---"
echo "Running catchup command 259..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDV3VSWJ4NNO6ODAWETUZLSUCTCB6JEMGLF52TBU4ENW5BIKO6O4XRBO")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 260
echo "---"
echo "Running catchup command 260..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDKDO4OBZK5N7ERCHANGFIRWHWXDT7RI2ODLXTHVOJ7NEEK4VN4BQRHV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 261
echo "---"
echo "Running catchup command 261..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCYVKTOWPBOWFXW2IHVP5KCBSAZI6MBVSCQEDWXYFTLFYUC2YTQI27RO")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 262
echo "---"
echo "Running catchup command 262..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAUPEUISYXQNWKPELV5R35ASKJGXLPQGVYIWT53PWB26KBTYYPQOTO5K")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 263
echo "---"
echo "Running catchup command 263..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA7JYJHK2CHMY7K2EJCHLEEMKIPXQH34PCI6AKZNEQCLNCCW4UAK6QYY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 264
echo "---"
echo "Running catchup command 264..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCL5KLC5WFQZOSI7OCVYSRQMORERCIWKZQ6EYBFIO7NKXVF7BFGI7LLT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 265
echo "---"
echo "Running catchup command 265..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBKAWTOWJCMEVBX5QXIXCLU6V2XZVYZHDXQV5F7W4XDG7OEAF4DXNYPJ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 266
echo "---"
echo "Running catchup command 266..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA3Z2SENJQQYNA7NTAZAZHIM7LSJ5TGNO7YBDEUMQ5IRITHAKQNWXGMC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 267
echo "---"
echo "Running catchup command 267..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAEHVPZ7TKREXC3FPCXE6SOBYCXEBXRFW222VARBJR7IMNP4YPRWRHNN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 268
echo "---"
echo "Running catchup command 268..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCGMVCAH3KZSUB2Y4QJV63PLDHUHJDHR3WBQV26MKXSQD6DM7XSS4JOK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 269
echo "---"
echo "Running catchup command 269..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAPFX3TACZQD7E7O2L3AEXWK32TIMMTTWY5FH3Q5DR7QREO2SIFCXT4J")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 270
echo "---"
echo "Running catchup command 270..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC3TMIIC7ZDX67P3QG6CLEXMLMYZOGSZZ5IUKIUPYL4MGH2V4MJSHCRJ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 271
echo "---"
echo "Running catchup command 271..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDQQDQMN6IS3F3GDKAYM7OXQBPSRPBNUBN5RK4HU25KR7NPWW4VBRR4O")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 272
echo "---"
echo "Running catchup command 272..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA5NN7LZGIMEXAH7TN5H677BJNZWFWFY4WVTZ7TEDXVKBDDJG2RDJNCL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 273
echo "---"
echo "Running catchup command 273..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBGTLJBJIBJTYQMXYXGNENVJZD2APB3GK3FACVG3W5U3O5PCHPJNYC4E")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 274
echo "---"
echo "Running catchup command 274..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAZNK2XX7FLOP5YWNLYNSYBPGSAJRHTY4PGOBCI3KAOP3VGLVPG5MIDR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 275
echo "---"
echo "Running catchup command 275..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCGRD653HPYHPD3G2YZDMR3OQ3BIKOB3GOTTVFYCHSM7GTBWSEGP3UYV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 276
echo "---"
echo "Running catchup command 276..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBZ5DETW6W3PQLOEVWW4OAYLOKC5MSHC7DFL3UPJM4GUWS4TQV4UDGT4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 277
echo "---"
echo "Running catchup command 277..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA4LXGHGYCKL7DCZ3YNRP4JI5RC4V4IIY3HO424PFYVOS5AJNO6ZHKBF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 278
echo "---"
echo "Running catchup command 278..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBBMZSP3X6GMTIJT6JUZMH7MT6LEPS3NHURZVJ7WZ4MX4XTTB75X4VLE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 279
echo "---"
echo "Running catchup command 279..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBI345TH4MNMCUY4MKKKF4RQSN2ZLYAOAPVMP7QNOXQ3A7UHLHJKJWNQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 280
echo "---"
echo "Running catchup command 280..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBCPMBXPODYJWXLMVTYMGVAHMOZ4GY2DAQMMGEHPOAI476HVXH2WJLG5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 281
echo "---"
echo "Running catchup command 281..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBPKOF73UHZXA2QPCZEFPFVQPSXD6RQTUEQKDEEDAVPZGITAWJUCV4BS")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 282
echo "---"
echo "Running catchup command 282..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBTTG7CYKPIEFNLBIYQZEZ6AMWU4CHD2VFZKQAQRZSFFIAUAPYGAMPJL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 283
echo "---"
echo "Running catchup command 283..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBQPUOZS25YH64EI3YGD2GXGEN2AV73X4LLYGAG7YIUZ5B4IJHZ2W63Q")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 284
echo "---"
echo "Running catchup command 284..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBQT2VCMVVRUOWJ3EVHX4ZUK6V5W3ZI5ZRHZ5EOP3FG2JJCFVXDMNA5B")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 285
echo "---"
echo "Running catchup command 285..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAR6X3YSPCOXX2KLVKXBBRJ7UAGDRACMHTT47ZWBPHAPQ6NUCBUIKCJT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 286
echo "---"
echo "Running catchup command 286..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBSIIB47SHI6PMYRXVVZATU6LZF4UJCZSACWCTPXSLPISBGKX35G7ALQ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 287
echo "---"
echo "Running catchup command 287..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCBJNZN5HZ733RLFJVRZVWG7AL5IS2RZXBDQSURJ5XDV7X5CQKZ7YO66")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 288
echo "---"
echo "Running catchup command 288..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAKYE57VRCDBO7Y6BO6L3UFHDAZHTDJWUY4JONDVMU7M4CDFXKW2YLBE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 289
echo "---"
echo "Running catchup command 289..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCKABYMMUY5GD2O3OSNKLBI7WHMXTJN33VROX3XC6HSKXMHNLLSHCBQW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 290
echo "---"
echo "Running catchup command 290..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAZTLJ23EWC4BIP7HV37Z5F4QETIUE43CAROIR6BRIWVF4OJWQRNQCNM")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 291
echo "---"
echo "Running catchup command 291..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CARE4L4E46ZXQ2KKXCAGES4TOLW6FO5CADPXEQNLP6I6TGF4WWZRR4LC")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 292
echo "---"
echo "Running catchup command 292..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCJDC3IS7HOKISKK7TQMWRVYWXLQVRQGLVYYRVXSW5OCLXWX42BO2HCT")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 293
echo "---"
echo "Running catchup command 293..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCU2ZKZT7BKDKL62ON3YAJO7QGVANGLN3R2KZWGOEKPZIQYPD5YDIXFR")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 294
echo "---"
echo "Running catchup command 294..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB3C3DDKNQSHGLG7JAF4MTC25D55T6CEHNYB2OUXEOVS2RGDZT7M5XPL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 295
echo "---"
echo "Running catchup command 295..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCGWKYMRO547QB4OZM5BKZGCPY5GKRJ2V4I35NNGA5Y3VDY2EQUQIIWD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 296
echo "---"
echo "Running catchup command 296..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCJ3RHCSLEMASBUM2JQLIEEEURRFIS2AY5PNDHCQ4HC6VSOGI2YYTKV7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 297
echo "---"
echo "Running catchup command 297..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCEFUYCXF2KIAWIO4HY5ETKPPV6PN6ASDPOP5N7IPLL6SQVZOM7FXM6S")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 298
echo "---"
echo "Running catchup command 298..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCNBUXRWZTR5LGPN52ZV4CCFOT5GVIPAWRJIMJVSOBERZDUHVZM2LS7X")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 299
echo "---"
echo "Running catchup command 299..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAYVMXYXXR7YBSYPWCSGFHZF3M33T3HW4R53ZA63V3BE2YYOXAQTPGK5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 300
echo "---"
echo "Running catchup command 300..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCCWBZGKCZLH7GUOIPGYRGA7ILVPG6O7VIKGQOUCUWKX7MSMLXQZTWHG")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 301
echo "---"
echo "Running catchup command 301..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA4EIQBRLT4I3XCWR4A7RBCGH535UKR7MCZI5MXLTEYKMA66MNWQZKON")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 302
echo "---"
echo "Running catchup command 302..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDRMP7NEUOWCJOKTFR67FEBPDA25F63WTWKGUADH24TD3EM4AIEQBVHP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 303
echo "---"
echo "Running catchup command 303..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDCKQTXWAR2XQKOAOTWOHAR6WPDOOC4KABLWCBWRTAQTYRVXPZ4I5NVE")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 304
echo "---"
echo "Running catchup command 304..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCEENKBOZLRVRJ5SFR4PH5T7D7DZ7QMOJ4BPX5FDOKZJAM6FS3DERX7O")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 305
echo "---"
echo "Running catchup command 305..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDVFP6ELDFLQZYHLKVAKGFX7N2FTS2NQ57JJ7Y72PQN5LSVVPN4IIE5I")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 306
echo "---"
echo "Running catchup command 306..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDWF2VPDG3AADCT5FICVVF7Z23BX4YEGW54DVATLLKCPWIRPOTBI7VHP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 307
echo "---"
echo "Running catchup command 307..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA3VNSN5EFZGH47ZVBXUYCUTWUIXY3RLXGD7ZNAMWZ3N2BHAEL7PAPWJ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 308
echo "---"
echo "Running catchup command 308..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDSW7NRKV7BMSKXUFRN7GGIMLPODYHC4CDD37PG6OLMDQZE2JRO2OVIU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 309
echo "---"
echo "Running catchup command 309..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCJVK5L2QZEH4VTE2STDAUTAJTNUW2TLBIDII3AIGZ62V2L7M4GA24HV")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 310
echo "---"
echo "Running catchup command 310..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB5UO7WFNMWNBWJQVBFJ4QTIARP5MKVQSWSMUI46CDZWTRVRYPRE7BV4")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 311
echo "---"
echo "Running catchup command 311..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCS6ULBUU2H3NDSAJKRHKUTZFROPRRIUDNRBSWP27CRDDIJSD52NPM7X")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 312
echo "---"
echo "Running catchup command 312..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCS2SHGQFRRU3YQQXODBSVFDF6G2E2GAPAJ2LTULYEH2RNKMC47FCT3F")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 313
echo "---"
echo "Running catchup command 313..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CATDM2LCY7LNQBRN56UK7EIBL5FCWMZC7SFKL7YRCM6HHZOPNXEQVE45")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 314
echo "---"
echo "Running catchup command 314..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB22UQAECWTMKIPRYREKAD4H3K4NKK3D72GMYRG3BX3JFDBR74HOUM5W")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 315
echo "---"
echo "Running catchup command 315..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB6ONQHNQ3DXCU3AQEKI477N44PDZUSDVHA4SJNB23PRIVG2RWA4THLB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 316
echo "---"
echo "Running catchup command 316..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDP7T3OXSLR5FH6RCVHZSD7UW2E2IDDZZQPM4SIFZPQDLH5IYI47LKV2")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 317
echo "---"
echo "Running catchup command 317..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDKMIWYNOAILNDG5FASZQNSLACCHBVAY4Q3WQG2YJFPK6JPKPOKK5T2Z")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 318
echo "---"
echo "Running catchup command 318..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBIW55N334WSN6TBUKB4C7HGSVGH7LPSVI7SHQURGE2PNBF6VI3YIHVW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 319
echo "---"
echo "Running catchup command 319..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CALRDJ5TBBHKX5WHIQXROTW6U5K7FVAVE6MAO57SAOXLV3ZCBS7QE5P5")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 320
echo "---"
echo "Running catchup command 320..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBX62FYBAW3XIGF37UL52IBZOW5YARQI53IDE2WJXKMP4JYCIZCD2KXX")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 321
echo "---"
echo "Running catchup command 321..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CABDMCL6UG534VHHYVV3QYSM6ELWX52XIZ6W2TJ7FQX57QJT73FXRSU3")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 322
echo "---"
echo "Running catchup command 322..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBXQSTRAGO7NUMPLDMVTZWGESW6KJAA32XHH2JD4Y6VP3CSSMFHXSZX7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 323
echo "---"
echo "Running catchup command 323..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD72NXRNOUDZQLVD3GBPJEMMFC6C2AER5WWDAXX4T2DICPFXNXGJI7CN")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 324
echo "---"
echo "Running catchup command 324..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBQHWYFHJET4SLTHRLE4OT4AL6K3DMZPERYPQT6XEZGTGBV54E3IUQKY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 325
echo "---"
echo "Running catchup command 325..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB6SBBIVALU4FUIHK7KXKIVOGGVSG5NTBGNA2K7KZ6HR2LBXZADH7ZZZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 326
echo "---"
echo "Running catchup command 326..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBUFUL44G6UQMKEMFMXJ3DKTN7ZY6XFBLXKFPASYHYNONF5AGDV7VPGU")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 327
echo "---"
echo "Running catchup command 327..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC4KG3VO3XETZ34NADZVICG5GKF2FQS6Q5IN7HTV4B7XREHUTQ7XP7ZW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 328
echo "---"
echo "Running catchup command 328..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDPMBL4L527AIBNVADMHCNFPC63LFFW64ZJOLAOXFA3FI6WDSBTRLTFY")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 329
echo "---"
echo "Running catchup command 329..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBSQ4H577H3HKL3DI7ARNK6UPXWIQHI5GRLE52GUYOF3EAOQJD63Y2GD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 330
echo "---"
echo "Running catchup command 330..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBZNK44KMRY42ZTVNIV2BZJGLHXX3Q5QRMUSNJER3637R2OOR3FEIBUD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 331
echo "---"
echo "Running catchup command 331..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAFP464AMURHXB5CHLOKGRSMROCP3M5FK26UWA53GO4ZVKQTW4BSYJV7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 332
echo "---"
echo "Running catchup command 332..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDGE3ZYG6IBZB2CXJDUAFYMX2BSBRBT2VRAS647MTRSLULP3VI5WF4GH")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 333
echo "---"
echo "Running catchup command 333..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAJ6P2QSVBXS32BCQPTSHIUACFFDNQBDRHHG2YLDOTEDQBVKUXLTSP6X")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 334
echo "---"
echo "Running catchup command 334..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CD3VDJ6EEBZ45USKUTJJ7FHNKMM63KKYPZMJQNRRTECOQF2VLRUHIPOZ")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 335
echo "---"
echo "Running catchup command 335..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCSLQTYAM7SDLUO6T6HE33S2MWC6FJLFVR6XP62TRVQWKZY2CVZSIOAD")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 336
echo "---"
echo "Running catchup command 336..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDVO6DKWDEO4NBMYF72DR3SVNSEBRYPWR23JZNYSTWQKHH6A25HFF3X6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 337
echo "---"
echo "Running catchup command 337..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCMZY3G6QS4CQ4KFIMSM6GESV25QJJCQ7PX6XY364X6WT2XJRUU23WHL")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 338
echo "---"
echo "Running catchup command 338..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CC4TY56F5KAGJTHGASH5AOZDRLAAVKCMMQWXYVR5SE422AVGEVKNMRYB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 339
echo "---"
echo "Running catchup command 339..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA4W26Z74RIMZSL4MGJ62MD6P74D42YYPFGMDUUGTORZDP73KU7UK5IF")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 340
echo "---"
echo "Running catchup command 340..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CA72DEVOTIQAUHPAOBHGAF27SXHV6ROPZCQKTYYKLFUKXTCHGDTJHU3K")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 341
echo "---"
echo "Running catchup command 341..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBLNBFVXASQ4GC5Y2CMRDMFDK2NEMQJOACAB2Z3OMHXIEOWBL3LUPEB7")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 342
echo "---"
echo "Running catchup command 342..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBZIVKKAVMORVKBGPMLEZNH4EIM5VP2LEGEERKAS4FCQCOBLCG2WZA7T")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 343
echo "---"
echo "Running catchup command 343..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBXG7FSHZMF4DLJPOIX5YBULHTED5DUIDLGNFXPP2DA5P6UQDF4QZRKP")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 344
echo "---"
echo "Running catchup command 344..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDF6XEQPRVJCAYMVHUNCGRTS4RB2OQTRWJRAGAFIOG23TN7LOPPQ7ZZW")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 345
echo "---"
echo "Running catchup command 345..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CCVWMHNFH3ERT4XRE2JUBZAJNAJUUXM2YNJNPVR2VQICSPZJQAM2GFIK")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 346
echo "---"
echo "Running catchup command 346..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CAT6ZZOUE7LF33XSUVLXXW2YG764YRCET7CCQDIL53T4QMAF7S3O63SG")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 347
echo "---"
echo "Running catchup command 347..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CB5MYGAQVDTCAISMNP3EWGCG4AQHTGGTYBOEAIFBNGCFN4QTWJJLKA4Y")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 348
echo "---"
echo "Running catchup command 348..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CDMSKRWHN2QM4EYIWEJATRB6NS7IUFMDTH6MKUDOG2IZMGSO7HIO4JTB")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 349
echo "---"
echo "Running catchup command 349..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBJIBCDOENLOB5SVKTHMNJT3A72UKYORV5BWDDZCLANRNK65R3HNG6BX")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 350
echo "---"
echo "Running catchup command 350..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts CBI3TEOV5PM625ILW6NEYCFCLOX6PZXO722HGDVUHOG4ABWHXJGLFOD6")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //')
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
  