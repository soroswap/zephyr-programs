import { getContractAddress } from "../utils/get-contract";

// CONTRACTS SHOULD BE WELL DEFINED

test("soroswap contracts should exist in mainnet", () => {
  let soroswapContractsNames=["soroswap_router", "soroswap_factory"];
  for (let contractName of soroswapContractsNames) {
    let contractAddress = getContractAddress(contractName, "MAINNET")
    expect(contractAddress).toBeDefined();
    expect(contractAddress).toMatch(/^[A-Z0-9]{56}$/);
  }
});
test("phoenix contracts should exist in mainnet", () => {
  let phoenixContractsNames=["phoenix_factory"];
  for (let contractName of phoenixContractsNames) {
    let contractAddress = getContractAddress(contractName, "MAINNET")
    expect(contractAddress).toBeDefined();
    expect(contractAddress).toMatch(/^[A-Z0-9]{56}$/);
  }
});
test("aqua contracts should exist in mainnet", () => {
  let aquaContractsNames=["aqua_router"];
  for (let contractName of aquaContractsNames) {
    let contractAddress = getContractAddress(contractName, "MAINNET")
    expect(contractAddress).toBeDefined();
    expect(contractAddress).toMatch(/^[A-Z0-9]{56}$/);
  }
});

// now the same on testnet
test("soroswap contracts should exist in testnet", () => {
  let soroswapContractsNames=["soroswap_router", "soroswap_factory"];
  for (let contractName of soroswapContractsNames) {
    let contractAddress = getContractAddress(contractName, "TESTNET")
    expect(contractAddress).toBeDefined();
    expect(contractAddress).toMatch(/^[A-Z0-9]{56}$/);
  }
});
test("phoenix contracts should exist in testnet", () => {
  let phoenixContractsNames=["phoenix_factory"];
  for (let contractName of phoenixContractsNames) {
    let contractAddress = getContractAddress(contractName, "TESTNET")
    expect(contractAddress).toBeDefined();
    expect(contractAddress).toMatch(/^[A-Z0-9]{56}$/);
  }
});
test("aqua contracts should exist in testnet", () => {
  let aquaContractsNames=["aqua_router"];
  for (let contractName of aquaContractsNames) {
    let contractAddress = getContractAddress(contractName, "TESTNET")
    expect(contractAddress).toBeDefined();
    expect(contractAddress).toMatch(/^[A-Z0-9]{56}$/);
  }
});


