// import fs from "fs";
import { zephyrTableToGraphQLParser} from "mercury-sdk";
import { getPairs } from "../utils/get-pairs";
import { getZephyrTable } from "../utils/get-table";
  
test("soroswap pairs in MAINNET return non empty array", async () => {
  let soroswapPairsTable = getZephyrTable('soroswap_pairs', "MAINNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapPairsTable);
  const pairs = await getPairs(zephyrTableGraphQL.address, 'MAINNET');
  expect(pairs).toBeDefined();
  expect(pairs.length).toBeGreaterThan(0);
});

test.todo("soroswap pairs in MAINNET amount is equal to Factory all_pairs_length()");

test("soroswap pairs in TESTNET return non empty array", async () => {
  let soroswapPairsTable = getZephyrTable('soroswap_pairs', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapPairsTable);
  const pairs = await getPairs(zephyrTableGraphQL.address, 'TESTNET');
  expect(pairs).toBeDefined();
  expect(pairs.length).toBeGreaterThan(0);
});

test.todo("soroswap pairs in TESTNET amount is equal to Factory all_pairs_length()");


test.todo("aqua pairs in TESTNET return non empty array");
test("aqua pairs in TESTNET return non empty array", async () => {
  let aquaPairsTable = getZephyrTable('aqua_pairs', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(aquaPairsTable);
  const pairs = await getPairs(zephyrTableGraphQL.address, 'TESTNET');
  expect(pairs).toBeDefined();
  expect(pairs.length).toBeGreaterThan(0);
});


test.todo("phoenix pairs in MAINNET return non empty array");
test("phoenix pairs in TESTNET return non empty array", async () => {
  let phoenixPairsTable = getZephyrTable('phoenix_pairs', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(phoenixPairsTable);
  const pairs = await getPairs(zephyrTableGraphQL.address, 'TESTNET');
  expect(pairs).toBeDefined();
  expect(pairs.length).toBeGreaterThan(0);
});
