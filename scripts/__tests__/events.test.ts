// import fs from "fs";
import { zephyrTableToGraphQLParser} from "mercury-sdk";
import { getSoroswapEvents } from "../utils/get-soroswap-events";
import { getZephyrTable } from "../utils/get-table";

test("soroswap events in MAINNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_events', "MAINNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, 'MAINNET');
  expect(events).toBeDefined();
  expect(events.length).toBeGreaterThan(0);
  console.log("🚀 ~ test ~ Soroswap mainnet events.length:", events.length)
  // console log last event
  console.log("last event: ", events[events.length - 1])
});

// test.todo("soroswap pairs in MAINNET amount is equal to Factory all_pairs_length()");

// test("soroswap pairs in TESTNET return non empty array", async () => {
//   let soroswapPairsTable = getZephyrTable('soroswap_pairs', "TESTNET")
//   const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapPairsTable);
//   const pairs = await getPairs(zephyrTableGraphQL.address, 'TESTNET');
//   expect(pairs).toBeDefined();
//   expect(pairs.length).toBeGreaterThan(0);
//   console.log("🚀 ~ test ~ Soroswap testnet pairs.length:", pairs.length)
// });

// test.todo("soroswap pairs in TESTNET amount is equal to Factory all_pairs_length()");


// test.todo("aqua pairs in TESTNET return non empty array");
// test.todo("aqua pairs in TESTNET is equal to Factory all_pairs_length()");

// test.todo("aqua pairs in MAINNET return non empty array");
// test.todo("aqua pairs in MAINNET is equal to Factory all_pairs_length()");


// test.todo("phoenix pairs in MAINNET return non empty array");
// test("phoenix pairs in TESTNET return non empty array", async () => {
//   let phoenixPairsTable = getZephyrTable('phoenix_pairs', "TESTNET")
//   const zephyrTableGraphQL = zephyrTableToGraphQLParser(phoenixPairsTable);
//   const pairs = await getPairs(zephyrTableGraphQL.address, 'TESTNET');
//   expect(pairs).toBeDefined();
//   expect(pairs.length).toBeGreaterThan(0);
//   console.log("🚀 ~ test ~ phoenix testnet pairs.length:", pairs.length)
// });


