/**
 * @swagger
 * /api/events?network=mainnet:
 *   get:
 *     tags:
 *       - "MAINNET"
 *     summary: Retrieve Mercury Events
 *     responses:
 *       200:
 *         description: Successful response
 * 
 * /api/events?network=testnet:
 *   get:
 *     tags:
 *       - "TESTNET"
 *     summary: Retrieve Mercury Events
 *     responses:
 *       200:
 *         description: Successful response
 */
import { fetchTokenList } from "services/tokens";
import { getMercuryEvents, getMercuryPools } from "zephyr/helpers";
import { Network } from "types/network";
import { NextApiRequest, NextApiResponse } from "next";
import { RouterEventAPI, RouterEventType } from "types/router-events";
import { TokenType } from "types/tokens";

export interface MercuryEvent {
  tokenA: string;
  tokenB: string;
  eType: "swap" | "add" | "remove";
  amountA: string;
  amountB: string;
  account: string;
  timestamp: string;
  txHash: string;
}

export const adjustAmountByDecimals = (
  amountStr: string,
  decimals: number | undefined
): string => {
  const defaultDecimals = 7;
  const actualDecimals = decimals ?? defaultDecimals;

  while (amountStr.length <= actualDecimals) {
    amountStr = "0" + amountStr;
  }

  const integerPart = amountStr.slice(0, -actualDecimals);
  const decimalPart = amountStr.slice(-actualDecimals);
  const result = integerPart + "." + decimalPart;

  return result.replace(/(\.\d*[1-9])0+$|\.0*$/, "$1");
};

async function handler(req: NextApiRequest, res: NextApiResponse) {
  const queryParams = req.query;

  const address = queryParams?.address as string;

  let network = queryParams?.network as string;
  network = network?.toUpperCase() as Network;

  const type = queryParams?.type as RouterEventType;

  if (network !== "MAINNET" && network !== "TESTNET") {
    return res.status(400).json({ error: "Invalid network" });
  }

  const events = await getMercuryEvents(network);

  const tokenList = await fetchTokenList({ network });

  let data: RouterEventAPI[] = events.map((event) => {
    const tokenA = tokenList.find(
      (token: TokenType) => token.contract === event.tokenA
    );
    const tokenB = tokenList.find(
      (token: TokenType) => token.contract === event.tokenB
    );

    return {
      ...event,
      txHash: event.txHash,
      tokenA: tokenA
        ? tokenA
        : { contract: event.tokenA, code: event.tokenA, name: event.tokenA },
      tokenB: tokenB
        ? tokenB
        : { contract: event.tokenB, code: event.tokenB, name: event.tokenB },
      amountA: adjustAmountByDecimals(event.amountA, tokenA?.decimals),
      amountB: adjustAmountByDecimals(event.amountB, tokenB?.decimals),
    };
  });

  if (type) {
    data = data.filter((event) => event.eType === type);
  }

  if (address) {
    const pools = await getMercuryPools(network);
    const pool = pools.find((pool) => pool.address === address);

    data = data.filter(
      (event) =>
        (event.tokenA?.contract === pool?.tokenA &&
          event.tokenB?.contract === pool?.tokenB) ||
        (event.tokenA?.contract === pool?.tokenB &&
          event.tokenB?.contract === pool?.tokenA)
    );
  }

  return res.json(data);
}

export default handler;
