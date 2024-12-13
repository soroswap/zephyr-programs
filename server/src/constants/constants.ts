import { TokenType } from "types/tokens";

export const xlmToken: { [x: string]: TokenType } = {
  MAINNET: {
    contract: "CAS3J7GYLGXMF6TDJBBYYSE3HQ6BBSMLNUQ34T6TZMYMW2EVH34XOWMA",
    name: "StellarLumens",
    code: "XLM",
    icon: "../tokens/xlm.png",
    decimals: 7,
    domain: "stellar.org",
  },
  TESTNET: {
    contract: "CDLZFC3SYJYDZT7K67VZ75HPJVIEUVNIXF47ZG2FB2RMQQVU2HHGCYSC",
    name: "StellarLumens",
    code: "XLM",
    icon: "../tokens/xlm.png",
    decimals: 7,
    domain: "stellar.org",
  },
};

export const stellarExpertUrl = `https://stellar.expert/explorer`;