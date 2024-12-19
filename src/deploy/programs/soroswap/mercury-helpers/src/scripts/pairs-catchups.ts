import fs from "fs";
import {
  getPairs,
  mainnetPairsTable,
  testnetPairsTable,
} from "../utils/get-pairs.js";

const buildCatchupCommand = (s: string, mainnet = "false") => {
  return `mercury-cli --jwt $MERCURY_JWT --local false --mainnet ${mainnet} catchup --contracts "${s}"`;
};

(async () => {
  const pairs = await getPairs(testnetPairsTable);

  const catchups: string[] = [];

  pairs.forEach((p: any) => {
    catchups.push(buildCatchupCommand(p.address));
  });

  fs.writeFileSync("pairs-catchups-testnet.sh", catchups.join("\n"));

  const pairsMainnet = await getPairs(mainnetPairsTable);

  const catchupsMainnet: string[] = [];

  pairsMainnet.forEach((p: any) => {
    catchupsMainnet.push(buildCatchupCommand(p.address, "true"));
  });

  fs.writeFileSync("pairs-catchups-mainnet.sh", catchupsMainnet.join("\n"));
})();
