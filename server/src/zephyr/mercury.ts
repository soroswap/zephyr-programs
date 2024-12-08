import { Mercury } from "mercury-sdk";

export const getMercuryInstance = (network: "MAINNET" | "TESTNET") => {
  let backendEndpoint = null;
  let graphqlEndpoint = null;
  let apiKey = null;

  if (network === "MAINNET") {
    backendEndpoint = process.env.MERCURY_BACKEND_ENDPOINT_MAINNET!;
    graphqlEndpoint = process.env.MERCURY_GRAPHQL_ENDPOINT_MAINNET!;
    apiKey = process.env.MERCURY_API_KEY_MAINNET!;
  } else {
    backendEndpoint = process.env.MERCURY_BACKEND_ENDPOINT_TESTNET!;
    graphqlEndpoint = process.env.MERCURY_GRAPHQL_ENDPOINT_TESTNET!;
    apiKey = process.env.MERCURY_API_KEY_TESTNET!;
  }

  return new Mercury({
    backendEndpoint,
    graphqlEndpoint,
    apiKey
  });
};
