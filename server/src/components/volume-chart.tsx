import { Box, Paper, Typography } from "soroswap-ui";
import { BarChart, Bar, XAxis, Tooltip, ResponsiveContainer } from "recharts";
import { useQuerySoroswapVolumeChart } from "../hooks/soroswap";
import LoadingSkeleton from "./loading-skeleton";
import { xAxisChartFormatter } from "../utils/x-axis-chart-formatter";

const VolumeChart = () => {
  const volumeChart = useQuerySoroswapVolumeChart();

  return (
    <Paper sx={{ maxWidth: 600, py: 2 }}>
      <Box
        display="flex"
        justifyContent="space-between"
        px={2}
        alignItems="center"
        mb={2}
      >
        <Box>
          <Typography variant="h5" fontWeight={600}>
            Volume
          </Typography>
        </Box>
      </Box>
      <LoadingSkeleton
        isLoading={volumeChart.isLoading}
        width="100%"
        height={300}
      >
        <ResponsiveContainer width="100%" height="100%" minHeight={300}>
          <BarChart
            width={500}
            height={200}
            data={volumeChart.data ?? []}
            margin={{
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
            }}
          >
            <Tooltip />
            <XAxis
              dataKey="date"
              tickFormatter={(tick) => xAxisChartFormatter(tick)}
            />
            <Bar dataKey="volume" fill="#8884d8" />
          </BarChart>
        </ResponsiveContainer>
      </LoadingSkeleton>
    </Paper>
  );
};

export default VolumeChart;
