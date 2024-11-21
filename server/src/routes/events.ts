import { Router } from "express";
import { getHandlerEvents } from "../controllers/eventsController";

const router = Router();

/**
 * @swagger
 * /api/events:
 *  get:
 *      summary: Get a list of events
 *      parameters:
 *          - in: query
 *            name: protocol
 *            schema:
 *              type: string
 *            required: true
 *            description: Protocol name (soroswap)
 *          - in: query
 *            name: network
 *            schema:
 *              type: string
 *            required: true
 *            description: Network name (MAINNET, TESTNET)
 *          - in: query
 *            name: type
 *            schema:
 *              type: string
 *            description: Event type (swap, add, remove)
 *      responses: 
 *          200:
 *            description: Event list successfully obtained
 *          400:
 *            description: Missing or invalid parameters
 *          500:
 *            description: Internal server error
 */
router.get('/', getHandlerEvents);

export default router;

