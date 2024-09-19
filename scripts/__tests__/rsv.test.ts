// import fs from "fs";
import { zephyrTableToGraphQLParser} from "mercury-sdk";
import { getSoroswapRsvCh } from "../utils/get-soroswap-rsv";
import { getZephyrTable } from "../utils/get-table";
import { getReservesFromPair } from "../utils/get-reserves-from-pair";

test("soroswap rsv_ch in MAINNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_rsv_ch', "MAINNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const rsv_ch = await getSoroswapRsvCh(zephyrTableGraphQL.address, 'MAINNET');
  expect(rsv_ch).toBeDefined();
  expect(rsv_ch.length).toBeGreaterThan(0);
  console.log("🚀 ~ test ~ Soroswap mainnet rsv_ch.length:", rsv_ch.length)
});


test("soroswap rsv_ch in TESTNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_rsv_ch', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const rsv_ch = await getSoroswapRsvCh(zephyrTableGraphQL.address, 'TESTNET');
  expect(rsv_ch).toBeDefined();
  expect(rsv_ch.length).toBeGreaterThan(0);
  console.log("🚀 ~ test ~ Soroswap testnet rsv_ch.length:", rsv_ch.length)
  
});

test("Last Soroswap rsv_ch  in MAINNET reflects current reserve on that pair", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_rsv_ch', "MAINNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const rsv_ch = await getSoroswapRsvCh(zephyrTableGraphQL.address, 'MAINNET');

  // Last change is the first object in the array
  // TODO. this is very strange!!!!!
  const last_rsv_ch = rsv_ch[0];
  console.log("🚀 ~ test ~ last_rsv_ch soroswap mainnet:", last_rsv_ch)

  const reservesFromPair = await getReservesFromPair('soroswap', 'MAINNET', last_rsv_ch.address);

  // Assuming reservesFromPair gives BigInt values for reserveA and reserveB
  const [onChainReserveA, onChainReserveB] = reservesFromPair;

  // Compare on-chain reserves with the last recorded reserves in the event table
  expect(onChainReserveA.toString()).toBe(last_rsv_ch.reserveA);
  expect(onChainReserveB.toString()).toBe(last_rsv_ch.reserveB);

});



test("Last Soroswap rsv_ch  in TESTNET reflects current reserve on that pair", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_rsv_ch', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const rsv_ch = await getSoroswapRsvCh(zephyrTableGraphQL.address, 'TESTNET');

  // Last change is the first object in the array
  // TODO. this is very strange!!!!!
  const last_rsv_ch = rsv_ch[0];
  console.log("🚀 ~ test ~ last_rsv_ch soroswap mainnet:", last_rsv_ch)

  const reservesFromPair = await getReservesFromPair('soroswap', 'TESTNET', last_rsv_ch.address);
    
  // Assuming reservesFromPair gives BigInt values for reserveA and reserveB
  const [onChainReserveA, onChainReserveB] = reservesFromPair;

  // Compare on-chain reserves with the last recorded reserves in the event table
  expect(onChainReserveA.toString()).toBe(last_rsv_ch.reserveA);
  expect(onChainReserveB.toString()).toBe(last_rsv_ch.reserveB);

});
