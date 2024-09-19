import { Router, Request, Response } from 'express';
import { ProtocolType } from '../types/protocol';
import { Network } from '../types/network';
import { getZephyrTable } from '../../scripts/utils/get-table';
import { zephyrTableToGraphQLParser } from 'mercury-sdk';
import { getPairs } from '../../scripts/utils/get-pairs';

const router = Router();

router.get('/', async (req: Request, res: Response) => {
    const queryParams = req.query;

    let protocol = queryParams?.protocol as string;
    protocol = protocol?.toUpperCase() as ProtocolType;

    let network = queryParams?.network as string;
    network = network?.toUpperCase() as Network;

    if (protocol !== "SOROSWAP" && protocol !== "PHOENIX" && protocol !== "AQUA") {
        return res.status(400).json({ error: "Invalid protocol" });
    }

    if (network !== "MAINNET" && network !== "TESTNET") {
        return res.status(400).json({ error: "Invalid network" });
    }

    if (protocol === 'SOROSWAP') {
        try {
            let soroswapPairsTable = getZephyrTable('soroswap_pairs', network)
            const zephyrTableGraphQL = zephyrTableToGraphQLParser(soroswapPairsTable);
            const pairs = await getPairs(zephyrTableGraphQL.address, network);
            return res.json(pairs);
        } catch (error) {
            return res.status(500).json({ error: "Failed to fetch pairs" });
        }
    } else if (protocol === 'PHOENIX') {
        try {
            let phoenixPairsTable = getZephyrTable('phoenix_pairs', network)
            const zephyrTableGraphQL = zephyrTableToGraphQLParser(phoenixPairsTable);
            const pairs = await getPairs(zephyrTableGraphQL.address, network);
            return res.json(pairs);
        } catch (error) {
            return res.status(500).json({ error: "Failed to fetch pairs" });
        }
    } else if (protocol === 'AQUA') {
        try {
            let aquaPairsTable = getZephyrTable('aqua_pairs', network)
            const zephyrTableGraphQL = zephyrTableToGraphQLParser(aquaPairsTable);
            const pairs = await getPairs(zephyrTableGraphQL.address, network);
            return res.json(pairs);
        } catch (error) {
            return res.status(500).json({ error: "Failed to fetch pairs" });
        }
    }
}
);

export default router;