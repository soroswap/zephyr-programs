import { ApiNetwork, Network } from "../types/network";
import { Token } from "../types/tokens";
import { fillDatesAndSort } from "../utils/complete-chart";
import axiosInstance from "./axios";
import { xlmToken } from "../constants/constants";

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
    return data.find((item: any) => item.network === network.toLowerCase())
      .assets;
  }

  return [];
};

export const fetchTokens = async ({ network }: ApiNetwork) => {
  const { data } = await axiosInstance.get<Token[]>("/api/tokens", {
    params: { network },
  });
  return data;
};

interface FetchTokenProps extends ApiNetwork {
  tokenAddress: string;
}

export const fetchToken = async ({
  tokenAddress,
  network,
}: FetchTokenProps) => {
  const { data } = await axiosInstance.get<Token>(
    `/api/tokens?address=${tokenAddress}`,
    {
      params: { network },
    }
  );
  return data;
};

export const fetchTokenTVLChart = async ({
  tokenAddress,
}: {
  tokenAddress: string;
}) => {
  const { data } = await axiosInstance.get<{ tvl: number; date: string }[]>(
    `/info/token/tvl-chart/${tokenAddress}?protocols=soroswap`
  );

  const filledData = fillDatesAndSort(data, "tvl");

  return filledData;
};

export const fetchTokenPriceChart = async ({
  tokenAddress,
}: {
  tokenAddress: string;
}) => {
  const { data } = await axiosInstance.get<{ price: number; date: string }[]>(
    `/info/token/price-chart/${tokenAddress}?protocols=soroswap`
  );

  const filledData = fillDatesAndSort(data, "price");

  return filledData;
};

export const fetchTokenVolumeChart = async ({
  tokenAddress,
}: {
  tokenAddress: string;
}) => {
  const { data } = await axiosInstance.get<{ volume: number; date: string }[]>(
    `/info/token/volume-chart/${tokenAddress}?protocols=soroswap`
  );

  const filledData = fillDatesAndSort(data, "volume");

  return filledData;
};
