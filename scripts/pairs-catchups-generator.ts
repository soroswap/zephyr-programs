import fs from "fs";
import { zephyrTableToGraphQLParser, ZephyrTableOriginal } from "mercury-sdk";
import { getPairs } from "./utils/get-pairs.js";

const buildCatchupCommand = (contract: string, network: string) => {
  if (network === "TESTNET") {
    return `mercury-cli --jwt $JWT_soroswap_testnet --local false --mainnet false catchup --contracts ${contract} --project-name zephyr-soroswap`;
  } else {
    return `mercury-cli --jwt $JWT_soroswap_mainnet --local false --mainnet true catchup --contracts ${contract} --project-name zephyr-soroswap`;
  }
};

const generateBashScript = (commands: string[], network: string) => {
  let networkName = network === "MAINNET" ? "mainnet" : "testnet";
  let scriptContent = `
#!/bin/bash

# Clear the catchup numbers file
catchup_numbers_file="/workspace/.${networkName}.catchups_numbers"
> \${catchup_numbers_file}

`;

  commands.forEach((command, index) => {
    scriptContent += `
# Run catchup command ${index + 1}
echo "---"
echo "Running catchup command ${index + 1}..."
output=\$(eval "${command}")
echo "Got output \${output}"
catchup_number=\$(echo "\${output}" | grep -o 'catchup [0-9]*' | sed 's/catchup //' | tr -d '[:space:]')

echo "Catchup number: \${catchup_number}"

# Save the catchup number to the file
echo -n "\${catchup_number} " >> \${catchup_numbers_file}
echo "Catchup number \${catchup_number} saved in \${catchup_numbers_file}"

echo "---"
echo " "
`;
  });

  // Add a loop to check the status of each catchup
  scriptContent += `
# Check the status of each catchup
while true; do
  for catchup_number in \$(cat \${catchup_numbers_file}); do
    response=\$(curl -s -X GET "https://api.mercurydata.app/catchups/\${catchup_number}")
    
    if echo "\${response}" | grep -q "completed"; then
      echo "Catchup \${catchup_number} is completed!"
    else
      echo "Catchup \${catchup_number} is still in progress..."
    fi
  done

  # Wait for 10 seconds before checking again
  sleep 10
done
  `;

  return scriptContent;
};

(async () => {
  const network = process.argv[2] === "mainnet" ? "MAINNET" : "TESTNET";
  console.log("🚀 ~ network:", network);

  let pairsTablePath;
  if (network === "MAINNET") {
    pairsTablePath = "/workspace/public/mainnet.zephyr-tables.json";
  } else {
    pairsTablePath = "/workspace/public/testnet.zephyr-tables.json";
  }
  const pairsTableData = fs.readFileSync(pairsTablePath, "utf-8");
  const pairsTable = JSON.parse(pairsTableData);
  const zephyrTableAddress = pairsTable["soroswap_pairs"];
  const zephyrTableOriginal: ZephyrTableOriginal = { address: zephyrTableAddress };
  console.log("🚀 ~ zephyrTableOriginal:", zephyrTableOriginal);

  const zephyrTableGraphQL = zephyrTableToGraphQLParser(zephyrTableOriginal);
  // const zephyrTableGraphQL = {address: "allZephyr923625Cad8F2Bf73069B63583354Ba4As"};
  console.log("🚀 ~ zephyrTableGraphQL:", zephyrTableGraphQL);

  const pairs = await getPairs(zephyrTableGraphQL.address, network);

  console.log("🚀 ~ pairs:", pairs);

  // Collect all addresses and generate commands
  const commands = pairs.map((p: any) => buildCatchupCommand(p.address, network));

  // Generate the bash script
  const bashScript = generateBashScript(commands, network);

  let pairsCatchupScriptPath;
  if (network === "MAINNET") {
    pairsCatchupScriptPath = "/workspace/scripts/mainnet.pairs-catchups.sh";
  } else {
    pairsCatchupScriptPath = "/workspace/scripts/testnet.pairs-catchups.sh";
  }

  fs.writeFileSync(pairsCatchupScriptPath, bashScript);
  fs.chmodSync(pairsCatchupScriptPath, '755'); // Make the script executable
  console.log("Pairs catchup script generated in", pairsCatchupScriptPath, "for network", network);
})();
