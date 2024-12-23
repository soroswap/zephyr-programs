import { mercuryInstance } from "../utils/mercury.js";

(async () => {
  const res = await mercuryInstance.updateAccessToken();

  const token = res.data?.authenticate.jwtToken;

  console.log("TOKEN");
  console.log("-".repeat(50));
  console.log(token);
  console.log("-".repeat(50));

  console.log("GRAPHIQL HEADER");
  console.log("-".repeat(50));
  console.log(`{"Authorization": "Bearer ${token}"}`);
  console.log("-".repeat(50));
})();
