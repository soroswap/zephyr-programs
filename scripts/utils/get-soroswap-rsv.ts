import * as StellarSdk from "@stellar/stellar-sdk";
import { getMercuryInstance } from "../../server/src/zephyr/mercury";

export interface MercuryRsvCh {
  address: string;
  reserveA: string;
  reserveB: string;
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


export const getSoroswapRsvCh = async (tableName: string, network: "MAINNET" | "TESTNET") => {

  const mercuryInstance = getMercuryInstance(network);  
  const res = await mercuryInstance.getCustomQuery({
    request: `query Query {
    events: ${tableName} {
      data: nodes {
        address
        reserveA
        reserveB
        timestamp
      }
    }
  }
`,
  });

  
  if (res.ok) {
    const parsedData: MercuryRsvCh[] = parseMercuryScvalResponse(
      res.data?.events?.data
    );  
    //console log last 
    // console.log("🚀 ~ getSoroswapRsvCh ~ parsedData", parsedData[parsedData.length - 1])
    parsedData.sort((a, b) => Number(a.timestamp) - Number(b.timestamp));
    // console.log("🚀 ~ getSoroswapRsvCh ~ parsedData", parsedData[parsedData.length - 1])

    return parsedData;

  }

  return [];
};
