import dotenv from "dotenv";
dotenv.config();

import { Mercury } from "mercury-sdk";

export const mercuryInstance = new Mercury({
  backendEndpoint: process.env.MERCURY_BACKEND_ENDPOINT!,
  graphqlEndpoint: process.env.MERCURY_GRAPHQL_ENDPOINT!,
  email: process.env.MERCURY_EMAIL!,
  password: process.env.MERCURY_PASSWORD!,
});
