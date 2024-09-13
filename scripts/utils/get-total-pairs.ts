
import fs from "fs";
import {invokeCustomContract} from "./contract";

// import * as StellarSdk from "@stellar/stellar-sdk";

export const getTotalPairs = async (protocolName: string, network: "MAINNET" | "TESTNET") => {
  let contractsJsonPath;
    if (network === "MAINNET") {
    contractsJsonPath = "/workspace/public/mainnet.contracts.json";
    } else {
    contractsJsonPath = "/workspace/public/testnet.contracts.json";
    }
    const contractsJsonData = fs.readFileSync(contractsJsonPath, "utf-8");
    const contractsJson = JSON.parse(contractsJsonData);

  if (protocolName === "soroswap") {
    const factoryAddress = contractsJson['soroswap_factory'];
    console.log("🚀 ~ getTotalPairs ~ factoryAddress:", factoryAddress)
    

    return 0;
  }
  else {
    throw new Error("Protocol not supported");
  }

};
