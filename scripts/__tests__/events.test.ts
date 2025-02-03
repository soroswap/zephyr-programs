// import fs from "fs";
import { zephyrTableToGraphQLParser} from "mercury-sdk";
import { getSoroswapEvents } from "../utils/get-soroswap-events";
import { getZephyrTable } from "../utils/get-table";

test("soroswap events in MAINNET return non empty array", async () => {
  jest.setTimeout(30000); // 30 segundos
  let soroswapEventsTable = getZephyrTable('soroswap_events', "MAINNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, 'MAINNET');
  expect(events).toBeDefined();
  expect(events.length).toBeGreaterThan(0);
}, 30000); // También especificar el timeout como tercer parámetro


test("soroswap events in TESTNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_events', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, 'TESTNET');
  expect(events).toBeDefined();
  expect(events.length).toBeGreaterThan(0);
});
