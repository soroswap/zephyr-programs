import { Account, Keypair, SorobanRpc, Transaction, TransactionBuilder, xdr } from '@stellar/stellar-sdk';
import { EnvConfig } from './env_config.js';
import { AxiosClient } from '@stellar/stellar-sdk/rpc';

type txResponse = SorobanRpc.Api.SendTransactionResponse | SorobanRpc.Api.GetTransactionResponse;
type txStatus = SorobanRpc.Api.SendTransactionStatus | SorobanRpc.Api.GetTransactionStatus;


export async function signWithKeypair(
  txXdr: string,
  passphrase: string,
  source: Keypair
): Promise<string> {
  const tx = new Transaction(txXdr, passphrase);
  tx.sign(source);
  return tx.toXDR();
}

export async function invoke(
  operation: string | xdr.Operation,
  source: Keypair,
  loadedConfig: EnvConfig,
  sim: boolean
): Promise<any> {
  const txBuilder = await createTxBuilder(source, loadedConfig);
  if (typeof operation === 'string') {
    operation = xdr.Operation.fromXDR(operation, 'base64');

  }
  txBuilder.addOperation(operation);
  const tx = txBuilder.build();
  
  return invokeTransaction(tx, source, loadedConfig, sim);
}

export async function createTxBuilder(source: Keypair, loadedConfig: EnvConfig): Promise<TransactionBuilder> {
  try {
    const account: Account = await loadedConfig.rpc.getAccount(source.publicKey());
    return new TransactionBuilder(account, {
      fee: '10000',
      timebounds: { minTime: 0, maxTime: 0 },
      networkPassphrase: loadedConfig.passphrase,
    });
  } catch (e: any) {
    console.error(e);
    throw Error('unable to create txBuilder');
  }
}



export async function invokeTransaction(
  tx: Transaction,
  source: Keypair,
  loadedConfig: EnvConfig,
  sim: boolean) {
  // simulate the TX
  const simulation_resp = await loadedConfig.rpc.simulateTransaction(tx);
  if (SorobanRpc.Api.isSimulationError(simulation_resp)) {
    // No resource estimation available from a simulation error. Allow the response formatter
    // to fetch the error.
    if(simulation_resp.error.includes("ExistingValue")) {throw new Error("ExistingValue")}
    console.log("There was an error while simulation the transaction: simulation_resp", simulation_resp)
    console.log("🚀 ~ invokeTransaction ~ simulation_resp.events[0].event:", simulation_resp.events[0].event.toString())
    throw Error(`Simulation : ${simulation_resp.error}`);
  } else if (sim) {
    // Only simulate the TX. Assemble the TX to borrow the resource estimation algorithm in
    return simulation_resp;
  }

  // assemble and sign the TX
  const txResources = simulation_resp.transactionData.build().resources();
  simulation_resp.minResourceFee = (Number(simulation_resp.minResourceFee) + 10000000).toString();
  const sim_tx_data = simulation_resp.transactionData
    .setResources(
      txResources.instructions() == 0 ? 0 : txResources.instructions() + 500000,
      txResources.readBytes(),
      txResources.writeBytes()
    )
    .build();
  const assemble_tx = SorobanRpc.assembleTransaction(tx, simulation_resp);
  sim_tx_data.resourceFee(
    xdr.Int64.fromString((Number(sim_tx_data.resourceFee().toString()) + 100000).toString())
  );
  const prepped_tx = assemble_tx.setSorobanData(sim_tx_data).build();
  prepped_tx.sign(source);
  const tx_hash = prepped_tx.hash().toString('hex');

  console.log('submitting tx...');
  let response: txResponse = await loadedConfig.rpc.sendTransaction(prepped_tx);
  let status: txStatus = response.status;
  console.log(`Hash: ${tx_hash}`);
  // Poll this until the status is not "NOT_FOUND"
  while (status === 'PENDING' || status === 'NOT_FOUND') {
    // See if the transaction is complete
    await new Promise((resolve) => setTimeout(resolve, 2000));
    console.log('checking tx...');
    response = await loadedConfig.rpc.getTransaction(tx_hash);
    status = response.status;
  }
  return response;
}

// export const getCurrentTimePlusOneHour = () => {
//   // Get the current time in milliseconds
//   const now = Date.now();

//   // Add one hour (3600000 milliseconds)
//   const oneHourLater = now + 3600000;

//   return oneHourLater;
// };
