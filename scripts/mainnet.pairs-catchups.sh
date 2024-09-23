
#!/bin/bash

# Clear the catchup numbers file
catchup_numbers_file="/workspace/.mainnet.catchups_numbers"
> ${catchup_numbers_file}


# Run catchup command 1
echo "---"
echo "Running catchup command 1..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CB46LMGJC7SYSH4C7SBNLV635OX5BSNQDGRR32NRXAV7N2AVNZMQUJ3A --project-name zephyr-soroswap")
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
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CB4LVW7XBXM4YMKREJK7ZLMI6H44FEEFZVRUTOYEZ5DOLS44KDS6J6XV --project-name zephyr-soroswap")
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
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CBJ3WO7M3H7EI7ATEBYHLZBJCW4OXHU3FRG7LK6ZTRHLKKLFW5NHY4Q6 --project-name zephyr-soroswap")
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
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CACXB6KH5DQVQKQGXKHF2M5TEKFY5KIDCKSEXZYJ27Z5465V2SSALCBW --project-name zephyr-soroswap")
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
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CA4VTJFKCIXVH3G2MEYAGA4U5A7IBWFFDODTSR3KUAQ4KZMI37J75CYX --project-name zephyr-soroswap")
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
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CBJYBRJAAI4NMALSD6S3FNOKKDJR463CXYIGW7A7FCHOZIBAC4HIJEB7 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 7
echo "---"
echo "Running catchup command 7..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CB2IMINSODLFTKXG6AAS7DZNETFRTJ4ES5WRBO4ROY4ANFQJTKOC6SS6 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 8
echo "---"
echo "Running catchup command 8..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CDRS7NJPAX2HLYNENMUH3USUV6LP6KYSLZZ4ULY27RQLKIVC5DGLEVKI --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 9
echo "---"
echo "Running catchup command 9..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CC7CDFY2VGDODJ7WPO3JIK2MXLOAXL4LRQCC43UJDBAIJ4SVFO3HNPOC --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 10
echo "---"
echo "Running catchup command 10..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CDDEKHF7HRD3JSTIK2BQ4IHJQI64V3SO3HPR2DZBP3OBDBQBKOJNNQU7 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 11
echo "---"
echo "Running catchup command 11..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CCOGGZBP22NP2NPNGU4IA44AUPD7BAOVU42XGLMK4IA4SVSSDC3375PU --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 12
echo "---"
echo "Running catchup command 12..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAX57ZNIZKVBDZ36OFH5IAMBTDDCJ4F54KUKCJRUKG5POIISYWL46P3U --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 13
echo "---"
echo "Running catchup command 13..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CDJXIUCWP3BWZWNPPL52YRG7FHG6LWAHN5RTYR4FLY7A3PJKSZ7LGCSC --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 14
echo "---"
echo "Running catchup command 14..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAI7B3M2EPGDA2GMHCHUD5JS7MEJ7HA7U7GP5L2IOJWWAE7VRTMTJPNX --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 15
echo "---"
echo "Running catchup command 15..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CCB6AP3L24Q7KW3LTMO6D3KLNV6MAFTK2TDTJ3XP7BRI2OP4O6SWQM53 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 16
echo "---"
echo "Running catchup command 16..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CC2MSLNFYG63SKXLUTOJJOJWBORZ7NKH4IC66MG5SITKSN5MMFYH6FPE --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 17
echo "---"
echo "Running catchup command 17..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAURS6NIANW7PQEZX35NBZZFGQFTULHREJFP44YWNBR33KGKJLOASZIW --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 18
echo "---"
echo "Running catchup command 18..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAX7KGAVK4YBJJWLNV22DFEWC53LKQG3TNSUORMYEDGRT57PTW5K7BZ2 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 19
echo "---"
echo "Running catchup command 19..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CCXCD5BD576T7DUQ7VMKMZLOQWWDQRDCKCKCN6SJBRYWIQ3Q2OEKXHWQ --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 20
echo "---"
echo "Running catchup command 20..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CADRWHW2ASLZYF7C4UL4IGGXQGL3ERHBNYYYYTZFRIM36U4CNTS7C3SA --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 21
echo "---"
echo "Running catchup command 21..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAC7CX77YKAXS2LES3W54KTY6KDDMDBXRJ5TWK7UX2N4OFBY2OJEUJQW --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 22
echo "---"
echo "Running catchup command 22..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CC7Z3FQD2FRBN2QQMN5R335YGSS7QO7YLYTJZV3HGPPS6GI373O5UZDI --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 23
echo "---"
echo "Running catchup command 23..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CB4UVMNV25WS24YN3RCFK2DYQXHAZWAWT7LLB2NLTRXTVTHMJ52YHNGS --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 24
echo "---"
echo "Running catchup command 24..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CB63RYTOXPVHXJAM7BGN7AUKFGHUCT5KVCK4H2BV4CHPEWIV4J3WDY3W --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 25
echo "---"
echo "Running catchup command 25..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CCXOKQBBNRJ7YKY4Y6HTXAU5ZLV7PKENA7ZT74UAAXZ6XUEE22YQGBCS --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 26
echo "---"
echo "Running catchup command 26..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CDQ4UKVWHJKR465B3NN2YP3IMWBEZ77YYJYTHYZA3BWNTPRHFOJ4OY57 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 27
echo "---"
echo "Running catchup command 27..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CABIXKWFCRM6VYUPNKF5C24O5LRCINE4XGB7SRUK67T6EVYMQSRUROKH --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 28
echo "---"
echo "Running catchup command 28..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CATUJXDUO7SSSTAKSUV5YU6RSTB4B5AVIHQDV26QTCXOB46T6SLMWNMY --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 29
echo "---"
echo "Running catchup command 29..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CCH3CJZWG6UMW522ESP3UHL4DCZLNXZLUHKYG5GCGNG5HXRL4A6O4A23 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 30
echo "---"
echo "Running catchup command 30..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CACTIOUW5FHYD3Q6ENKAU2IBLO2YFRWST4OGPDB4H32OGFMMJQF6SAJ5 --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 31
echo "---"
echo "Running catchup command 31..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAYSBVJOBO34WZHGAG2RNQZ52ZUBZRUHOTSIUIBJ2ZFSAZQPY73FPQNI --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 32
echo "---"
echo "Running catchup command 32..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CABJYKXLX5PIXGUAHJS7VG7XVMGFEPRGI5KH37F45H37YIJNEHDBVXCN --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 33
echo "---"
echo "Running catchup command 33..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CCHAZKZPWUN7YFY5Y2TABRKJ2REEMW4QSU6HGKWPIKO7KGU3VAW2K5SL --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 34
echo "---"
echo "Running catchup command 34..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CAM7DY53G63XA4AJRS24Z6VFYAFSSF76C3RZ45BE5YU3FQS5255OOABP --project-name zephyr-soroswap")
echo "Got output ${output}"
catchup_number=$(echo "${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: ${catchup_number}"

# Save the catchup number to the file
echo -n "${catchup_number} " >> ${catchup_numbers_file}
echo "Catchup number ${catchup_number} saved in ${catchup_numbers_file}"

echo "---"
echo " "

# Run catchup command 35
echo "---"
echo "Running catchup command 35..."
output=$(eval "mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts CBVOZM3YLSK3IEKTL3XB3V7CMRU2JNTC3MISPEDMMU4XEUIXDQT6FP6T --project-name zephyr-soroswap")
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
  