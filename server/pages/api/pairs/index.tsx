import { Network } from "types/network";
import { NextApiRequest, NextApiResponse } from "next";
import { buildPoolsInfo } from "utils/info/pools";
import { TokenType } from "types/tokens";
import { fetchTokenList } from "services/tokens";
import { handlePoolRequest } from "utils/info/pools/handlePoolRequest";
import { getMercuryPools, getMercuryAquaPools, getMercuryPhoenixPools } from "zephyr/helpers";

export interface MercuryPair {
  tokenA: string;
  tokenB: string;
  address: string;
  reserveA: string;
  reserveB: string;
}

async function handler(req: NextApiRequest, res: NextApiResponse) {
  const queryParams = req.query;

  const address = queryParams?.address as string;
  const protocol = queryParams?.protocol as string;
  let network = queryParams?.network as string;
  network = network?.toUpperCase() as Network;

  if (network !== "MAINNET" && network !== "TESTNET") {
    return res.status(400).json({ error: "Invalid network" });
  }

  if (!protocol) {
    return res.status(400).json({ error: "Protocol is required" });
  }

  const supportedProtocols = ["soroswap", "phoenix", "aqua"];
  if (!supportedProtocols.includes(protocol.toLowerCase())) {
    return res.status(400).json({ error: `Unsupported protocol: ${protocol}` });
  }

  const tokenList: TokenType[] = await fetchTokenList({ network });

  let data;
  switch (protocol.toLowerCase()) {
    case "soroswap":
      data = await getMercuryPools(network);
      break;
    case "phoenix":
      return handlePoolRequest(req, res, getMercuryPhoenixPools);
    case "aqua":
      return handlePoolRequest(req, res, getMercuryAquaPools);
    default:
      return res.status(400).json({ error: "Unsupported protocol" });
  }

  const result = await buildPoolsInfo(data, tokenList, network);

  if (address) {
    const pool = result.find((pair) => pair.address === address);
    return res.json(pool);
  }

  return res.json(result);
}

export default handler;