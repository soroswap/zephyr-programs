import { NextFunction, Request, Response } from 'express';
import getPairs from '../utils/get-pairs';

export const getHandlerPairs = async (
    req: Request, 
    res: Response, 
    next: NextFunction): Promise<void> => {
    const { protocol, network } = req.query as { 
        protocol: string, 
        network: string
    };

    if(!protocol || !network) {
        res.status(400).json({ error: 'Protocol and network parameters are required' });
        return;
    }

    try {
        // const pairs = await getPairs(protocol, network.toUpperCase() as 'MAINNET' | 'TESTNET');
        // res.json(pairs);
        // Datos mock
    const mockPairs = [
        {
          tokenA: 'TOKEN_A_ADDRESS',
          tokenB: 'TOKEN_B_ADDRESS',
          address: 'PAIR_ADDRESS_1',
          reserveA: '1000',
          reserveB: '2000',
        },
        {
          tokenA: 'TOKEN_C_ADDRESS',
          tokenB: 'TOKEN_D_ADDRESS',
          address: 'PAIR_ADDRESS_2',
          reserveA: '1500',
          reserveB: '2500',
        },
      ];
  
      res.json(mockPairs);
    } catch (error: any) {
        next(error);
    }
};
