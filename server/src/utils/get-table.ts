import fs from 'fs';
import path from 'path';

interface ZephyrTableOriginal {
  address: string;
}

export const getZephyrTable = (tableName: string, network: 'MAINNET' | 'TESTNET') => {
  const environment = process.env.ENVIRONMENT;
  let isDev = false;
  if (environment === 'dev') {
    isDev = true;
  }

  let tablesPath;
  if (network === 'MAINNET') {
    if (isDev) {
      tablesPath = path.join(__dirname, '../../../.dev.tables/mainnet.zephyr-tables.json');
    } else {
      console.log('está entrando aquì')
      tablesPath = path.join(__dirname, '../../../public/mainnet.zephyr-tables.json');
    }
  } else {
    if (isDev) {
      tablesPath = path.join(__dirname, '../../../.dev.tables/testnet.zephyr-tables.json');
    } else {
      tablesPath = path.join(__dirname, '../../../public/testnet.zephyr-tables.json');
    }
  }
  console.log('tableName', tableName)
  console.log('tablesPath', tablesPath)
  const tablesData = fs.readFileSync(tablesPath, 'utf-8');
  const tables = JSON.parse(tablesData);
  console.log('tables', tables)
  const zephyrTableAddress = tables[tableName];
  const zephyrTableOriginal: ZephyrTableOriginal = { address: zephyrTableAddress };
  return zephyrTableOriginal;
};
