import { Box, Typography } from "soroswap-ui";
import { useQueryPools } from "../../src/hooks/pools";
import Layout from "../../src/components/layout/layout";
import PoolsTable from "../../src/components/pools-table/pools-table";
import useSavedPools from "../../src/hooks/use-saved-pools";

const PoolsPage = () => {
  const { savedPools } = useSavedPools();
  const pools = useQueryPools();
  return (
    <Layout>
      <Box>
        <Typography variant="h6" sx={{ mb: 1 }}>
          Your Watchlist
        </Typography>
        <PoolsTable
          rows={savedPools ?? []}
          emptyMessage="Saved pools will appear here"
        />
      </Box>
      <Box sx={{ mt: 4 }}>
        <Typography variant="h6" sx={{ mb: 1 }}>
          All Pools
        </Typography>
        <PoolsTable rows={pools.data ?? []} isLoading={pools.isLoading} />
      </Box>
    </Layout>
  );
};

export default PoolsPage;
