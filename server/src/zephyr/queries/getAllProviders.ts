export const GET_ALL_PROVIDERS = (tableName: string) => `query Query {
    events: ${tableName} {
      data: nodes {
        providerAddress
        poolAddress
        shares
        percentage
      }
    }
  }`;
