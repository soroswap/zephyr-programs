import fs from "fs";

const buildCatchupCommand = (s: string, mainnet = "false") => {
  return `mercury-cli --jwt $MERCURY_JWT --local false --mainnet ${mainnet} catchup --contracts "${s}"`;
};
//TESTNET
const ROUTER_ADDRESS =
  "CB74KXQXEGKGPU5C5FI22X64AGQ63NANVLRZBS22SSCMLJDXNHED72MO";
const FACTORY_ADDRESS =
  "CBRR266UONXDUG3W57V2X5XCXT77RDK27LJE4QVKH2UTHYZGXPW5HBCT";

//MAINNET
const ROUTER_ADDRESS_MAINNET =
  "CAG5LRYQ5JVEUI5TEID72EYOVX44TTUJT5BQR2J6J77FH65PCCFAJDDH";

const FACTORY_ADDRESS_MAINNET =
  "CA4HEQTL2WPEUYKYKCDOHCDNIV4QHNJ7EL4J4NQ6VADP7SYHVRYZ7AW2";

(async () => {
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
