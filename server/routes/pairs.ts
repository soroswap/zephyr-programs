import { Router, Request, Response } from 'express';
import { ProtocolType } from '../types/protocol';
import { handlePoolRequest } from "../utils/info/pools/handlePoolRequest";
import { getMercuryPools, getMercuryPhoenixPools, getMercuryAquaPools } from "../zephyr/helpers";

const router = Router();

router.get('/', (req: Request, res: Response) => {
    const queryParams = req.query;

    let protocol = queryParams?.protocol as string;
    protocol = protocol?.toUpperCase() as ProtocolType;

    if (protocol === 'SOROSWAP') {
        return handlePoolRequest(req, res, getMercuryPools);
    } else if (protocol === 'PHOENIX') {
        return handlePoolRequest(req, res, getMercuryPhoenixPools);
    } else if (protocol === 'AQUA') {
        return handlePoolRequest(req, res, getMercuryAquaPools);
    } else {
        return res.status(400).json({ error: 'Invalid protocol' });
    }
}
);

export default router;