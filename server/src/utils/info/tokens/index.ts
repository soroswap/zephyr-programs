import { fetchTokenList } from "services/tokens";
import { Network } from "types/network";
import {
  Pool,
  PriceChartData,
  TvlChartData,
  VolumeChartData,
} from "types/pools";
import { Token, TokenType } from "types/tokens";
import { MercuryRsvCh, getMercuryRsvCh } from "zephyr/helpers";
import { getDate } from "../pools";
import { getExpectedAmountOfOne } from "utils/utils";
import { fillChart } from "utils/complete-chart";

export const buildTokensInfo = async (
  tokenList: TokenType[],
  pools: Pool[],
  network: Network
) => {
  const rsvchs = await getMercuryRsvCh(network);

  const tokens: Token[] = tokenList.map((t) => ({
    asset: t,
    fees24h: 0,
    price: 0,
    priceChange24h: 0,
    tvl: 0,
    tvlSlippage24h: 0,
    tvlSlippage7d: 0,
    volume24h: 0,
    volume24hChange: 0,
    volume7d: 0,
    volume7dChange: 0,
    issuer: "",
  }));

  const USDC = tokens.find((token) => token.asset.code === "USDC");

  if (!USDC) return tokens;

  const result = tokens.map((token) => {
    const tokenPools = pools.filter(
      (pool) =>
        pool.tokenA.contract === token.asset.contract ||
        pool.tokenB.contract === token.asset.contract
    );

    let tokenPrice = 0;
    const tokenDecimals = token.asset.decimals || 7;

    if (tokenPools.length > 0) {
      if (tokenPools[0].tokenA.contract === token.asset.contract) {
        tokenPrice = tokenPools[0].tokenAPrice;
      } else {
        tokenPrice = tokenPools[0].tokenBPrice;
      }
    }

    const tvl = tokenPools.reduce((acc, pool) => {
      if (pool.tokenA.contract === token.asset.contract) {
        return acc + parseFloat(pool.reserveA) / 10 ** tokenDecimals;
      }

      if (pool.tokenB.contract === token.asset.contract) {
        return acc + parseFloat(pool.reserveB) / 10 ** tokenDecimals;
      }

      return acc;
    }, 0);

    const volumeChartData = getTokenVolumeChartData(token, tokenPools);
    const tvlChartData = getTokenTVLChartData(token, tokenPools);

    const usdcPool = pools.find(
      (pool) =>
        (pool.tokenA.code === "USDC" || pool.tokenB.code === "USDC") &&
        (pool.tokenA.contract === token.asset.contract ||
          pool.tokenB.contract === token.asset.contract)
    );

    const priceChartData = getTokenPriceChart(token, usdcPool, rsvchs);

    const nowTimestamp = new Date().getTime() / 1000;

    const volume24h = volumeChartData.reduce((acc, item) => {
      const itemTimestamp = new Date(item.date).getTime() / 1000;

      if (nowTimestamp - itemTimestamp <= 24 * 3600) {
        return acc + item.volume;
      }
      return acc;
    }, 0);

    const volume7d = volumeChartData.reduce((acc, item) => {
      const itemTimestamp = new Date(item.date).getTime() / 1000;

      if (nowTimestamp - itemTimestamp <= 7 * 24 * 3600) {
        return acc + item.volume;
      }
      return acc;
    }, 0);

    return {
      ...token,
      price: tokenPrice,
      tvl: tvl * tokenPrice,
      volumeChartData,
      tvlChartData,
      priceChartData,
      volume24h,
      volume7d,
    };
  });

  return result;
};

export const getTokenVolumeChartData = (token: Token, tokenPools: Pool[]) => {
  let volumeChartData: { [x: string]: any } = {};

  tokenPools.forEach((pool) => {
    pool.volumeChartData?.forEach((data) => {
      const volume =
        pool.tokenA.contract === token.asset.contract
          ? data.valueA
          : data.valueB;

      if (!volumeChartData[data.date]) {
        volumeChartData[data.date] = {
          date: data.date,
          volume: volume || 0,
          timestamp: data.timestamp,
        };
      } else {
        volumeChartData[data.date] = {
          ...volumeChartData[data.date],
          volume: volumeChartData[data.date].volume + (volume || 0),
        };
      }
    });
  });

  volumeChartData = Object.values(volumeChartData) as VolumeChartData[];

  volumeChartData.sort(
    (a: VolumeChartData, b: VolumeChartData) =>
      new Date(a.date).getTime() - new Date(b.date).getTime()
  );

  return volumeChartData as VolumeChartData[];
};

export const getTokenTVLChartData = (token: Token, tokenPools: Pool[]) => {
  let tvlChartData: { [x: string]: any } = {};

  tokenPools.forEach((pool) => {
    pool.tvlChartData?.forEach((data) => {
      const tvl =
        pool.tokenA.contract === token.asset.contract
          ? data.valueA
          : data.valueB;

      if (!tvlChartData[data.date]) {
        tvlChartData[data.date] = {
          date: data.date,
          tvl: tvl || 0,
          timestamp: data.timestamp,
        };
      } else {
        tvlChartData[data.date] = {
          ...tvlChartData[data.date],
          tvl: tvlChartData[data.date].tvl + (tvl || 0),
        };
      }
    });
  });

  tvlChartData = Object.values(tvlChartData) as TvlChartData[];

  tvlChartData.sort(
    (a: TvlChartData, b: TvlChartData) =>
      new Date(a.date).getTime() - new Date(b.date).getTime()
  );

  return tvlChartData;
};

export const getTokenPriceChart = (
  token: Token,
  usdcPool: Pool | undefined,
  rsvchs: MercuryRsvCh[]
) => {
  if (!usdcPool) return [];

  const usdcPoolRsvchs = rsvchs.filter((r) => r.address === usdcPool.address);

  if (usdcPoolRsvchs.length === 0) return [];

  const priceChartData = usdcPoolRsvchs.map((r) => {
    let tokenUsdValue;

    if (usdcPool?.tokenA.contract === token.asset.contract) {
      tokenUsdValue = getExpectedAmountOfOne(r.reserveA, r.reserveB);
    } else {
      tokenUsdValue = getExpectedAmountOfOne(r.reserveB, r.reserveA);
    }

    return {
      timestamp: r.timestamp,
      date: getDate(r.timestamp),
      price: tokenUsdValue,
    };
  });

  const filledPriceChartData = fillChart(priceChartData, "price");

  return filledPriceChartData as PriceChartData[];
};
