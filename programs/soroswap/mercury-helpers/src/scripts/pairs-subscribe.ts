import {
  getPairs,
  mainnetPairsTable,
  testnetPairsTable,
} from "../utils/get-pairs.js";
import { mercuryInstance } from "../utils/mercury.js";

(async () => {
  const pairs = await getPairs(mainnetPairsTable);

  const subs = await Promise.all(
    pairs.map(async (p: any) => {
      const sub = await mercuryInstance.subscribeToContractEvents({
        contractId: p.address,
      });

      return sub.ok;
    })
  );

  const oks = subs.filter((r) => r);

  console.log("SUBSCRIBED TO", oks.length, "PAIRS");
})();
