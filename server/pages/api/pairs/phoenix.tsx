import { NextApiRequest, NextApiResponse } from "next";
import { handlePoolRequest } from "utils/info/pools/handlePoolRequest";
import { getMercuryPhoenixPools } from "zephyr/helpers";

export default function handler(req: NextApiRequest, res: NextApiResponse) {
  return handlePoolRequest(req, res, getMercuryPhoenixPools);
}