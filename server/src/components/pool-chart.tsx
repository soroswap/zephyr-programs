import { Box, Typography } from "soroswap-ui";
import {
  AreaChart,
  Area,
  XAxis,
  Tooltip,
  ResponsiveContainer,
  BarChart,
  Bar,
} from "recharts";
import ChartSwitcher from "./chart-switcher";
import React from "react";
import RenderIf from "./render-if";
import {
  useQueryPoolFeesChart,
  useQueryPoolTVLChart,
  useQueryPoolVolumeChart,
} from "../hooks/pools";
import LoadingSkeleton from "./loading-skeleton";
import { xAxisChartFormatter } from "../utils/x-axis-chart-formatter";
import { formatNumberToToken } from "../utils/utils";
import ChartTooltip from "./chart-tooltip";
import { FeesChartData, TvlChartData, VolumeChartData } from "types/pools";

type Charts = "volume" | "liquidity" | "fees";

const PoolChart = ({
  poolAddress,
  tvlChartData,
  volumeChartData,
  feesChartData,
  isLoading,
}: {
  poolAddress: string;
  tvlChartData: TvlChartData[] | undefined;
  volumeChartData: VolumeChartData[] | undefined;
  feesChartData: FeesChartData[] | undefined;
  isLoading: boolean;
}) => {
  const [value, setValue] = React.useState<Charts>("volume");

  const handleChange = (newValue: Charts) => {
    setValue(newValue);
  };

  const getAvailableTabs = () => {
    const availableTabs: any[] = [];

    if (isLoading) return availableTabs;

    if (volumeChartData) {
      availableTabs.push({
        label: "Volume",
        value: "volume",
      });
    }
    if (tvlChartData) {
      availableTabs.push({
        label: "Liquidity",
        value: "liquidity",
      });
    }
    if (feesChartData) {
      availableTabs.push({
        label: "Fees",
        value: "fees",
      });
    }
    return availableTabs;
  };
  return (
    <Box sx={{ py: 2 }}>
      <Box
        display="flex"
        justifyContent="flex-end"
        px={2}
        alignItems="center"
        mb={2}
      >
        <ChartSwitcher
          value={value}
          handleChange={handleChange}
          tabs={getAvailableTabs()}
        />
      </Box>
      <RenderIf isTrue={value === "volume"}>
        <LoadingSkeleton width="100%" isLoading={isLoading} height={320}>
          <ResponsiveContainer width="100%" height="100%" minHeight={320}>
            <AreaChart
              width={500}
              height={400}
              data={volumeChartData ?? []}
              margin={{
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
              }}
            >
              <XAxis
                dataKey="date"
                tickFormatter={(tick) => xAxisChartFormatter(tick)}
              />
              <Tooltip
                formatter={(amount) => formatNumberToToken(amount as number)}
                content={ChartTooltip}
              />
              <Area
                type="monotone"
                dataKey="volume"
                stroke="#8866DD"
                strokeWidth="3px"
                fill="#221E2B"
              />
            </AreaChart>
          </ResponsiveContainer>
        </LoadingSkeleton>
      </RenderIf>
      <RenderIf isTrue={value === "liquidity"}>
        <LoadingSkeleton width="100%" isLoading={isLoading} height={320}>
          <ResponsiveContainer width="100%" height="100%" minHeight={320}>
            <AreaChart
              width={500}
              height={300}
              data={tvlChartData ?? []}
              margin={{
                top: 5,
                right: 30,
                left: 20,
                bottom: 5,
              }}
            >
              <XAxis
                dataKey="date"
                tickFormatter={(tick) => xAxisChartFormatter(tick)}
              />
              <Tooltip
                formatter={(amount) => formatNumberToToken(amount as number)}
                content={ChartTooltip}
              />
              <Area
                dataKey="tvl"
                stroke="#8866DD"
                strokeWidth="3px"
                fill="#221E2B"
              />
            </AreaChart>
          </ResponsiveContainer>
        </LoadingSkeleton>
      </RenderIf>
      <RenderIf isTrue={value === "fees"}>
        <LoadingSkeleton width="100%" isLoading={isLoading} height={320}>
          <ResponsiveContainer width="100%" height="100%" minHeight={320}>
            <AreaChart
              width={500}
              height={400}
              data={feesChartData ?? []}
              margin={{
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
              }}
            >
              <XAxis
                dataKey="date"
                tickFormatter={(tick) => xAxisChartFormatter(tick)}
              />
              <Tooltip
                formatter={(amount) => formatNumberToToken(amount as number)}
                content={ChartTooltip}
              />
              <Area
                type="monotone"
                dataKey="fees"
                stroke="#8866DD"
                strokeWidth="3px"
                fill="#221E2B"
              />
            </AreaChart>
          </ResponsiveContainer>
        </LoadingSkeleton>
      </RenderIf>
    </Box>
  );
};

export default PoolChart;
