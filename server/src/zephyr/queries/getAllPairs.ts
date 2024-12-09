export const GET_ALL_PAIRS = (tableName: string) => `query Query {
    events: ${tableName}	 {
      data: nodes {
        tokenA
        tokenB
        address
        reserveA
        reserveB
      }
    }
  }`;
