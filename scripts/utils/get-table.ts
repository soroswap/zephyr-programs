import fs from "fs";
import {ZephyrTableOriginal } from "mercury-sdk";

export const getZephyrTable =  (tableName: string, network: "MAINNET" | "TESTNET") => {

    const environment = process.env.ENVIRONMENT;
    let isDev = false;
    if (environment === 'dev') {
      console.log('Running in development mode');
      isDev = true;
    } 

    let pairsTablePath;
    if (network === "MAINNET") {
      if (isDev) {
      pairsTablePath = "./.dev.tables/mainnet.zephyr-tables.json";
      }
      else {
      pairsTablePath = "./public/mainnet.zephyr-tables.json";
      }
    } else {
      if (isDev) {
      pairsTablePath = "./.dev.tables/testnet.zephyr-tables.json";
      }
      else {
      pairsTablePath = "./public/testnet.zephyr-tables.json";
      }
    }
    const pairsTableData = fs.readFileSync(pairsTablePath, "utf-8");
    const pairsTable = JSON.parse(pairsTableData);
    const zephyrTableAddress = pairsTable[tableName];
    const zephyrTableOriginal: ZephyrTableOriginal = { address: zephyrTableAddress };
    return zephyrTableOriginal;
  };
  
