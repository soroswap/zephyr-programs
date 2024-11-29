import { Router } from "express";
import { getHandlerTokens } from "../controllers/tokensController";

const router = Router();

/**
* /api/tokens:
*   get:
*      summary: Get a list of tokens or a specific token for a protocol
*      tags:
*        - Tokens
*      parameters:
*        - in: query
*          name: protocol
*          schema:
*            type: string
*            enum: [soroswap, phoenix, aqua]
*          required: true
*          description: Protocol name (soroswap, phoenix, aqua)
*        - in: query
*          name: network
*          schema:
*            type: string
*            enum: [MAINNET, TESTNET]
*          required: true
*          description: Network name (MAINNET, TESTNET)
*        - in: query
*          name: address
*          schema:
*            type: string
*          description: Specific token address
*      responses:
*        '200':
*          description: Successfully obtained list of tokens or a specific token
*          content:
*            application/json:
*              schema:
*                oneOf:
*                  - type: array
*                    items:
*                      $ref: '#/components/schemas/Token'
*                  - $ref: '#/components/schemas/Token'
*        '400':
*          description: Missing or invalid parameters
*          content:
*            application/json:
*              schema:
*                $ref: '#/components/schemas/Error'
*        '404':
*          description: Token not found for the provided address
*          content:
*            application/json:
*              schema:
*                $ref: '#/components/schemas/Error'
*        '500':
*          description: Internal server error
*          content:
*            application/json:
*              schema:
*                $ref: '#/components/schemas/Error'
*/
router.get('/', getHandlerTokens);

export default router;