export const GET_ALL_EVENTS = (tableName: string) => `query Query {
    events: ${tableName} {
      data: nodes {
        eType
        tokenA
        tokenB
        amountA
        amountB
        account
        timestamp
        txHash
      }
    }
  }`;
