import fs from "fs";
import { getMercuryInstance } from "../../../../../src/zephyr/mercury.js";

const buildCatchupCommand = (s: string, mainnet = "false") => {
  return `mercury-cli --jwt $MERCURY_JWT --local false --mainnet ${mainnet} catchup --contracts "${s}"`;
};
//TESTNET
const ROUTER_ADDRESS =
  "CBHNQTKJD76Q55TINIT3PPP3BKLIKIQEXPTQ32GUUU7I3CHBD5JECZLW";
const FACTORY_ADDRESS =
  "CARJOYYBHVV2Y5GXEXIZFJJRRAWQBJ4DB2IJEPVHL2I3XKNHUB2HZWDX";

//MAINNET
const ROUTER_ADDRESS_MAINNET =
  "CAG5LRYQ5JVEUI5TEID72EYOVX44TTUJT5BQR2J6J77FH65PCCFAJDDH";

const FACTORY_ADDRESS_MAINNET =
  "CA4HEQTL2WPEUYKYKCDOHCDNIV4QHNJ7EL4J4NQ6VADP7SYHVRYZ7AW2";

(async () => {
  const mercuryInstance = getMercuryInstance("MAINNET")
  const sub = await mercuryInstance.subscribeToContractEvents({
    contractId: ROUTER_ADDRESS,
  });

  console.log("SUBSCRIBED TO ROUTER TESTNET", sub.ok);

  const subFactory = await mercuryInstance.subscribeToContractEvents({
    contractId: FACTORY_ADDRESS,
  });

  console.log("SUBSCRIBED TO FACTORY TESTNET", subFactory.ok);

  const routerCatchup = buildCatchupCommand(ROUTER_ADDRESS);
  const factoryCatchup = buildCatchupCommand(FACTORY_ADDRESS);

  fs.writeFileSync(
    "init-catchups-testnet.sh",
    [routerCatchup, factoryCatchup].join("\n")
  );

  const routerCatchupMainnet = buildCatchupCommand(
    ROUTER_ADDRESS_MAINNET,
    "true"
  );
  const factoryCatchupMainnet = buildCatchupCommand(
    FACTORY_ADDRESS_MAINNET,
    "true"
  );

  fs.writeFileSync(
    "init-catchups-mainnet.sh",
    [routerCatchupMainnet, factoryCatchupMainnet].join("\n")
  );
})();
