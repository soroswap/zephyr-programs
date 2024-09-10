import fs from "fs";
import {ZephyrTableOriginal } from "mercury-sdk";

export const getZephyrTable =  (tableName: string, network: "MAINNET" | "TESTNET") => {

    let pairsTablePath;
    if (network === "MAINNET") {
    pairsTablePath = "/workspace/public/mainnet.zephyr-tables.json";
    } else {
    pairsTablePath = "/workspace/public/testnet.zephyr-tables.json";
    }
    const pairsTableData = fs.readFileSync(pairsTablePath, "utf-8");
    const pairsTable = JSON.parse(pairsTableData);
    const zephyrTableAddress = pairsTable[tableName];
    const zephyrTableOriginal: ZephyrTableOriginal = { address: zephyrTableAddress };
    return zephyrTableOriginal;
  };
  
