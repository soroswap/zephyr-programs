import { Router } from "express";


const router = Router();

/**
 * @swagger
 * /api/pairs:
 *  get:
 *      summary: Get a list of peers
 *      parameters:
 *          - in: query
 *            name: protocol
 *            schema:
 *              type: string
 *            required: true
 *            description: Protocol name (soroswap, phoenix, aqua)
 *          - in: query
 *            name: network
 *            schema:
 *              type: string
 *            required: true
 *            description: Network name (MAINNET, TESTNET)
 *      responses:
 *          200: 
 *            description: List of peers successfully obtained
 *          400:
 *            description: Missing or invalid parameters
 *          500:
 *            description: Internal server error
 */
router.get('/', pairsController.getPairs);

export default router;