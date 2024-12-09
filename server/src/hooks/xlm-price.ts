import { fetchXLMPrice } from "../services/xlm-price";
import { useQuery } from "@tanstack/react-query";
import useQueryNetwork from "./use-query-network";

const key = "xlm-price";

export const useQueryXLMPrice = () => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network],
    queryFn: () => fetchXLMPrice({ network: network! }),
    enabled: isValidQuery,
  });
};
