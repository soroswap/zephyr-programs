import { Request, Response } from 'express';

const getTokensHandler = async (req: Request, res: Response) => {
    const { network } = req.query as { network: string };
    
    if(!network) {
        return res.status(400).json({ error: 'The network parameter is required' });
    }

    try {
        const tokens = await getTokens(network.toUpperCase() as 'MAINNET' | 'TESTNET');
        res.json(tokens);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

export default {
    getTokens: getTokensHandler,
};