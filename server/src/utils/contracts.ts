import {
    Contract,
    Keypair,
    scValToNative,
    xdr,
  } from '@stellar/stellar-sdk';
  import { EnvConfig } from './env_config';
  import { invoke } from './tx';
  
  export async function invokeCustomContract(
    contractId: string,
    method: string,
    params: xdr.ScVal[],
    source: Keypair,
    config: EnvConfig,
    simulation?: boolean,
  ) {
    const contractInstance = new Contract(contractId);
  
    const contractOperation = contractInstance.call(method, ...params);
    return await invoke(contractOperation, source, config, simulation ?? false);
  }
  