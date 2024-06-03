import fs from "fs";

const buildCatchupCommand = (s: string) => {
  return `mercury-cli --jwt $MERCURY_JWT --local false --mainnet false catchup --contracts "${s}"`;
};

const ROUTER_ADDRESS =
  "CB74KXQXEGKGPU5C5FI22X64AGQ63NANVLRZBS22SSCMLJDXNHED72MO";

const FACTORY_ADDRESS =
  "CBRR266UONXDUG3W57V2X5XCXT77RDK27LJE4QVKH2UTHYZGXPW5HBCT";

(async () => {
  const routerCatchup = buildCatchupCommand(ROUTER_ADDRESS);
  const factoryCatchup = buildCatchupCommand(FACTORY_ADDRESS);

  fs.writeFileSync(
    "init-catchups.sh",
    [routerCatchup, factoryCatchup].join("\n")
  );
})();
