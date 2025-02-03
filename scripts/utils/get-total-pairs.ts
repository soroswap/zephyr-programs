import fs from "fs";
import {scValToNative} from "@stellar/stellar-sdk"
import {xdr} from "@stellar/stellar-sdk"
import {invokeCustomContract} from "./contract";
import { config } from './env_config';


// import * as StellarSdk from "@stellar/stellar-sdk";

export const getTotalPairs = async (protocolName: string, network: "MAINNET" | "TESTNET") => {
  let loadedConfig;
  let contractsJsonPath;
    if (network === "MAINNET") {
    loadedConfig = config('mainnet');
    contractsJsonPath = "/workspace/public/mainnet.contracts.json";
    } else {
    loadedConfig = config('testnet');
    contractsJsonPath = "/workspace/public/testnet.contracts.json";
  }
  const contractsJsonData = fs.readFileSync(contractsJsonPath, "utf-8");
    const contractsJson = JSON.parse(contractsJsonData);


  if (protocolName === "soroswap") {
    const factoryAddress = contractsJson['soroswap_factory'];

    // export async function invokeCustomContract(
    //   contractId: string,
    //   method: string,
    //   params: xdr.ScVal[],
    //   source: Keypair,
    //   simulation?: boolean,
    // )
    const source = undefined;
    const totalPairs = await invokeCustomContract(
                                factoryAddress,
                                "all_pairs_length", 
                                [], 
                                loadedConfig.user, 
                                loadedConfig,
                                true);
    const totalPairsNative=scValToNative(totalPairs.result.retval)
    
      console.log("totalPairsNative: ", totalPairsNative)
    return totalPairsNative;
  }
  else if (protocolName === "phoenix") {
    const factoryAddress = contractsJson['phoenix_factory'];

    // export async function invokeCustomContract(
    //   contractId: string,
    //   method: string,
    //   params: xdr.ScVal[],
    //   source: Keypair,
    //   simulation?: boolean,
    // )
    const source = undefined;
    const totalPairs = await invokeCustomContract(
                                factoryAddress,
                                "query_pools", 
                                [], 
                                loadedConfig.user, 
                                loadedConfig,
                                true);
    const poolsVec=scValToNative(totalPairs.result.retval)
    
    return poolsVec.length;

  }
  else {
    throw new Error("Protocol not supported");
  }

};

export const getAllPairs = async (protocolName: string, network: "MAINNET" | "TESTNET") => {
  let loadedConfig;
  let contractsJsonPath;
    if (network === "MAINNET") {
    loadedConfig = config('mainnet');
    contractsJsonPath = "/workspace/public/mainnet.contracts.json";
    } else {
    loadedConfig = config('testnet');
    contractsJsonPath = "/workspace/public/testnet.contracts.json";
  }
  const contractsJsonData = fs.readFileSync(contractsJsonPath, "utf-8");
    const contractsJson = JSON.parse(contractsJsonData);


  if (protocolName === "soroswap") {
    const factoryAddress = contractsJson['soroswap_factory'];

    // export async function invokeCustomContract(
    //   contractId: string,
    //   method: string,
    //   params: xdr.ScVal[],
    //   source: Keypair,
    //   simulation?: boolean,
    // )
    const source = undefined;
     // Primero se obtiene el número total de pares creados.
     const totalPairsResponse = await invokeCustomContract(
      factoryAddress,
      "all_pairs_length",
      [],
      loadedConfig.user,
      loadedConfig,
      true
    );
    const totalPairs = scValToNative(totalPairsResponse.result.retval);

    // Se itera desde 0 hasta totalPairs - 1 para obtener cada par.
    const pairPromises: Promise<any>[] = [];
    for (let i = 0; i < totalPairs; i++) {
      const indexParam = xdr.ScVal.scvU32(i); // Cambiado a U32 según la interfaz
      const promise = invokeCustomContract(
        factoryAddress,
        "all_pairs", // Cambiado de get_pair a all_pairs
        [indexParam],
        loadedConfig.user,
        loadedConfig,
        true
      )
      .then((response) => {
        const pairAddress = scValToNative(response.result.retval);
        return pairAddress;
      })
      .catch((error) => {
        console.error(`Error al obtener el par en el índice ${i}:`, error);
        throw error;
      });
      pairPromises.push(promise);
    }

    // Se esperan todas las respuestas de forma concurrente.
    const pairs = await Promise.all(pairPromises);

    // Filtrar (opcional) las respuestas que sean direcciones nulas (por ejemplo, "0" o "address(0)").
    const validPairs = pairs.filter((addr) => addr !== "0");
    return validPairs;
  }
  else if (protocolName === "phoenix") {
    const factoryAddress = contractsJson['phoenix_factory'];

    // export async function invokeCustomContract(
    //   contractId: string,
    //   method: string,
    //   params: xdr.ScVal[],
    //   source: Keypair,
    //   simulation?: boolean,
    // )
    const source = undefined;
    const totalPairs = await invokeCustomContract(
                                factoryAddress,
                                "query_pools", 
                                [], 
                                loadedConfig.user, 
                                loadedConfig,
                                true);
    const poolsVec=scValToNative(totalPairs.result.retval)
    
    return poolsVec.length;

  }
  else {
    throw new Error("Protocol not supported");
  }

};
