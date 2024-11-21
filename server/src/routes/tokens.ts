import { Router } from "express";


const router = Router();

/**
 * @swagger
 * /api/tokens:
 *  get:
 *      summary: Get a list of tokens
 *      parameters:
 *          - in: query
 *            name: network
 *            schema:
 *              type: string
 *            required: true
 *            description: Network name (MAINNET, TESTNET)
 *      responses:
 *          200:
 *            description: List of tokens successfully obtained
 *          400:
 *            description: Missing or invalid parameters
 *          500:
 *            description: Internal server error
 */
router.get('/', tokensController.getTokens);

export default router;