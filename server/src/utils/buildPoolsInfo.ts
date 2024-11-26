// // server/src/utils/buildPoolsInfo.ts

// import { Pool, TvlChartData, VolumeChartData, FeesChartData } from '../types/pools';
// import { TokenType } from '../types/tokens';
// import { Network } from '../types/network';
// import { MercuryPair, getMercuryPools, MercuryRsvCh, MercuryEvent, getMercuryEvents, getMercuryRsvCh } from './mercury';
// import { getDate } from './utils';
// import { fillChart } from './fillChart';
// import { getRouterFromPools, getTokenPrice, getPoolTVL, getPoolVolume, getPoolFees, getPoolVolumeChartData, getPoolFeesChartData, getPoolTVLChartData } from './router'; // Implementa o importa según sea necesario

// export const buildPoolsInfo = async (
//   tokens: TokenType[],
//   network: Network
// ): Promise<Pool[]> => {
//   const pools: MercuryPair[] = await getMercuryPools(network);
//   const events: MercuryEvent[] = await getMercuryEvents(network);
//   const rsvchs: MercuryRsvCh[] = await getMercuryRsvCh(network);

//   // Construir lista de tokens para el filtrado
//   const tokenMap = new Map<string, TokenType>();
//   tokens.forEach(token => {
//     tokenMap.set(token.address, token);
//   });

//   // Filtrar pares que solo contienen tokens en la lista curada
//   const filteredPools = pools.filter(pair => 
//     tokenMap.has(pair.tokenA) && tokenMap.has(pair.tokenB)
//   );

//   // Obtener lista de tokens
//   const allowedContracts = tokens.map(token => token.address);

//   // Crear un router para obtener precios
//   const router = getRouterFromPools(filteredPools, network);

//   const result: Pool[] = await Promise.all(
//     filteredPools.map(async (pool) => {
//       const tokenA = tokens.find(token => token.address === pool.tokenA);
//       const tokenB = tokens.find(token => token.address === pool.tokenB);

//       const tokenAPrice = tokenA ? await getTokenPrice(tokenA.address, 'CAAV3AE3VKD2P4TY7LWTQMMJHIJ4WOCZ5ANCIJPC3NRSERKVXNHBU2W7', network, router) : 0;
//       const tokenBPrice = tokenB ? await getTokenPrice(tokenB.address, 'CAAV3AE3VKD2P4TY7LWTQMMJHIJ4WOCZ5ANCIJPC3NRSERKVXNHBU2W7', network, router) : 0;

//       const tvl = getPoolTVL(pool.reserveA, pool.reserveB, tokenAPrice, tokenBPrice, tokenA?.decimals, tokenB?.decimals);

//       const tvlChartData = getPoolTVLChartData(rsvchs, pool);
//       const volumeChartData = getPoolVolumeChartData(events, pool);
//       const feesChartData = getPoolFeesChartData(events, pool);

//       const nowTimestamp = Date.now() / 1000;

//       const volume7d = volumeChartData.reduce((acc, item) => {
//         const itemTimestamp = new Date(item.date).getTime() / 1000;
//         if (nowTimestamp - itemTimestamp <= 7 * 24 * 3600) {
//           return acc + item.volume;
//         }
//         return acc;
//       }, 0);

//       const volume24h = volumeChartData.reduce((acc, item) => {
//         const itemTimestamp = new Date(item.date).getTime() / 1000;
//         if (nowTimestamp - itemTimestamp <= 24 * 3600) {
//           return acc + item.volume;
//         }
//         return acc;
//       }, 0);

//       const fees24h = feesChartData.reduce((acc, item) => {
//         const itemTimestamp = new Date(item.date).getTime() / 1000;
//         if (nowTimestamp - itemTimestamp <= 24 * 3600) {
//           return acc + item.fees;
//         }
//         return acc;
//       }, 0);

//       const fees7d = feesChartData.reduce((acc, item) => {
//         const itemTimestamp = new Date(item.date).getTime() / 1000;
//         if (nowTimestamp - itemTimestamp <= 7 * 24 * 3600) {
//           return acc + item.fees;
//         }
//         return acc;
//       }, 0);

//       const feesYearly = fees7d * 52;

//       return {
//         ...pool,
//         tokenA: tokenA || { address: pool.tokenA, symbol: pool.tokenA, name: pool.tokenA, decimals: 7 },
//         tokenB: tokenB || { address: pool.tokenB, symbol: pool.tokenB, name: pool.tokenB, decimals: 7 },
//         tokenAPrice,
//         tokenBPrice,
//         tvl,
//         tvlChartData,
//         volumeChartData,
//         feesChartData,
//         volume7d,
//         volume24h,
//         fees24h,
//         feesYearly,
//       };
//     })
//   );

//   return result;
// };
