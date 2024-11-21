import { NextFunction, Request, Response } from 'express';
import getEvents from '../utils/get-events';

export const getHandlerEvents = async (
    req: Request, 
    res: Response, 
    next: NextFunction): Promise<void> => {
    const { protocol, network, type } = req.query as {
        protocol: string;
        network: string;
        type?: string;
    }

    if(!protocol || !network) {
        res.status(400).json({ error: 'Protocol and network parameters are required' })
        return;
    }

    try {
        const events = await getEvents(protocol, network.toUpperCase() as 'MAINNET' | 'TESTNET', type);
        res.json(events);
    } catch (error: any) {
        next(error);
    }
};