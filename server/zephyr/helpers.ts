import * as StellarSdk from "@stellar/stellar-sdk";
import { Network } from "../types/network";
import { getMercuryInstance } from "./mercury";
import { GET_ALL_EVENTS } from "./queries/getAllEvents";
import { GET_ALL_PAIRS } from "./queries/getAllPairs";
import { GET_ALL_RSV_CH } from "./queries/getAllRsvCh";
import { ZEPHYR_TABLES } from "./tables";

export interface MercuryEvent {
  tokenA: string;
  tokenB: string;
  eType: "swap" | "add" | "remove";
  amountA: string;
  amountB: string;
  account: string;
  timestamp: string;
}

export interface MercuryPair {
  tokenA: string;
  tokenB: string;
  address: string;
  reserveA: string;
  reserveB: string;
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

export const getMercuryPools = async (network: Network) => {
  const mercuryInstance = getMercuryInstance(network);

  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_PAIRS(ZEPHYR_TABLES[network].PAIRS),
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

  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_PAIRS(ZEPHYR_TABLES[network].PHOENIX_PAIRS),
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

  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_PAIRS(ZEPHYR_TABLES[network].AQUA_PAIRS),
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

  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_RSV_CH(ZEPHYR_TABLES[network].RSV_CH),
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

  const response = await mercuryInstance.getCustomQuery({
    request: GET_ALL_EVENTS(ZEPHYR_TABLES[network].EVENTS),
  });

  if (!response.ok) {
    return [];
  }

  const parsedData: MercuryEvent[] = parseMercuryScvalResponse(
    response.data?.events?.data
  );

  return parsedData;
};
