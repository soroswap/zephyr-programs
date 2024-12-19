import BigNumber from "bignumber.js";

export const getExpectedAmountOfOne = (
  reserve0: number | string | undefined,
  reserve1: number | string | undefined
) => {
  if (!reserve0 || !reserve1) return;

  const one = BigNumber(1);

  const reserveIn = BigNumber(reserve0);
  const reserveOut = BigNumber(reserve1);

  let amountInWithFee = one.multipliedBy(997);
  let numerator = amountInWithFee.multipliedBy(reserveOut);
  let denominator = reserveIn.multipliedBy(1000).plus(amountInWithFee);

  return numerator.dividedBy(denominator).toFixed(7);
};

export const adjustAmountByDecimals = (
  amount: number | string,
  decimals: number | undefined
): string => {
  const defaultDecimals = 7;
  const actualDecimals = decimals ?? defaultDecimals;

  let amountStr = amount.toString();

  while (amountStr.length <= actualDecimals) {
    amountStr = "0" + amountStr;
  }

  const integerPart = amountStr.slice(0, -actualDecimals);
  const decimalPart = amountStr.slice(-actualDecimals);
  const result = integerPart + "." + decimalPart;

  return result.replace(/(\.\d*[1-9])0+$|\.0*$/, "$1");
};