import { Mercury } from 'mercury-sdk';

export const getMercuryInstance = (network: 'MAINNET' | 'TESTNET') => {
  let backendEndpoint = null;
  let graphqlEndpoint = null;
  let email = null;
  let password = null;

  if (network === 'MAINNET') {
    email = process.env.MERCURY_EMAIL_MAINNET!;
    password = process.env.MERCURY_PASSWORD_MAINNET!;
    backendEndpoint = process.env.MERCURY_BACKEND_ENDPOINT_MAINNET!;
    graphqlEndpoint = process.env.MERCURY_GRAPHQL_ENDPOINT_MAINNET!;
  } else {
    email = process.env.MERCURY_EMAIL_TESTNET!;
    password = process.env.MERCURY_PASSWORD_TESTNET!;
    backendEndpoint = process.env.MERCURY_BACKEND_ENDPOINT_TESTNET!;
    graphqlEndpoint = process.env.MERCURY_GRAPHQL_ENDPOINT_TESTNET!;
  }

  return new Mercury({
    backendEndpoint,
    graphqlEndpoint,
    email,
    password,
  });
};
