import {
  FeesChartData,
  Pool,
  TvlChartData,
  VolumeChartData,
} from "types/pools";
import {
  CurrencyAmount,
  Networks,
  Router,
  Token as SdkToken,
  TradeType,
} from "soroswap-router-sdk";
import { TokenType } from "types/tokens";
import { Network } from "types/network";
import {
  MercuryRsvCh,
  getMercuryEvents,
  getMercuryRsvCh,
} from "zephyr/helpers";
import { MercuryPair } from "../../../../pages/api/pairs";
import { MercuryEvent } from "../../../../pages/api/events";
import { adjustAmountByDecimals } from "utils/utils";
import { fillChart } from "utils/complete-chart";

export const stellarNetworkDict = {
  MAINNET: Networks.PUBLIC,
  TESTNET: Networks.TESTNET,
};

export const buildPoolsInfo = async (
  data: MercuryPair[],
  tokenList: TokenType[],
  network: Network
) => {
  const filteredData = data.filter((pool) => {
    const tokenAExists = tokenList.some((token) => token.contract === pool.tokenA);
    const tokenBExists = tokenList.some((token) => token.contract === pool.tokenB);
    return tokenAExists && tokenBExists;
  });

  const sdkNetwork = stellarNetworkDict[network];
  const router = getRouterFromPools(filteredData, sdkNetwork);

  const USDC = tokenList.find((token) => token.code === "USDC");
  if (!USDC) throw new Error("USDC token not found in the token list.");

  // const rsvch = await getMercuryRsvCh(network);
  // const events = await getMercuryEvents(network);

  const result: Array<Pool> = await Promise.all(
    filteredData.map(async (pool) => {
      // Get tokens metadata
      const tokenA = tokenList.find((token: TokenType) => token.contract === pool.tokenA)!;
      const tokenB = tokenList.find((token: TokenType) => token.contract === pool.tokenB)!;

      const { tokenAPrice, tokenBPrice } = await getPoolTokenPrices(tokenA.contract, tokenB.contract, USDC.contract, sdkNetwork, router)
   
      const tvl = getPoolTVL(
        pool.reserveA,
        pool.reserveB,
        tokenAPrice,
        tokenBPrice,
        tokenA?.decimals,
        tokenB?.decimals
      );

      const poolData = {
        ...pool,
        tokenA: tokenA
          ? tokenA
          : { contract: pool.tokenA, code: pool.tokenA, name: pool.tokenA },
        tokenB: tokenB
          ? tokenB
          : { contract: pool.tokenB, code: pool.tokenB, name: pool.tokenB },
        tokenAPrice,
        tokenBPrice,
        fees24h: 0,
        feesYearly: 0,
        tvl,
        volume24h: 0,
        volume7d: 0,
      };
      
      // const tvlChartData = getPoolTVLChartData(rsvch, poolData);
      // const volumeChartData = getPoolVolumeChartData(events, poolData);
      // const feesChartData = getPoolFeesChartData(events, poolData);

      // const nowTimestamp = new Date().getTime() / 1000;

      // const volume7d = volumeChartData.reduce((acc, item) => {
      //   const itemTimestamp = new Date(item.date).getTime() / 1000;

      //   if (nowTimestamp - itemTimestamp <= 7 * 24 * 3600) {
      //     return acc + item.volume;
      //   }
      //   return acc;
      // }, 0);

      // const volume24h = volumeChartData.reduce((acc, item) => {
      //   const itemTimestamp = new Date(item.date).getTime() / 1000;

      //   if (nowTimestamp - itemTimestamp <= 24 * 3600) {
      //     return acc + item.volume;
      //   }
      //   return acc;
      // }, 0);

      // const fees24h = feesChartData.reduce((acc, item) => {
      //   const itemTimestamp = new Date(item.date).getTime() / 1000;

      //   if (nowTimestamp - itemTimestamp < 24 * 3600) {
      //     return acc + item.fees;
      //   }
      //   return acc;
      // }, 0);

      // const fees7d = feesChartData.reduce((acc, item) => {
      //   const itemTimestamp = new Date(item.date).getTime() / 1000;

      //   if (nowTimestamp - itemTimestamp < 7 * 24 * 3600) {
      //     return acc + item.fees;
      //   }
      //   return acc;
      // }, 0);

      // const feesYearly = fees7d * 52;

      return {
        ...poolData,
        // tvlChartData ,
        // volumeChartData,
        // feesChartData,
        // volume7d,
        // volume24h,
        // fees24h,
        // feesYearly,
      };
    })
  );
  return result
};

export const getDate = (timestamp: string) => {
  return new Date(parseInt(timestamp) * 1000).toISOString().split("T")[0];
};

const fromAddressToToken = (address: string, network: Networks) => {
  return new SdkToken(network, address, 18);
};

const fromAddressAndAmountToCurrencyAmount = (
  address: string,
  amount: string,
  network: Networks
) => {
  const token = fromAddressToToken(address, network);
  return CurrencyAmount.fromRawAmount(token, amount);
};

export const getRouterFromPools = (pools: MercuryPair[], network: Networks) => {
  return new Router({
    ...( {
      getPairsFn: async () => {
        return new Promise((resolve) => {
          resolve(pools);
        });
      },
      pairsCacheInSeconds: 60,
      network,
      maxHops: 5,
    } as any), // Suppress TypeScript error
  });
};

export const getTokenPrice = async (
  tokenAddress: string,
  usdcAddress: string,
  network: Networks,
  router: Router
) => {
  if (tokenAddress === usdcAddress) return 1;

  const currencyAmount = fromAddressAndAmountToCurrencyAmount(
    tokenAddress,
    "10000000",
    network
  );
  const quoteCurrency = fromAddressToToken(usdcAddress, network);
  const route = await router.route(
    currencyAmount,
    quoteCurrency,
    TradeType.EXACT_INPUT
  );

  if (!route || !route.trade?.amountOutMin) return 0;
  const price = adjustAmountByDecimals(route.trade.amountOutMin, 7);
  return price;
};

export const getPoolTokenPrices = async (
  tokenA: string | undefined,
  tokenB: string | undefined,
  usdcAddress: string | undefined,
  network: Networks,
  router: Router
) => {
  if (!tokenA || !tokenB || !usdcAddress)
    return { tokenAPrice: 0, tokenBPrice: 0 };

  const tokenAPrice = await getTokenPrice(tokenA, usdcAddress, network, router);
  const tokenBPrice = await getTokenPrice(tokenB, usdcAddress, network, router);

  return {
    tokenAPrice: Number(tokenAPrice),
    tokenBPrice: Number(tokenBPrice),
  };
};

export const getPoolTVL = (
  reserveA: string,
  reserveB: string,
  tokenAPrice: number,
  tokenBPrice: number,
  decimalsA: number = 7,
  decimalsB: number = 7
) => {
  const valueA = parseFloat(reserveA) / 10 ** decimalsA;
  const valueB = parseFloat(reserveB) / 10 ** decimalsB;

  const tvl = valueA * Number(tokenAPrice) + valueB * Number(tokenBPrice);

  return tvl;
};

export const getPoolVolume = (
  amountA: string,
  amountB: string,
  tokenAPrice: number,
  tokenBPrice: number,
  decimalsA: number = 7,
  decimalsB: number = 7
) => {
  const amountAResult = parseFloat(amountA) / 10 ** decimalsA;
  const amountBResult = parseFloat(amountB) / 10 ** decimalsB;

  const valueA = amountAResult * tokenAPrice;
  const valueB = amountBResult * tokenBPrice;

  return { volumeA: valueA, volumeB: valueB };
};

export const getPoolFees = (
  amountA: string,
  tokenAPrice: number,
  decimalsA: number = 7
) => {
  const amountAResult = parseFloat(amountA) / 10 ** decimalsA;
  const fees = amountAResult * (3 / 1000);
  const feesPrice = fees * tokenAPrice;

  return feesPrice;
};

export const getPoolVolumeChartData = (events: MercuryEvent[], pool: Pool) => {
  const poolEvents = events.filter((e) => {
    if (
      e.tokenA === pool?.tokenA.contract &&
      e.tokenB === pool?.tokenB.contract
    ) {
      return true;
    }

    if (
      e.tokenA === pool?.tokenB.contract &&
      e.tokenB === pool?.tokenA.contract
    ) {
      return true;
    }

    return false;
  });

  const poolsEventsWithTokensOrdered = poolEvents.map((e) => {
    if (
      e.tokenA === pool?.tokenA.contract &&
      e.tokenB === pool?.tokenB.contract
    ) {
      return e;
    }

    return {
      ...e,
      tokenA: e.tokenB,
      tokenB: e.tokenA,
      amountA: e.amountB,
      amountB: e.amountA,
    };
  });

  const volumeChartData = poolsEventsWithTokensOrdered.map((e) => {
    const volumes = getPoolVolume(
      e.amountA,
      e.amountB,
      pool.tokenAPrice,
      pool.tokenBPrice,
      pool?.tokenA.decimals,
      pool?.tokenB.decimals
    );
    return {
      timestamp: e.timestamp,
      date: getDate(e.timestamp),
      volume: volumes.volumeA + volumes.volumeB,
      valueA: volumes.volumeA,
      valueB: volumes.volumeB,
    };
  });

  const filledVolumeChartData = fillChart(volumeChartData, "volume", false);

  return filledVolumeChartData as VolumeChartData[];
};

export const getPoolFeesChartData = (events: MercuryEvent[], pool: Pool) => {
  const poolEvents = events.filter((e) => {
    if (
      e.tokenA === pool?.tokenA.contract &&
      e.tokenB === pool?.tokenB.contract
    ) {
      return true;
    }

    if (
      e.tokenA === pool?.tokenB.contract &&
      e.tokenB === pool?.tokenA.contract
    ) {
      return true;
    }

    return false;
  });

  const swapEvents = poolEvents.filter((e) => e.eType === "swap");

  const feesChartData = swapEvents.map((e) => {
    return {
      timestamp: e.timestamp,
      date: getDate(e.timestamp),
      fees: getPoolFees(e.amountA, pool.tokenAPrice, pool?.tokenA.decimals),
    };
  });

  const filledFeesChartData = fillChart(feesChartData, "fees", false);

  return filledFeesChartData as FeesChartData[];
};

export const getPoolTVLChartData = (rsvchs: MercuryRsvCh[], pool: Pool) => {
  const rsvFiltered = rsvchs.filter((r) => r.address === pool.address);

  const tvlChartData = rsvFiltered.map((r) => {
    return {
      timestamp: r.timestamp,
      date: getDate(r.timestamp),
      tvl: getPoolTVL(
        r.reserveA,
        r.reserveB,
        pool.tokenAPrice,
        pool.tokenBPrice,
        pool?.tokenA.decimals,
        pool?.tokenB.decimals
      ),
      valueA:
        (parseFloat(r.reserveA) / 10 ** (pool?.tokenA?.decimals || 7)) *
        pool.tokenAPrice,
      valueB:
        (parseFloat(r.reserveB) / 10 ** (pool?.tokenB?.decimals || 7)) *
        pool.tokenBPrice,
      reserveA: r.reserveA,
      reserveB: r.reserveB,
    };
  });

  const filledTvlChartData = fillChart(tvlChartData, "tvl");

  return filledTvlChartData as TvlChartData[];
};
