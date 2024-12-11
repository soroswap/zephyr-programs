/**
 * @swagger
 * /api?network=mainnet:
 *   get:
 *     tags:
 *        - "MAINNET"
 *     summary: Retrieves XLM Price
 *     responses:
 *       200:
 *         description: Successful response
 * 
 * /api?network=testnet:
 *   get:
 *     tags:
 *        - "TESTNET"
 *     summary: Retrieves XLM Price
 *     responses:
 *       200:
 *         description: Successful response
 */

import { NextApiRequest, NextApiResponse } from "next";
import { fetchTokenList } from "services/tokens";
import { Network } from "types/network";
import { TokenType } from "types/tokens";
import { Networks } from "@stellar/stellar-sdk";
import { getMercuryPools } from "zephyr/helpers";
import { xlmToken } from "constants/constants";
import { getRouterFromPools, getTokenPrice } from "utils/info/pools";

async function handler(req: NextApiRequest, res: NextApiResponse) {
  const queryParams = req.query;

  let network = queryParams?.network as string;
  network = network?.toUpperCase() as Network;

  if (network !== "MAINNET" && network !== "TESTNET") {
    return res.status(400).json({ error: "Invalid network" });
  }

  try {
    const tokenList: TokenType[] = await fetchTokenList({ network });

    const pools = await getMercuryPools(network);

    let stellarNetwork = null;

    if (network === "MAINNET") {
      stellarNetwork = Networks.PUBLIC;
    } else {
      stellarNetwork = Networks.TESTNET;
    }

    const filteredData = pools.filter((pool) => {
      const tokenAExists = tokenList.some((token) => token.contract === pool.tokenA);
      const tokenBExists = tokenList.some((token) => token.contract === pool.tokenB);
      return tokenAExists && tokenBExists;
    });

    const router = getRouterFromPools(filteredData, stellarNetwork);

    const XLM = tokenList.find(
      (token) => token.contract === xlmToken[network]?.contract
    );
    const USDC = tokenList.find((token) => token.code === "USDC");

    if (!XLM || !USDC) {
      return res.json(0);
    }

    const price = await getTokenPrice(
      XLM?.contract,
      USDC?.contract,
      stellarNetwork,
      router
    );

    return res.json(price);
  } catch (error) {
    return res.status(500).json({ error: "Failed to fetch token list" });
  }
}

export default handler;
