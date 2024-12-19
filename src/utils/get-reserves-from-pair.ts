
import fs from "fs";
import {scValToNative} from "@stellar/stellar-sdk"
import {invokeCustomContract} from "./contract";
import { config } from './env_config';


// import * as StellarSdk from "@stellar/stellar-sdk";

export const getReservesFromPair = async (
  protocolName: string,
  network: "MAINNET" | "TESTNET",
  pairAddress: string) => {

  let loadedConfig;
  if (network === "MAINNET") {
    loadedConfig = config('mainnet');
    } else {
    loadedConfig = config('testnet');
  }

  const reserves = await invokeCustomContract(
                              pairAddress,
                              "get_reserves", 
                              [], 
                              loadedConfig.user, 
                              loadedConfig,
                              true);
  // console.log("🚀 ~ getReservesFromPair ~ reserves", reserves.result.retval)    
  const reservesNative=scValToNative(reserves.result.retval)                
  // console.log("🚀 ~ reservesNative:", reservesNative)
  // const totalPairsNative=scValToNative(totalPairs.result.retval)
    
  return reservesNative;

};
