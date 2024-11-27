import fs from 'fs';
import path from 'path';

export const getContractAddress = (contractName: string, network: 'MAINNET' | 'TESTNET') => {
  let contractsJsonPath;
  if (network === 'MAINNET') {
    contractsJsonPath = path.join(__dirname, '../../public/mainnet.contracts.json');
  } else {
    contractsJsonPath = path.join(__dirname, '../../public/testnet.contracts.json');
  }
  const contractsJsonData = fs.readFileSync(contractsJsonPath, 'utf-8');
  const contracts = JSON.parse(contractsJsonData);
  return contracts[contractName];
};
