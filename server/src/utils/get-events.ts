import * as StellarSdk from '@stellar/stellar-sdk';
import { getMercuryInstance } from './mercury';
import { getZephyrTable } from './get-table';
import { zephyrTableToGraphQLParser } from 'mercury-sdk';
import { mockData } from './loadMockData';

interface Event {
  tokenA: string;
  tokenB: string;
  eType: string;
  amountA: string;
  amountB: string;
  account: string;
  timestamp: string;
  txHash: string;
}

const parseValue = (value: any) => {
  const scval = StellarSdk.xdr.ScVal.fromXDR(value, 'base64');
  return StellarSdk.scValToNative(scval);
};

const getEvents = async (
  protocol: string,
  network: 'MAINNET' | 'TESTNET',
  eventType?: string
) => {
  let tableNameKey: string = protocol;

  const environment = process.env.ENVIRONMENT;
    const isDev = environment === 'dev';

  if (isDev) {
    const data = mockData(protocol, 'events');
    return data;
}

  const zephyrTableOriginal = getZephyrTable(tableNameKey, network);
  const zephyrTableGraphQL = zephyrTableToGraphQLParser(zephyrTableOriginal);
  const mercuryInstance = getMercuryInstance(network);

  const res = await mercuryInstance.getCustomQuery({
    request: `query Query {
      events: ${zephyrTableGraphQL.address} {
        data: nodes {
          eType
          tokenA
          tokenB
          amountA
          amountB
          account
          timestamp
          txHash
        }
      }
    }`,
  });

  if (res.ok) {
    let events = res.data.events.data.map((d: any) => {
      let n: any = {};

      for (let key in d) {
        n[key] = parseValue(d[key]);
      }

      return n;
    });

    if (eventType) {
      events = events.filter((event: Event) => event.eType === eventType);
    }

    return events as Event[];
  }

  return [];
};

export default getEvents;