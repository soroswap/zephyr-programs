export const GET_ALL_RSV_CH = (tableName: string) => `query Query {
    events: ${tableName} {
      data: nodes {
        address
        reserveA
        reserveB
        timestamp
      }
    }
  }
`;
