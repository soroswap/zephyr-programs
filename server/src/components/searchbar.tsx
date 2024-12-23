import { Box, Input, Typography, useMediaQuery } from "soroswap-ui";
import { ReactNode } from "react";
import { shouldShortenCode } from "../utils/utils";
import { useRouter } from "next/router";
import LoadingSkeleton from "./loading-skeleton";
import TokenImage from "./token";
import useSearchbar from "../hooks/use-searchbar";

const ItemRow = ({
  children,
  href,
  ...rest
}: {
  children: ReactNode;
  href?: string;
  [x: string]: any;
}) => {
  return (
    <Box
      component={href ? "a" : "div"}
      href={href}
      display="flex"
      alignItems="center"
      gap={1}
      color="black"
      borderBottom="1px solid #00000014"
      p={1}
      sx={{
        ":hover": {
          cursor: "pointer",
          bgcolor: "#f5f5f5",
        },
      }}
      {...rest}
    >
      {children}
    </Box>
  );
};

const Searchbar = () => {
  const isMd = useMediaQuery("(max-width: 900px)");

  const router = useRouter();

  const {
    handleViewMorePools,
    handleViewMoreTokens,
    isListboxVisible,
    listboxRef,
    pools,
    poolsData,
    searchTerm,
    setSearchTerm,
    shouldShowListBox,
    shouldShowViewMorePools,
    shouldShowViewMoreTokens,
    tokens,
    tokensData,
  } = useSearchbar();

  return (
    <Box
      width="100%"
      maxWidth={isMd ? "100%" : 400}
      position="relative"
      ref={listboxRef}
    >
      <Input
        placeholder="Search pools or tokens"
        onChange={(e) => setSearchTerm(e.target.value)}
        value={searchTerm}
        onFocus={isListboxVisible.setTrue}
        sx={{
          bgcolor: "white",
          borderRadius: 5,
          px: 2,
          py: 0.5,
          width: "100%",
          maxWidth: isMd ? "100%" : 400,
        }}
      />
      {shouldShowListBox && (
        <Box position="absolute" width="100%">
          <Box
            p={1}
            bgcolor="white"
            borderRadius={2}
            marginTop={1}
            maxHeight={400}
            overflow="auto"
            border="1px solid #00000014"
          >
            <Box>
              <Typography
                variant="body1"
                color="black"
                p={1}
                borderBottom="1px solid #00000014"
                fontWeight={500}
              >
                Tokens
              </Typography>

              <LoadingSkeleton
                isLoading={tokens.isLoading}
                height={50}
                width="100%"
              >
                {tokensData?.length === 0 && (
                  <ItemRow>
                    <Typography variant="body2">No tokens found</Typography>
                  </ItemRow>
                )}

                {tokensData?.map((token) => (
                  <ItemRow
                    key={token.asset.code}
                    href={`/tokens/${token.asset.contract}?network=${router.query.network}`}
                  >
                    <TokenImage imageUrl={token.asset.icon} />
                    <Typography variant="body2">
                      {token.asset.code} - {token.asset.name}
                    </Typography>
                  </ItemRow>
                ))}

                {shouldShowViewMoreTokens && (
                  <ItemRow onClick={handleViewMoreTokens}>
                    <Typography variant="body2">View more...</Typography>
                  </ItemRow>
                )}
              </LoadingSkeleton>
            </Box>
            <Box>
              <Typography
                variant="body1"
                color="black"
                p={1}
                borderBottom="1px solid #00000014"
                fontWeight={500}
              >
                Pools
              </Typography>

              <LoadingSkeleton
                isLoading={pools.isLoading}
                height={50}
                width="100%"
              >
                {poolsData?.length === 0 && (
                  <ItemRow>
                    <Typography variant="body2">No pools found</Typography>
                  </ItemRow>
                )}

                {poolsData?.map((pool) => (
                  <ItemRow
                    key={pool.address}
                    href={`/pools/${pool.address}?network=${router.query.network}`}
                  >
                    <TokenImage imageUrl={pool.tokenA.icon} />
                    <TokenImage imageUrl={pool.tokenB.icon} />
                    <Typography variant="body2">
                      {shouldShortenCode(pool.tokenA.code)} /{" "}
                      {shouldShortenCode(pool.tokenB.code)}
                    </Typography>
                  </ItemRow>
                ))}

                {shouldShowViewMorePools && (
                  <ItemRow onClick={handleViewMorePools}>
                    <Typography variant="body2">View more...</Typography>
                  </ItemRow>
                )}
              </LoadingSkeleton>
            </Box>
          </Box>
        </Box>
      )}
    </Box>
  );
};

export default Searchbar;
