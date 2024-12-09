import * as StellarSdk from "@stellar/stellar-sdk";
import { Network } from "types/network";
import { MercuryEvent } from "../../pages/api/events";
import { MercuryPair } from "../../pages/api/pairs";
import { getMercuryInstance } from "./mercury";
import { GET_ALL_EVENTS } from "./queries/getAllEvents";
import { GET_ALL_PAIRS } from "./queries/getAllPairs";
import { GET_ALL_RSV_CH } from "./queries/getAllRsvCh";
import { fetchZephyrTables } from "./tables";

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
      } else if( key == 'txHash'){
        const txHash = StellarSdk.xdr.Hash.fromXDR(value, 'hex').toString('hex')
        if(txHash.length != 64)throw new Error('Invalid txHash length');
        n[key] = txHash;
      } else {
        n[key] = value;
      }
    }

    return n;
  });
};

export const getMercuryPools = async (network: Network) => {
  const mercuryInstance = getMercuryInstance(network);
  const { soroswap_pairs } = await fetchZephyrTables({ network });
  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_PAIRS(soroswap_pairs),
  });

  if (!response.ok) {
    return [];
  }

  const parsedData: MercuryPair[] = parseMercuryScvalResponse(
    response.data?.events?.data
  );

  return parsedData;
};

export const getMercuryPhoenixPools = async (network: Network) => {
  const mercuryInstance = getMercuryInstance(network);
  const { phoenix_pairs } = await fetchZephyrTables({ network });
  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_PAIRS(phoenix_pairs),
  });

  console.log(response);

  if (!response.ok) {
    return [];
  }

  const parsedData: MercuryPair[] = parseMercuryScvalResponse(
    response.data?.events?.data
  );

  return parsedData;
};

export const getMercuryAquaPools = async (network: Network) => {
  const mercuryInstance = getMercuryInstance(network);
  const { aqua_pairs } = await fetchZephyrTables({ network });
  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_PAIRS(aqua_pairs),
  });

  console.log(response);

  if (!response.ok) {
    return [];
  }

  const parsedData: MercuryPair[] = parseMercuryScvalResponse(
    response.data?.events?.data
  );

  return parsedData;
};

export interface MercuryRsvCh {
  address: string;
  reserveA: string;
  reserveB: string;
  timestamp: string;
}

export const getMercuryRsvCh = async (network: Network) => {
  const mercuryInstance = getMercuryInstance(network);
  const { soroswap_rsv_ch } = await fetchZephyrTables({ network });
  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_RSV_CH(soroswap_rsv_ch),
  });

  if (!response.ok) {
    return [];
  }

  const parsedData: MercuryRsvCh[] = parseMercuryScvalResponse(
    response.data?.events?.data
  );

  return parsedData;
};

export const getMercuryEvents = async (network: Network) => {
  const mercuryInstance = getMercuryInstance(network);
  const { soroswap_events } = await fetchZephyrTables({ network });
  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_EVENTS(soroswap_events),
  });

  if (!response.ok) {
    return [];
  }

  const parsedData: MercuryEvent[] = parseMercuryScvalResponse(
    response.data?.events?.data
  );

  return parsedData;
};
