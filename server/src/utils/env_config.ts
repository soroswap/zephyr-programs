// src/utils/env_config.ts
import { Horizon, Keypair, SorobanRpc } from '@stellar/stellar-sdk';
import fs from 'fs';
import path from 'path';

interface NetworkConfig {
  network: string;
  friendbot_url?: string;
  horizon_rpc_url?: string;
  soroban_rpc_url?: string;
  soroban_network_passphrase: string;
}

interface Config {
  protocolVersion: string;
  previewHash: string;
  quickstartHash: string;
  networkConfig: NetworkConfig[];
}

export class EnvConfig {
  rpc: SorobanRpc.Server;
  horizonRpc: Horizon.Server;
  passphrase: string;
  friendbot?: string;
  user: Keypair;

  constructor(
    rpc: SorobanRpc.Server,
    horizonRpc: Horizon.Server,
    passphrase: string,
    friendbot: string | undefined,
    user: Keypair,
  ) {
    this.rpc = rpc;
    this.horizonRpc = horizonRpc;
    this.passphrase = passphrase;
    this.friendbot = friendbot;
    this.user = user;
  }

  /**
   * Load the environment config from the configs.json file
   * @returns Environment config
   */
  static loadFromFile(network: string): EnvConfig {
    const filePath = path.join(__dirname, '../../scripts/configs.json');
    const fileContents = fs.readFileSync(filePath, 'utf8');
    const configs: Config = JSON.parse(fileContents);

    let rpc_url: string | undefined;
    let horizon_rpc_url: string | undefined;
    let friendbot_url: string | undefined;
    let passphrase: string | undefined;

    const networkConfig = configs.networkConfig.find((config) => config.network === network);
    if (!networkConfig) {
      throw new Error(`Network configuration for '${network}' not found`);
    }

    if (network === 'mainnet') {
      passphrase = networkConfig.soroban_network_passphrase;
      rpc_url = process.env.MAINNET_RPC_URL;
      horizon_rpc_url = networkConfig.horizon_rpc_url;
      friendbot_url = undefined;
    } else {
      rpc_url = networkConfig.soroban_rpc_url;
      horizon_rpc_url = networkConfig.horizon_rpc_url;
      friendbot_url = networkConfig.friendbot_url;
      passphrase = networkConfig.soroban_network_passphrase;
    }

    const userSecretKey = process.env.TEST_SECRET_KEY;

    if (
      !rpc_url ||
      !horizon_rpc_url ||
      (!friendbot_url && network !== 'mainnet') ||
      !passphrase ||
      !userSecretKey
    ) {
      throw new Error('Error: Missing required configuration fields');
    }

    const allowHttp = network === 'standalone';

    return new EnvConfig(
      new SorobanRpc.Server(rpc_url, { allowHttp }),
      new Horizon.Server(horizon_rpc_url, { allowHttp }),
      passphrase,
      friendbot_url,
      Keypair.fromSecret(userSecretKey),
    );
  }

  /**
   * Get the Keypair for a user from the env file
   * @param userKey - The name of the user in the env file
   * @returns Keypair for the user
   */
  getUser(userKey: string): Keypair {
    const userSecretKey = process.env[userKey];
    if (!userSecretKey) {
      throw new Error(`${userKey} secret key not found in .env`);
    }
    try {
      return Keypair.fromSecret(userSecretKey);
    } catch (e) {
      throw new Error(`${userKey} secret key is invalid. Error: ${e}`);
    }
  }
}

export const config = (network: string) => {
  return EnvConfig.loadFromFile(network);
};
