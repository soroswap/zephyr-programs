import * as StellarSdk from '@stellar/stellar-sdk';
import { zephyrTableToGraphQLParser } from 'mercury-sdk';
import { getZephyrTable } from './get-table';
import { getMercuryInstance } from './mercury';

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
    let tableNameKey: string

    switch (protocol.toLowerCase()) {
        case 'soroswap':
            tableNameKey = 'soroswap_pairs';
            break;
        case 'phoenix':
            tableNameKey = 'phoenix_pairs';
            break;
        case 'aqua':
            tableNameKey = 'aqua_pairs';
            break;
        default:
            throw new Error('Unknown protocol');
    }

    const zephyrTableOriginal = getZephyrTable(protocol, network);
    const zephyrTableGraphQL = zephyrTableToGraphQLParser(zephyrTableOriginal);
    const mercuryInstance = getMercuryInstance(network);

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