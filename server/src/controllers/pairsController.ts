import { NextFunction, Request, Response } from 'express';
import getPairs from '../utils/get-pairs';
import { Network } from '../types/network';
import { TokenType } from '../types/tokens';
import getTokens from '../utils/get-tokens';
import { fetchTokenList } from '../services/tokens';

interface MercuryPair {
    tokenA: string;
    tokenB: string;
    address: string;
    reserveA: string;
    reserveB: string;
  }

export const getHandlerPairs = async (
    req: Request, 
    res: Response, 
    next: NextFunction): Promise<void> => {

    const { protocol, network, address, full } = req.query as unknown as { 
        protocol: string, 
        network: string,
        address: string,
        full: string
    };

    console.log(protocol, network, address, full);
    
    if (!protocol || !network) {
        res.status(400).json({ error: 'Protocol and network parameters are required' });
        return;
    }

    const protocolName = protocol.toLowerCase();
    const networkName = (network as string).toUpperCase() as 'MAINNET' | 'TESTNET';


    if (!['soroswap', 'phoenix', 'aqua'].includes(protocolName)) {
        res.status(400).json({ error: 'Invalid Protocol' });
        return;
      }
    
    if (!['MAINNET', 'TESTNET'].includes(networkName)) {
        res.status(400).json({ error: 'Invalid Network' });
        return;
    }

    try {
        const tokenList: TokenType[] = await fetchTokenList({ network: network as Network });
        const allowedContracts = tokenList.map(token => token.contract);

        const pairs = await getPairs(protocolName, networkName);

        if ((full !== 'true') && !address) {
            res.json(pairs);
            return;
        }

        const filteredPairs = pairs.filter((pair: MercuryPair) => 
            allowedContracts.includes(pair.tokenA) && allowedContracts.includes(pair.tokenB)
        );

        if (address) {
            const pool = pairs.find((pair: MercuryPair) => pair.address === address);
            if (pool) {
                res.json(pool);
            } else {
                res.status(404).json({ error: 'Pair not found for the provided address' });
            }
            return;
        }

        res.json(filteredPairs);
        return;
    } catch (error: any) {
        next(error);
    }
};
