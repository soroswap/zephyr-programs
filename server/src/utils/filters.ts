import { Pool } from "types/pools";
import { RouterEventAPI } from "types/router-events";
import { TokenType } from "types/tokens";

export const shouldFilterToken = (token?: TokenType, searchValue?: string) => {
  if (!token || !searchValue || searchValue?.trim() === "") return true;

  const codeStartWithSearchTerm = token.code
    .toLowerCase()
    .startsWith(searchValue.toLowerCase());
  const nameStartWithSearchTerm = token.name
    ?.toLowerCase()
    .startsWith(searchValue.toLowerCase());
  const contractStartWithSearchTerm = token.contract
    .toLowerCase()
    .startsWith(searchValue.toLowerCase());

  return (
    codeStartWithSearchTerm ||
    nameStartWithSearchTerm ||
    contractStartWithSearchTerm
  );
};

export const shouldFilterPool = (pool?: Pool, searchValue?: string) => {
  if (!pool || !searchValue || searchValue?.trim() === "") return true;

  const poolStartWithSearchTerm = pool.address
    .toLowerCase()
    .startsWith(searchValue.toLowerCase());

  return (
    shouldFilterToken(pool.tokenA, searchValue) ||
    shouldFilterToken(pool.tokenB, searchValue) ||
    poolStartWithSearchTerm
  );
};

export const shouldFilterEvent = (
  event?: RouterEventAPI,
  searchValue?: string
) => {
  if (!event || !searchValue || searchValue?.trim() === "") return true;

  const eventTxHashStartWithSearchTerm =
    event.txHash &&
    event.txHash.toLowerCase().startsWith(searchValue.toLowerCase());

  const eventAccountStartWithSearchTerm = event.account
    ?.toLowerCase()
    .startsWith(searchValue.toLowerCase());

  return (
    shouldFilterToken(event.tokenA, searchValue) ||
    shouldFilterToken(event.tokenB, searchValue) ||
    eventTxHashStartWithSearchTerm ||
    eventAccountStartWithSearchTerm
  );
};
