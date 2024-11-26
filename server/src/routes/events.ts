import { Router } from "express";
import { getHandlerEvents } from "../controllers/eventsController";

const router = Router();

/**
 * @swagger
 * /api/events:
 *   get:
 *     summary: Get a list of events for a specific protocol
 *     tags:
 *       - Events
 *     parameters:
 *       - in: query
 *         name: protocol
 *         schema:
 *           type: string
 *           enum: [soroswap, phoenix, aqua]
 *         required: true
 *         description: Protocol name (soroswap, phoenix, aqua)
 *       - in: query
 *         name: network
 *         schema:
 *           type: string
 *           enum: [MAINNET, TESTNET]
 *         required: true
 *         description: Network name (MAINNET, TESTNET)
 *       - in: query
 *         name: type
 *         schema:
 *           type: string
 *           enum: [swap, add, remove]
 *         description: Event type (swap, add, remove)
 *       - in: query
 *         name: address
 *         schema:
 *           type: string
 *         description: Specific pool address
 *     responses:
 *       200:
 *         description: Event list successfully obtained
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/MercuryEvent'
 *       400:
 *         description: Missing or invalid parameters
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       404:
 *         description: No events found with the given parameters
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *       500:
 *         description: Internal Server Error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 */
router.get('/', getHandlerEvents);

export default router;

