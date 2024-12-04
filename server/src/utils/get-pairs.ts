import * as StellarSdk from '@stellar/stellar-sdk';
import { zephyrTableToGraphQLParser } from 'mercury-sdk';
import { getZephyrTable } from './get-table';
import { getMercuryInstance } from './mercury';
import { mockData } from './loadMockData';
interface Pair {
    tokenA: string;
    tokenB: string;
    address: string;
    reserveA: string;
    reserveB: string;
}

const parseValue = (value: any) => {
    const scval = StellarSdk.xdr.ScVal.fromXDR(value, 'base64');
    return StellarSdk.scValToNative(scval);
};

const getPairs = async (protocol: string, network: 'MAINNET' | 'TESTNET') => {

    const environment = process.env.ENVIRONMENT;
    const isDev = environment === 'dev';

    if (isDev) {
        console.log('llega a getPairs dentro de dev')
        const data = mockData(protocol, 'pairs');
        return data as Pair[];
    }
    const zephyrTableOriginal = getZephyrTable(protocol, network);
    const zephyrTableGraphQL = zephyrTableToGraphQLParser(zephyrTableOriginal);
    console.log('zephyrTableGraphQL', zephyrTableGraphQL)
    const mercuryInstance = getMercuryInstance(network);
    console.log('mercuryInstance', mercuryInstance);

    const res = await mercuryInstance.getCustomQuery({
        request: `query Query {
            events: ${zephyrTableGraphQL.address} {
                data: nodes {
                    tokenA
                    tokenB
                    address
                    reserveA
                    reserveB
                }
            }
        }`,
    });

    console.log('res', res);
    if(res.ok) {
        const pairs = res.data.events.data.map( (d: any) => {
            let n: any = {};

            for (let key in d) {
                n[key] = parseValue(d[key]);
            }

            return n;
        });

        return pairs as Pair[];
    }

    return [];
};

export default getPairs;