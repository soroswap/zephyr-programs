// import fs from "fs";
// import { zephyrTableToGraphQLParser, ZephyrTableOriginal } from "mercury-sdk";
// import { getPairs } from "../utils/get-pairs.js";
import { getZephyrTable } from "../utils/get-table";


test('soroswap zephyr tables should exist in MAINNET with correct format', () => {
  let soroswapTablesNames=["soroswap_pairs", "soroswap_events", "soroswap_rsv_ch"];
  for (let tableName of soroswapTablesNames) {
    let soroswapTable = getZephyrTable(tableName, "MAINNET")
    expect(soroswapTable).toBeDefined();
    expect(soroswapTable.address).toBeDefined();
    expect(soroswapTable.address).toMatch(/^zephyr_[a-fA-F0-9]{32}$/);
  }
});
test('soroswap zephyr tables should exist in TESTNET with correct format', () => {
  let soroswapTablesNames=["soroswap_pairs", "soroswap_events", "soroswap_rsv_ch"];
  for (let tableName of soroswapTablesNames) {
    let soroswapTable = getZephyrTable(tableName, "TESTNET")
    expect(soroswapTable).toBeDefined();
    expect(soroswapTable.address).toBeDefined();
    expect(soroswapTable.address).toMatch(/^zephyr_[a-fA-F0-9]{32}$/);
  }
});


test('aqua zephyr tables should exist in MAINNET with correct format', () => {
  let aquaTablesNames=["aqua_pairs"];
  for (let tableName of aquaTablesNames) {
    let aquaTable = getZephyrTable(tableName, "MAINNET")
    expect(aquaTable).toBeDefined();
    expect(aquaTable.address).toBeDefined();
    expect(aquaTable.address).toMatch(/^zephyr_[a-fA-F0-9]{32}$/);
  }
});
test('aqua zephyr tables should exist in TESTNET with correct format', () => {
  let aquaTablesNames=["aqua_pairs"];
  for (let tableName of aquaTablesNames) {
    let aquaTable = getZephyrTable(tableName, "TESTNET")
    expect(aquaTable).toBeDefined();
    expect(aquaTable.address).toBeDefined();
    expect(aquaTable.address).toMatch(/^zephyr_[a-fA-F0-9]{32}$/);
  }
});


test('phoenix zephyr tables should exist in MAINNET with correct format', () => {
  let phoenixTablesNames=["phoenix_pairs"];
  for (let tableName of phoenixTablesNames) {
    let phoenixTable = getZephyrTable(tableName, "MAINNET")
    expect(phoenixTable).toBeDefined();
    expect(phoenixTable.address).toBeDefined();
    expect(phoenixTable.address).toMatch(/^zephyr_[a-fA-F0-9]{32}$/);
  }
});
test('phoenix zephyr tables should exist in TESTNET with correct format', () => {
  let phoenixTablesNames=["phoenix_pairs"];
  for (let tableName of phoenixTablesNames) {
    let phoenixTable = getZephyrTable(tableName, "TESTNET")
    expect(phoenixTable).toBeDefined();
    expect(phoenixTable.address).toBeDefined();
    expect(phoenixTable.address).toMatch(/^zephyr_[a-fA-F0-9]{32}$/);
  }
});

  // pairsTablePath = "/workspace/public/mainnet.zephyr-tables.json";
    // pairsTablePath = "/workspace/public/testnet.zephyr-tables.json";
  // let myVariable = true;
  // expect(myVariable).toBeDefined();
  // const backendEndpoint = process.env.MERCURY_BACKEND_ENDPOINT!;
  // const graphqlEndpoint = process.env.MERCURY_GRAPHQL_ENDPOINT!;
  // const email = process.env.MERCURY_TESTER_EMAIL!;
  // const password = process.env.MERCURY_TESTER_PASSWORD!;

  // expect(backendEndpoint).toBeDefined();
  // expect(graphqlEndpoint).toBeDefined();
  // expect(email).toBeDefined();
  // expect(password).toBeDefined();

  // const urlRegex = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/;
  // expect(backendEndpoint).toMatch(urlRegex);
  // expect(graphqlEndpoint).toMatch(urlRegex);

  // const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
  // expect(email).toMatch(emailRegex);

  // expect(password.length).toBeGreaterThan(3)




  

test.todo("soroswap contracts should exist in mainnet");
test.todo("phoenix contracts should exist in mainnet");
test.todo("aqua contracts should exist in mainnet");

test.todo("soroswap contracts should exist in testnet");
test.todo("phoenix contracts should exist in testnet");
test.todo("aqua contracts should exist in testnet");


test('soroswap zephyr tables should exist in mainnet with correct format', () => {

});
test.todo("phoenix zephyr tables should exist in mainnet with correct format");
test.todo("aqua zephyr tables should exist in mainnet with correct format");

test.todo("soroswap pairs in MAINNET return non empty array");
test.todo("soroswap pairs in MAINNET amount is equal to Factory all_pairs_length()");

test.todo("soroswap pairs in TESTNET return non empty array");
test.todo("soroswap pairs in TESTNET amount is equal to Factory all_pairs_length()");


test.todo("aqua pairs in MAINNET return non empty array");
test.todo("aqua pairs in TESTNET return non empty array");

test.todo("phoenix pairs in MAINNET return non empty array");
test.todo("phoenix pairs in TESTNET return non empty array");

