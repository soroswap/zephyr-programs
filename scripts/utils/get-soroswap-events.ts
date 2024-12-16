import * as StellarSdk from "@stellar/stellar-sdk";
import { getMercuryInstance } from "../../src/zephyr/mercury";

export interface SoroswapEvent {
  tokenA: string;
  tokenB: string;
  eType: "swap" | "add" | "remove";
  amountA: string;
  amountB: string;
  account: string;
  timestamp: string;
}
export const parseScvalValue = (value: any) => {
  const scval = StellarSdk.xdr.ScVal.fromXDR(value, "base64");
  return StellarSdk.scValToNative(scval);
};

export const parseMercuryScvalResponse = (data: any) => {
  return data?.map((d: any) => {
    let n: any = {};

    for (let key in d) {
      const value = parseScvalValue(d[key]);

      if (typeof value === "bigint" || typeof value === "number") {
        n[key] = value.toString();
      } else {
        n[key] = value;
      }
    }

    return n;
  });
};


export const getSoroswapEvents = async (tableName: string, network: "MAINNET" | "TESTNET") => {

  const mercuryInstance = getMercuryInstance(network);  
  const res = await mercuryInstance.getCustomQuery({
    request: `query Query {
    events: ${tableName} {
      data: nodes {
        eType
        tokenA
        tokenB
        amountA
        amountB
        account
        timestamp
      }
    }
  }`,
  });


  
  if (res.ok) {
    const parsedData: SoroswapEvent[] = parseMercuryScvalResponse(
      res.data?.events?.data
    );
    return parsedData;

  }

  return [];
};
