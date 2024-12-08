import { Box, Chip, Grid, Typography } from "soroswap-ui";
import { GetApp, Share, Star, StarBorderOutlined } from "@mui/icons-material";
import { useQueryPool } from "../../../src/hooks/pools";
import { useRouter } from "next/router";
import AppBreadcrumbs from "../../../src/components/app-breadcrumbs";
import Layout from "../../../src/components/layout/layout";
import Link from "next/link";
import LoadingSkeleton from "../../../src/components/loading-skeleton";
import PoolChart from "../../../src/components/pool-chart";
import Token from "../../../src/components/token";
import useSavedPools from "../../../src/hooks/use-saved-pools";
import {
  formatNumberToMoney,
  formatNumberToToken,
  formatTokenAmount,
  getExpectedAmountOfOne,
  getSoroswapAddLiquidityUrl,
  getSoroswapSwapUrl,
  shortenAddress,
} from "../../../src/utils/utils";
import { useQueryAllEvents } from "../../../src/hooks/events";
import useEventTopicFilter from "../../../src/hooks/use-event-topic-filter";
import TransactionsTable from "../../../src/components/transaction-table/transactions-table";
import { StyledCard } from "components/styled/card";
import { PrimaryButton, SecondaryButton } from "components/styled/button";
import { Text } from "components/styled/text";
import Tabs from "components/tabs";
import { Row } from "components/styled/row";
import { SearchInput } from "components/styled/search-input";
import RenderIf from "components/render-if";
import TokensTable from "components/tokens-table/tokens-table";
import { useQueryTokens } from "hooks/tokens";
import { useState } from "react";
import { shouldFilterEvent, shouldFilterToken } from "utils/filters";

const PoolPage = () => {
  const router = useRouter();
  const { id } = router.query;

  const { handleSavePool, isPoolSaved } = useSavedPools();

  const eventsFilter = useEventTopicFilter();

  const events = useQueryAllEvents({
    address: id as string,
    type: eventsFilter.topic,
  });

  const tokens = useQueryTokens();

  const pool = useQueryPool({ poolAddress: id as string });

  const token0 = pool.data?.tokenA;
  const token1 = pool.data?.tokenB;

  if (token0?.code == token0?.contract && token0) {
    token0.code = shortenAddress(token0?.contract);
  }
  if (token1?.code == token1?.contract && token1) {
    token1.code = shortenAddress(token1?.contract);
  }
  const token0code = token0?.code ?? "";
  const token1code = token1?.code ?? "";

  const StarIcon = isPoolSaved(id as string) ? Star : StarBorderOutlined;

  const [searchValue, setSearchValue] = useState("");

  const filteredTokens = tokens.data?.filter((token) => {
    return (
      (shouldFilterToken(token.asset, token0?.contract) ||
        shouldFilterToken(token.asset, token1?.contract)) &&
      shouldFilterToken(token.asset, searchValue)
    );
  });

  const filteredEvents = events.data?.filter((event) => {
    return shouldFilterEvent(event, searchValue);
  });

  return (
    <Layout>
      <Box display="flex" justifyContent="space-between">
        <AppBreadcrumbs
          breadcrumbs={[
            {
              label: "Home",
              href: "/",
            },
            {
              label: "Pools",
              href: "/pools",
            },
            {
              label: `${token0code}/${token1code}`,
            },
          ]}
        />
        <Box display="flex" alignItems="center" gap="12px">
          <Box
            display="flex"
            border="1px solid white"
            borderRadius="8px"
            p="8px"
            sx={{
              ":hover": {
                cursor: "pointer",
                opacity: 0.8,
              },
            }}
            onClick={() => handleSavePool(id as string)}
          >
            <StarIcon
              sx={{
                height: "20px",
              }}
            />
          </Box>
          <Box
            display="flex"
            border="1px solid white"
            borderRadius="8px"
            p="8px"
            sx={{
              ":hover": {
                cursor: "pointer",
                opacity: 0.8,
              },
            }}
          >
            <Share
              fontSize="small"
              sx={{
                height: "20px",
              }}
            />
          </Box>
        </Box>
      </Box>
      <Box display="flex" alignItems="center" gap="6px" mt={4}>
        <Token imageUrl={token0?.icon} />
        <Token imageUrl={token1?.icon} />
        <Typography variant="h5">
          {token0code}/{token1code}
        </Typography>
        <Chip label="0.3%" sx={{ fontSize: 14, bgcolor: "#1b1b1b" }} />
      </Box>
      <Box
        display="flex"
        justifyContent="space-between"
        alignItems="center"
        flexWrap="wrap"
        gap={2}
        mt={2}
      >
        <Box display="flex" gap="8px" flexWrap="wrap">
          <LoadingSkeleton isLoading={pool.isLoading}>
            <Chip
              sx={{
                ":hover": {
                  opacity: 0.8,
                },
                fontSize: 16,
                bgcolor: "#1b1b1b",
              }}
              label={
                <Link
                  href={`/tokens/${token0?.contract}?network=${router.query.network}`}
                >
                  <Box display="flex" alignItems="center" gap="4px">
                    <Token imageUrl={token0?.icon} width={20} height={20} />1{" "}
                    {token0code} ={" "}
                    {getExpectedAmountOfOne(
                      pool.data?.reserveA,
                      pool.data?.reserveB
                    )}{" "}
                    {token1code}
                  </Box>
                </Link>
              }
            />
          </LoadingSkeleton>
          <LoadingSkeleton isLoading={pool.isLoading}>
            <Chip
              sx={{
                ":hover": {
                  opacity: 0.8,
                },
                fontSize: 16,
                bgcolor: "#1b1b1b",
              }}
              label={
                <Link
                  href={`/tokens/${token1?.contract}?network=${router.query.network}`}
                >
                  <Box display="flex" alignItems="center" gap="4px">
                    <Token imageUrl={token1?.icon} width={20} height={20} />1{" "}
                    {token1code} ={" "}
                    {getExpectedAmountOfOne(
                      pool.data?.reserveB,
                      pool.data?.reserveA
                    )}{" "}
                    {token0code}
                  </Box>
                </Link>
              }
            />
          </LoadingSkeleton>
        </Box>
        <Box display="flex" gap="8px">
          <LoadingSkeleton isLoading={pool.isLoading} height={36.5} width={100}>
            <a
              href={getSoroswapAddLiquidityUrl(
                token0?.contract,
                token1?.contract
              )}
              target="_blank"
            >
              <SecondaryButton variant="contained" endIcon={<GetApp />}>
                Add Liquidity
              </SecondaryButton>
            </a>
          </LoadingSkeleton>
          <LoadingSkeleton isLoading={pool.isLoading} height={36.5} width={100}>
            <a
              href={getSoroswapSwapUrl(token0?.contract, token1?.contract)}
              target="_blank"
            >
              <PrimaryButton variant="contained">Trade</PrimaryButton>
            </a>
          </LoadingSkeleton>
        </Box>
      </Box>
      <Grid container spacing={2} mt={2}>
        <Grid item xs={12} md={4}>
          <StyledCard p={2} bgcolor="#1b1b1b" mb={2}>
            <Typography>Total tokens locked</Typography>
            <Box display="flex" justifyContent="space-between" mt={1}>
              <LoadingSkeleton
                isLoading={pool.isLoading}
                variant="text"
                height={20}
              >
                <Text display="flex" gap="4px" alignItems="center">
                  <Token imageUrl={token0?.icon} width={20} height={20} />
                  {token0code}
                </Text>
                <Text>
                  {formatTokenAmount(
                    pool.data?.reserveA,
                    pool.data?.tokenA?.decimals,
                    "token"
                  )}
                </Text>
              </LoadingSkeleton>
            </Box>
            <Box display="flex" justifyContent="space-between" mt={1}>
              <LoadingSkeleton
                isLoading={pool.isLoading}
                variant="text"
                height={20}
              >
                <Text display="flex" gap="4px" alignItems="center">
                  <Token imageUrl={token1?.icon} width={20} height={20} />
                  {token1code}
                </Text>
                <Text>
                  {formatTokenAmount(
                    pool.data?.reserveB,
                    pool.data?.tokenB?.decimals,
                    "token"
                  )}
                </Text>
              </LoadingSkeleton>
            </Box>
          </StyledCard>

          <StyledCard sx={{ p: 2 }}>
            <Box mt={2}>
              <Text>TVL</Text>
              <LoadingSkeleton isLoading={pool.isLoading} variant="text">
                <Typography variant="h6">
                  {formatNumberToMoney(pool.data?.tvl)}
                </Typography>
              </LoadingSkeleton>
            </Box>
            <Box mt={2}>
              <Text>Volume 24h</Text>
              <LoadingSkeleton isLoading={pool.isLoading} variant="text">
                <Typography variant="h6">
                  {formatNumberToMoney(pool.data?.volume24h)}
                </Typography>
              </LoadingSkeleton>
            </Box>
            <Box mt={2}>
              <Text>24h Fees</Text>
              <LoadingSkeleton isLoading={pool.isLoading} variant="text">
                <Typography variant="h6">
                  {formatNumberToToken(pool.data?.fees24h)}
                </Typography>
              </LoadingSkeleton>
            </Box>
          </StyledCard>
        </Grid>
        <Grid item xs={12} md={8}>
          <StyledCard sx={{ height: 410 }}>
            <PoolChart
              poolAddress={id as string}
              tvlChartData={pool.data?.tvlChartData}
              volumeChartData={pool.data?.volumeChartData}
              feesChartData={pool.data?.feesChartData}
              isLoading={pool.isLoading}
            />
          </StyledCard>
        </Grid>
      </Grid>
      <Box mt={8}>
        <Tabs
          items={["Transactions"]}
          endContent={(selected) => (
            <Row gap="8px">
              <SearchInput
                placeholder={`Search for ${selected.toLowerCase()}`}
                value={searchValue}
                onChange={(e) => setSearchValue(e.target.value)}
              />
            </Row>
          )}
        >
          {(selected) => (
            <Box mt={2}>
              <RenderIf isTrue={selected === "Transactions"}>
                <TransactionsTable
                  rows={filteredEvents ?? []}
                  isLoading={events.isLoading}
                  filters={eventsFilter}
                />
              </RenderIf>
            </Box>
          )}
        </Tabs>
      </Box>
    </Layout>
  );
};

export default PoolPage;
