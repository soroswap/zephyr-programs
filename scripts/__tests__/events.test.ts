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
});


test("soroswap events in TESTNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_events', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, 'TESTNET');
  expect(events).toBeDefined();
  expect(events.length).toBeGreaterThan(0);
});
