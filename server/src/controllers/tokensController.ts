import { NextFunction, Request, Response } from 'express';
import getTokens from '../utils/get-tokens';
import path from 'path';
import fs from 'fs';
import { fetchTokenList } from '../services/tokens';
import { Network } from '../types/network';
import { TokenType } from '../types/tokens';

interface Token {
    name: string;
    code: string;
    issuer: string;
    contract: string;
    org: string;
    domain: string;
    icon: string;
    decimals: number;
}

export const getHandlerTokens = async (
    req: Request, 
    res: Response,
    next: NextFunction
    ): Promise<void> => {

    const { protocol, network, address } = req.query as { 
        protocol: string, 
        network: string,
        address: string
    };
    
    const environment = process.env.ENVIRONMENT
    let isDev = false;
    if (environment === 'dev') {
        isDev = true;
    };
    
    if (
        !protocol ||
        !network ||
        typeof protocol !== 'string' ||
        typeof network !== 'string'
    ) {
        res.status(400).json({ error: 'Protocol and network parameters are required' });
        return;
    }

    const protocolName = protocol.toLowerCase();
    const networkName = network.toUpperCase();

    const supportedProtocols = ['soroswap', 'aqua', 'phoenix'];
    const supportedNetworks = ['MAINNET', 'TESTNET'];

    if (
        !supportedProtocols.includes(protocolName) ||
        !supportedNetworks.includes(networkName)
    ) {
        res.status(400).json({ error: 'Protocol or network not supported' });
        return;
    }

    try {

        const protocolTokens = await getTokens(protocol, networkName as Network);
    
        if (address) {
          const filteredToken = protocolTokens.find((token: Token) => token.contract === address);
          if (filteredToken) {
            res.json(filteredToken);
            return;
          } else {
            res.status(404).json({ error: 'Token not found' });
            return;
          }
        }
    
        res.json(protocolTokens);
        return;
    } catch (error: any) {
        next(error);
    }
};
