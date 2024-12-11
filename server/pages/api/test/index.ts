/**
 * @swagger
 * /api/test:
 *   get:
 *     summary: Example endpoint
 *     responses:
 *       200:
 *         description: Returns a message
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 */

import { NextApiRequest, NextApiResponse } from "next";

async function handler(req: NextApiRequest, res: NextApiResponse) {
    return res.json("Hello world!");
}

export default handler;
