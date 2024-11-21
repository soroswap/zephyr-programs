import { Request, Response } from 'express';

const getPairsHandler = async (req: Request, res: Response) => {
    const { protocol, network } = req.query as { 
        protocol: string, 
        network: string
    };

    if(!protocol || !network) {
        return res.status(400).json({ error: 'Protocol and network parameters are required' });
    }

    try {
        const pairs = await getPairs(protocol, network.toUpperCase() as 'MAINNET' | 'TESTNET');
        res.json(pairs);
    } catch (error: any) {
        res.status(500).json({ error: error.message });
    }
};

export default {
    getPairs: getPairsHandler,
};