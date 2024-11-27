import { NextFunction, Request, Response } from 'express';
import getEvents from '../utils/get-events';
import getTokens from '../utils/get-tokens';
import { Network } from '../types/network';

export const getHandlerEvents = async (
    req: Request, 
    res: Response, 
    next: NextFunction): Promise<void> => {
    const { protocol, network, address, type } = req.query as {
        protocol: string;
        network: string;
        address: string;
        type?: string;
    }

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
        const events = await getEvents(protocol, network.toUpperCase() as 'MAINNET' | 'TESTNET', type);

        let filteredEvents = events;

        if (type) {
            const eventType = type.toLowerCase();
            if (!['swap', 'add', 'remove'].includes(eventType)) {
                res.status(400).json({ error: 'Invalid Event Type' });
                return;
            }
            filteredEvents = filteredEvents.filter(event => event.eType === eventType);
        }

        if (address) {
            filteredEvents = filteredEvents.filter(event => (event.tokenA === address || event.tokenB === address));
        }

        if (filteredEvents.length === 0) {
            res.status(404).json({ error: 'No events found with the given parameters' });
            return;
        }

     
        res.json(filteredEvents);
    } catch (error: any) {
        next(error);
    }
};