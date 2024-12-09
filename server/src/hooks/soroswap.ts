import { useQuery } from "@tanstack/react-query";
import {
  fetchSoroswapFees24h,
  fetchSoroswapTVL,
  fetchSoroswapTVLChart,
  fetchSoroswapVolume24h,
  fetchSoroswapVolumeChart,
} from "../services/soroswap";
import useQueryNetwork from "./use-query-network";

const key = "soroswap";

export const useQuerySoroswapTVL = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, "tvl"],
    queryFn: fetchSoroswapTVL,
    enabled: isValidQuery,
  });
};

export const useQuerySoroswapFees24h = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, "fees24h"],
    queryFn: fetchSoroswapFees24h,
    enabled: isValidQuery,
  });
};

export const useQuerySoroswapVolume24h = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, "volume24h"],
    queryFn: fetchSoroswapVolume24h,
    enabled: isValidQuery,
  });
};

export const useQuerySoroswapVolumeChart = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, "volume-chart"],
    queryFn: fetchSoroswapVolumeChart,
    enabled: isValidQuery,
  });
};

export const useQuerySoroswapTVLChart = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, "tvl-chart"],
    queryFn: fetchSoroswapTVLChart,
    enabled: isValidQuery,
  });
};
