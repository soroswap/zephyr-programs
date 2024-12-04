import axiosInstance from "axios";
import { xlmToken } from "../constants.ts/constants";
import { ApiNetwork } from "../types/network";

export const fetchTokenList = async ({ network }: ApiNetwork) => {
    if (network == "MAINNET") {
      const { data } = await axiosInstance.get(
        "https://raw.githubusercontent.com/soroswap/token-list/main/tokenList.json"
      );
  
      data.assets.unshift(xlmToken.MAINNET);
  
      return data.assets;
    }
  
    if (network == "TESTNET") {
      const { data } = await axiosInstance.get(
        "https://api.soroswap.finance/api/tokens"
      );
  
      const testnetData = data.find(
        (item: any) => item.network === network.toLowerCase()
      );
  
      if (testnetData) {
        const xlmIndex = testnetData.assets.findIndex(
          (asset: any) => asset.code === "XLM"
        );
  
        if (xlmIndex !== -1) {
          testnetData.assets[xlmIndex] = xlmToken.TESTNET;
        }
  
        return testnetData.assets;
      }
    }
  
    return [];
  };
  