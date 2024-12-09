export const xAxisChartFormatter = (tick: string) => {
  const num = new Date(tick).toLocaleDateString("en-US", {
    day: "numeric",
  });

  if (Number(num) < 10) {
    return `0${num}`;
  }

  return num;
};
