// import fs from "fs";
import { zephyrTableToGraphQLParser} from "mercury-sdk";
import { getSoroswapRsvCh } from "../utils/get-soroswap-rsv";
import { getZephyrTable } from "../utils/get-table";

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
  console.log("🚀 ~ test ~ Soroswap mainnet rsv_ch.length:", rsv_ch.length)
  
});
