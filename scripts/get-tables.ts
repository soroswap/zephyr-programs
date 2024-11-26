import fs from "fs";
import path from "path"; // For handling paths
import { zephyrTableToGraphQLParser, ZephyrTableOriginal } from "mercury-sdk";
import { getPairs } from "./utils/get-pairs.js";
import { getSoroswapEvents } from "./utils/get-soroswap-events";
import { getZephyrTable } from "./utils/get-table.js";



(async () => {
  const network = process.argv[2] === "mainnet" ? "MAINNET" : "TESTNET";
  console.log("🚀 ~ network:", network);

  console.log("Getting the Pairs Table:");
  
  let soroswapPairsTable = getZephyrTable('soroswap_pairs', network)
  let zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapPairsTable);
  const pairs = await getPairs(zephyrTableGraphQL.address, network);

  console.log("🚀 ~ pairs:", pairs);

  let pairsTablePath;
  if (network === "MAINNET") {
    pairsTablePath = "/workspace/.temp/mainnet.pairs.json";
  } else {
    pairsTablePath = "/workspace/.temp/testnet.pairs.json";
  }

  // Ensure the folder exists
  const folderPath = path.dirname(pairsTablePath);
  if (!fs.existsSync(folderPath)) {
    fs.mkdirSync(folderPath, { recursive: true }); // Create the folder if it doesn't exist
  }

  // write json into file

  fs.writeFileSync(pairsTablePath, JSON.stringify(pairs, (key, value) =>
    typeof value === "bigint" ? value.toString() : value, 2));



  console.log("Getting the Soroswap Events Table:");
  
  let soroswapEventsTable = getZephyrTable('soroswap_events', network);
  zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, network);

  console.log("🚀 ~ events:", events);

  let eventsTablePath;
  if (network === "MAINNET") {
    eventsTablePath = "/workspace/.temp/mainnet.events.json";
  } else {
    eventsTablePath = "/workspace/.temp/testnet.events.json";
  }


  // write json into file

  fs.writeFileSync(eventsTablePath, JSON.stringify(events, (key, value) =>
    typeof value === "bigint" ? value.toString() : value, 2));




  
})();
