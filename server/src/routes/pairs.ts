import { Router } from "express";
import { getHandlerPairs } from "../controllers/pairsController";

const router = Router();

/**
 * @swagger
 * /api/pairs:
 *   get:   Get a list of peers for a specific protocol
 *     summary: 
 *     tags:
 *       - Pairs
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
 *         name: address
 *         schema:
 *           type: string
 *         description: Pair Specific Address
 *       - in: query
 *         name: full
 *         schema:
 *           type: string
 *         description: Indicates whether to include all pairs without filtering
 *     responses:
 *       200:
 *         description: List of peers successfully obtained
 *         content:
 *           application/json:
 *             schema:
 *               oneOf:
 *                 - type: array
 *                   items:
 *                     $ref: '#/components/schemas/MercuryPair'
 *                 - $ref: '#/components/schemas/MercuryPair'
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
 *         description: Pair not found for given address
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
router.get('/', getHandlerPairs);

export default router;