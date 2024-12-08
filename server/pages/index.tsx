import { Box, Grid, Typography } from "soroswap-ui";
import Head from "next/head";
import Layout from "../src/components/layout/layout";
import PoolsTable from "../src/components/pools-table/pools-table";
import TokensTable from "../src/components/tokens-table/tokens-table";
import TVLChart from "../src/components/tvl-chart";
import { useQueryPools } from "../src/hooks/pools";
import { useQueryTokens } from "../src/hooks/tokens";
import TransactionsTable from "../src/components/transaction-table/transactions-table";
import { useQueryAllEvents } from "../src/hooks/events";
import useEventTopicFilter from "../src/hooks/use-event-topic-filter";
import Tabs from "components/tabs";
import RenderIf from "components/render-if";
import { PrimaryButton } from "components/styled/button";
import { Row } from "components/styled/row";
import { useState } from "react";
import { SearchInput } from "components/styled/search-input";
import {
  shouldFilterEvent,
  shouldFilterPool,
  shouldFilterToken,
} from "utils/filters";
import { useRouter } from "next/router";
import { StyledCard } from "components/styled/card";
import LoadingSkeleton from "components/loading-skeleton";
import { formatNumberToMoney } from "utils/utils";

export default function Home() {
  const pools = useQueryPools();
  const tokens = useQueryTokens();

  const router = useRouter();

  const eventsFilters = useEventTopicFilter();
  const events = useQueryAllEvents({ type: eventsFilters.topic });

  const [searchValue, setSearchValue] = useState("");

  const filteredTokens = tokens.data?.filter((token) =>
    shouldFilterToken(token.asset, searchValue)
  );

  const filteredPools = pools.data?.filter((pool) =>
    shouldFilterPool(pool, searchValue)
  );

  const filteredEvents = events.data?.filter((event) =>
    shouldFilterEvent(event, searchValue)
  );

  const soroswapTvl = pools?.data?.reduce((acc, pool) => {
    return acc + (pool.tvl || 0);
  }, 0);

  // const getSoroswapTvlChartData = () => {
  //   const tvlChartData: { [x: string]: { tvl: number; date: string } } = {};

  //   pools.data?.forEach((pool) => {
  //     pool.tvlChartData?.forEach((data) => {
  //       tvlChartData[data.date] = {
  //         tvl: (tvlChartData?.[data?.date]?.tvl || 0) + data.tvl,
  //         date: data.date,
  //       };
  //     });
  //   });

  //   const result = Object.keys(tvlChartData).map((key) => ({
  //     date: tvlChartData[key].date,
  //     tvl: tvlChartData[key].tvl,
  //   }));

  //   const orderbyDate = result.sort((a, b) => {
  //     return new Date(a.date).getTime() - new Date(b.date).getTime();
  //   });

  //   return orderbyDate;
  // };

  return (
    <>
      <Head>
        <title>Soroswap Info</title>
      </Head>
      <Layout>
        <Typography variant="h6" sx={{ mb: 1 }}></Typography>
        <Grid container spacing={4}>
          <Grid item xs={12} md={12}>
            <StyledCard sx={{ maxWidth: 1184, p: "32px" }}>
              <Box
                display="flex"
                justifyContent="space-between"
                alignItems="center"
                mb={4}
              >
                <Box>
                  <Typography fontSize="20px" fontWeight={600}>
                    TVL
                  </Typography>
                </Box>
                <Box>
                  <LoadingSkeleton isLoading={pools.isLoading} height={20}>
                    <Typography fontWeight={600} fontSize="28px">
                      {formatNumberToMoney(soroswapTvl)}
                    </Typography>
                    {/* <PercentageChanged percentage={40.2} sx={{ fontWeight: 600 }} /> */}
                  </LoadingSkeleton>
                </Box>
              </Box>
              {/* <TVLChart
                data={getSoroswapTvlChartData() ?? []}
                isLoading={pools.isLoading}
              /> */}
            </StyledCard>
          </Grid>
          {/*           <Grid item xs={12} md={6}>
            <VolumeChart />
          </Grid> */}
        </Grid>
        <Box sx={{ mt: 8 }}>
          <Tabs
            items={["Tokens", "Pools", "Transactions"]}
            endContent={(selected) => (
              <Row gap="8px">
                <SearchInput
                  placeholder={`Search for ${selected.toLowerCase()}`}
                  value={searchValue}
                  onChange={(e) => setSearchValue(e.target.value)}
                />
                <RenderIf isTrue={["Tokens", "Pools"].includes(selected)}>
                  <PrimaryButton
                    variant="outlined"
                    onClick={() => {
                      router.push(`/${selected.toLowerCase()}`, {
                        query: {
                          network: router.query.network,
                        },
                      });
                    }}
                  >
                    All {selected}
                  </PrimaryButton>
                </RenderIf>
              </Row>
            )}
          >
            {(selected) => (
              <Box mt={2}>
                <RenderIf isTrue={selected === "Tokens"}>
                  <TokensTable
                    rows={filteredTokens ?? []}
                    isLoading={tokens.isLoading}
                  />
                </RenderIf>
                <RenderIf isTrue={selected === "Pools"}>
                  <PoolsTable
                    rows={filteredPools ?? []}
                    isLoading={pools.isLoading}
                  />
                </RenderIf>
                <RenderIf isTrue={selected === "Transactions"}>
                  <TransactionsTable
                    rows={filteredEvents ?? []}
                    isLoading={events.isLoading}
                    filters={eventsFilters}
                  />
                </RenderIf>
              </Box>
            )}
          </Tabs>
        </Box>
      </Layout>
    </>
  );
}
