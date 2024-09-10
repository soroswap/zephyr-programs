import fs from "fs";

export const getContractAddress =  (contractName: string, network: "MAINNET" | "TESTNET") => {

    let contractsJsonPath;
    if (network === "MAINNET") {
    contractsJsonPath = "/workspace/public/mainnet.contracts.json";
    } else {
    contractsJsonPath = "/workspace/public/testnet.contracts.json";
    }
    const contractsJsonData = fs.readFileSync(contractsJsonPath, "utf-8");
    const contracts = JSON.parse(contractsJsonData);
    return contracts[contractName];
  };
  
