import { zephyrTableToGraphQLParser } from 'mercury-sdk';
import { getProviders } from '../utils/get-providers';
import { getZephyrTable } from '../utils/get-table';

test('soroswap providers in MAINNET return non empty array', async () => {
  let providersTable = getZephyrTable('ssw_prov', 'MAINNET');
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(providersTable);
  const providers = await getProviders(zephyrTableGraphQL.address, 'MAINNET');
  expect(providers).toBeDefined();
  expect(providers.length).toBeGreaterThan(0);
});

test('soroswap providers in TESTNET return non empty array', async () => {
  let providersTable = getZephyrTable('ssw_prov', 'TESTNET');
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(providersTable);
  const providers = await getProviders(zephyrTableGraphQL.address, 'TESTNET');
  expect(providers).toBeDefined();
  expect(providers.length).toBeGreaterThan(0);
});

test('Provider percentages are calculated correctly', async () => {
  let providersTable = getZephyrTable('ssw_prov', 'MAINNET');
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(providersTable);
  const providers = await getProviders(zephyrTableGraphQL.address, 'MAINNET');

  const poolAddress = providers[0].poolAddress;
  const poolProviders = providers.filter((p) => p.poolAddress === poolAddress);

  // Sum of all percentages should be less than or equal to 100%
  const totalPercentage = poolProviders.reduce(
    (sum, provider) => sum + Number(provider.percentage),
    0
  );
  expect(totalPercentage).toBeLessThanOrEqual(1_000_000);
});

test('Provider records are unique per pool', async () => {
  let providersTable = getZephyrTable('ssw_prov', 'TESTNET');
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(providersTable);
  const providers = await getProviders(zephyrTableGraphQL.address, 'TESTNET');

  // Check for duplicate provider-pool combinations
  const combinations = new Set();
  providers.forEach((provider) => {
    const key = `${provider.providerAddress}-${provider.poolAddress}`;
    combinations.add(key);
  });

  expect(combinations.size).toBe(providers.length);
});
