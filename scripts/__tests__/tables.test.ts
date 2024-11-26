
import { getZephyrTable } from "../utils/get-table";

jest.setTimeout(30000); // Set timeout to 30 seconds

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
