// import fs from "fs";
import { zephyrTableToGraphQLParser} from "mercury-sdk";
import { getSoroswapEvents } from "../utils/get-soroswap-events";
import { getZephyrTable } from "../utils/get-table";

jest.setTimeout(30000); // Set timeout to 30 seconds

test("soroswap events in MAINNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_events', "MAINNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, 'MAINNET');
  expect(events).toBeDefined();
  expect(events.length).toBeGreaterThan(0);
});

test("soroswap events in MAINNET return no duplicate events", async () => {
  let soroswapEventsTable = getZephyrTable("soroswap_events", "MAINNET");
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, "MAINNET");


  // Check for duplicates
  const seen = new Map();
  const duplicates = [];

  events.forEach((event) => {
    const eventKey = JSON.stringify(event); // Serialize the event to a unique key
    if (seen.has(eventKey)) {
      duplicates.push(event);
    } else {
      seen.set(eventKey, true);
    }
  });

  // Expect no duplicates
  expect(duplicates.length).toBe(0);
});


test("soroswap events in TESTNET return non empty array", async () => {
  let soroswapEventsTable = getZephyrTable('soroswap_events', "TESTNET")
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapEventsTable);
  const events = await getSoroswapEvents(zephyrTableGraphQL.address, 'TESTNET');
  expect(events).toBeDefined();
  expect(events.length).toBeGreaterThan(0);
});
