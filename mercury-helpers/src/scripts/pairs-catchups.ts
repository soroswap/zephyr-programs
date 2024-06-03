import fs from "fs";
import { getPairs } from "../utils/get-pairs.js";

const buildCatchupCommand = (s: string) => {
  return `mercury-cli --jwt $MERCURY_JWT --local false --mainnet false catchup --contracts "${s}"`;
};

(async () => {
  const pairs = await getPairs();

  const catchups: string[] = [];

  pairs.forEach((p: any) => {
    catchups.push(buildCatchupCommand(p.address));
  });

  fs.writeFileSync("pairs-catchups.sh", catchups.join("\n"));
})();
