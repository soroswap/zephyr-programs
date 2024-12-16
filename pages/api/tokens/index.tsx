import { NextApiRequest, NextApiResponse } from "next";
import { fetchTokenList } from "services/tokens";
import { Network } from "types/network";
import { TokenType } from "types/tokens";
import { buildPoolsInfo } from "utils/info/pools";
import { buildTokensInfo } from "utils/info/tokens";
import { getMercuryPools } from "zephyr/helpers";

async function handler(req: NextApiRequest, res: NextApiResponse) {
  const queryParams = req.query;

  let network = queryParams?.network as string;
  network = network?.toUpperCase() as Network;

  const address = queryParams?.address as string;

  if (network !== "MAINNET" && network !== "TESTNET") {
    return res.status(400).json({ error: "Invalid network" });
  }

  try {
    const tokenList: TokenType[] = await fetchTokenList({ network });

    const data = await getMercuryPools(network);

    const result = await buildPoolsInfo(data, tokenList, network);

    const tokensInfo = await buildTokensInfo(tokenList, result, network);

    if (address) {
      const filteredData = tokensInfo.find(
        (token) => token.asset.contract === address
      );

      return res.json(filteredData);
    }

    return res.json(tokensInfo);
  } catch (error) {
    return res.status(500).json({ error: "Failed to fetch token list" });
  }
}

export default handler;
