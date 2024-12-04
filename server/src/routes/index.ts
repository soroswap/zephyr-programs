
import { Router } from 'express';
import tokensRouter from './tokens';
import eventsRouter from './events';
import pairsRouter from './pairs';

const router = Router();

router.use('/tokens', tokensRouter);
router.use('/events', eventsRouter);
router.use('/pairs', pairsRouter);

export default router;
