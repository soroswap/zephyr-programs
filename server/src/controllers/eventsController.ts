import { Request, Response } from 'express';

const getEventsHandler = async (req: Request, res: Response) => {
    const { protocol, network, type } = req.query as {
        protocol: string;
        network: string;
        type?: string;
    }

    if(!protocol || !network) {
        return res.status(400).json({ error: 'Protocol and network parameters are required' })
    }

    try {
        const events = await getEvents(protocol, network.toUpperCase() as 'MAINET' | 'TESTNET', type);
        res.json(events);
    } catch (error: any) {
        res.status(500).json({ error: error.message })
    }
};

export default {
    getEvents: getEventsHandler,
}