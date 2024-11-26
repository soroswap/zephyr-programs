import axios from "axios";
import { TokenType } from "../types/tokens";
import getPairs from "./get-pairs";
import { mockData } from "./loadMockData";
interface Token {
  name: string;
  code: string;
  issuer: string;
  contract: string;
  org: string;
  domain: string;
  icon: string;
  decimals: number;
  symbol: string;
}

const getTokens = async (protocol: string, network: 'MAINNET' | 'TESTNET') => {
  const environment = process.env.ENVIRONMENT;
  const isDev = environment === 'dev';

  if (isDev) {
    return mockData(protocol, 'tokens');
  }
 
  const protocols = ['soroswap', 'phoenix', 'aqua'];
  const tokensSet = new Set<string>();
  const tokens: Token[] = [];

  for (const proto of protocols) {
      const pairs = await getPairs(proto, network);
      for (const pair of pairs) {
          tokensSet.add(pair.tokenA);
          tokensSet.add(pair.tokenB);
      }
  }

  const tokenListResponse = await axios.get('https://raw.githubusercontent.com/soroswap/token-list/main/tokenList.json');
  const tokenList: TokenType[] = tokenListResponse.data.assets;

  for (const tokenAddress of tokensSet) {
      const tokenData = tokenList.find(token => token.contract === tokenAddress);

      if (tokenData) {
          tokens.push({
                        contract: tokenData.contract,
                        symbol: tokenData.code,
                        name: tokenData.name || '',
                        decimals: tokenData.decimals ?? 0,
                        code: tokenData.code,
                        issuer: tokenData.issuer || '',
                        org: tokenData.org || '',
                        domain: tokenData.domain || '',
                        icon: tokenData.icon || ''
                    });
      }
      
  }

  return tokens;
};

export default getTokens;
