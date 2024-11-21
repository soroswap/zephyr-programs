import getPairs from "./get-pairs";


interface Token {
  address: string;
  symbol: string;
  name: string;
  decimals: number;
}

const getTokens = async (network: 'MAINNET' | 'TESTNET') => {
  const protocols = ['soroswap', 'phoenix', 'aqua'];
  const tokensSet = new Set<string>();
  const tokens: Token[] = [];

  for (const protocol of protocols) {
    const pairs = await getPairs(protocol, network);
    for (const pair of pairs) {
      tokensSet.add(pair.tokenA);
      tokensSet.add(pair.tokenB);
    }
  }

  for (const tokenAddress of tokensSet) {
    
    tokens.push({
      address: tokenAddress,
      symbol: tokenAddress, 
      name: tokenAddress,   
      decimals: 7,         
    });
  }

  return tokens;
};

export default getTokens;
