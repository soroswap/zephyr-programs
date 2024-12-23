import { useQuery } from "@tanstack/react-query";
import {
  fetchToken,
  fetchTokenPriceChart,
  fetchTokenTVLChart,
  fetchTokenVolumeChart,
  fetchTokens,
} from "../services/tokens";
import useQueryNetwork from "./use-query-network";

const key = "tokens";

export const useQueryTokens = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network],
    queryFn: () => fetchTokens({ network: network! }),
    enabled: isValidQuery,
  });
};

export const useQueryToken = ({ tokenAddress }: { tokenAddress: string }) => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, tokenAddress],
    queryFn: () => fetchToken({ tokenAddress, network: network! }),
    enabled: !!tokenAddress && isValidQuery,
  });
};

export const useQueryTokenTVLChart = ({
  tokenAddress,
}: {
  tokenAddress: string;
}) => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, tokenAddress, "tvl-chart"],
    queryFn: () => fetchTokenTVLChart({ tokenAddress }),
    enabled: !!tokenAddress && isValidQuery,
  });
};

export const useQueryTokenPriceChart = ({
  tokenAddress,
}: {
  tokenAddress: string;
}) => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, tokenAddress, "price-chart"],
    queryFn: () => fetchTokenPriceChart({ tokenAddress }),
    enabled: !!tokenAddress && isValidQuery,
  });
};

export const useQueryTokenVolumeChart = ({
  tokenAddress,
}: {
  tokenAddress: string;
}) => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, tokenAddress, "volume-chart"],
    queryFn: () => fetchTokenVolumeChart({ tokenAddress }),
    enabled: !!tokenAddress && isValidQuery,
  });
};
