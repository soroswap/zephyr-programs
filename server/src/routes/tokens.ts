import { Router } from "express";
import { getHandlerTokens } from "../controllers/tokensController";

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
router.get('/', getHandlerTokens);

export default router;