import * as StellarSdk from "@stellar/stellar-sdk";
import { mercuryInstance } from "./mercury.js";

interface Pair {
  tokenA: string;
  tokenB: string;
  address: string;
}

export const devPairsTable = "allZephyr979734A56Cb32104E44245Cc51E5336Es";
export const testnetPairsTable = "allZephyrAc4C7D40C78D2B474009391E80Aedb99S";
export const mainnetPairsTable = "allZephyr923625Cad8F2Bf73069B63583354Ba4As";

const parseValue = (value: any) => {
  const scval = StellarSdk.xdr.ScVal.fromXDR(value, "base64");
  return StellarSdk.scValToNative(scval);
};

export const getPairs = async (tableName: string) => {
  const res = await mercuryInstance.getCustomQuery({
    request: `query Query {
              events: ${tableName}	 {
                data: nodes {
                  tokenA
                  tokenB
                  address
                }
              }
            }`,
  });

  if (res.ok) {
    const pairs = res.data.events.data.map((d: any) => {
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
