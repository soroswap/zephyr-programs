import {
  AreaChart,
  Area,
  XAxis,
  Tooltip,
  ResponsiveContainer,
  YAxis,
  CartesianGrid,
} from "recharts";
import { useQuerySoroswapTVLChart } from "../hooks/soroswap";
import LoadingSkeleton from "./loading-skeleton";
import { xAxisChartFormatter } from "../utils/x-axis-chart-formatter";
import { formatNumberToToken } from "../utils/utils";

import ChartTooltip from "./chart-tooltip";
import { TvlChartData } from "types/pools";

interface Props {
  data: TvlChartData[];
  isLoading: boolean;
}

const TVLChart = (props: Props) => {
  return (
    <LoadingSkeleton isLoading={props.isLoading} width="100%" height={300}>
      <ResponsiveContainer
        width="100%"
        height="100%"
        minHeight={300}
        style={{ paddingLeft: 5 }}
      >
        <AreaChart
          width={500}
          height={300}
          data={props.data ?? []}
          margin={{
            top: 0,
            right: 0,
            left: 0,
            bottom: 0,
          }}
        >
          <CartesianGrid stroke="#1b1b1b" />

          <XAxis
            dataKey="date"
            tickFormatter={(tick) => xAxisChartFormatter(tick)}
          />
          <YAxis
            tickFormatter={(amount) => formatNumberToToken(amount as number)}
          />
          <Tooltip
            formatter={(amount) => formatNumberToToken(amount as number)}
            content={ChartTooltip}
          />
          <Area
            type="monotone"
            dataKey="tvl"
            stroke="#8866DD"
            strokeWidth="3px"
            fill="#221E2B"
          />
        </AreaChart>
      </ResponsiveContainer>
    </LoadingSkeleton>
  );
};

export default TVLChart;
