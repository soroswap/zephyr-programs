import { NextFunction, Request, Response } from 'express';
import getTokens from '../utils/get-tokens';

export const getHandlerTokens = async (
    req: Request, 
    res: Response,
    next: NextFunction
    ): Promise<void> => {
    const { network } = req.query as { network: string };
    
    if(!network) {
        res.status(400).json({ error: 'The network parameter is required' });
        return;
    }

    try {
        // const tokens = await getTokens(network.toUpperCase() as 'MAINNET' | 'TESTNET');
        // res.json(tokens);

        const mockTokens = [
            {
              address: 'TOKEN_A_ADDRESS',
              symbol: 'TKA',
              name: 'Token A',
              decimals: 18,
            },
            {
              address: 'TOKEN_B_ADDRESS',
              symbol: 'TKB',
              name: 'Token B',
              decimals: 8,
            },
            {
              address: 'TOKEN_C_ADDRESS',
              symbol: 'TKC',
              name: 'Token C',
              decimals: 6,
            },
          ];
      
          res.json(mockTokens);

    } catch (error: any) {
        next(error);
    }
};