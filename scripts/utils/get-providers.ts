import * as StellarSdk from '@stellar/stellar-sdk';
import { getMercuryInstance } from './mercury';

interface Provider {
  providerAddress: string;
  poolAddress: string;
  shares: string;
  percentage: string;
}

const parseValue = (value: any) => {
  const scval = StellarSdk.xdr.ScVal.fromXDR(value, 'base64');
  return StellarSdk.scValToNative(scval);
};

export const getProviders = async (
  tableName: string,
  network: 'MAINNET' | 'TESTNET'
) => {
  const mercuryInstance = getMercuryInstance(network);

  const res = await mercuryInstance.getCustomQuery({
    request: `query Query {
              events: ${tableName}	 {
                data: nodes {
                    providerAddress
                    poolAddress
                    shares
                    percentage
                }
              }
            }`,
  });

  if (res.ok) {
    const providers = res.data.events.data.map((d: any) => {
      let n: any = {};

      for (let key in d) {
        n[key] = parseValue(d[key]);
      }

      return n;
    });

    return providers as Provider[];
  }

  return [];
};
