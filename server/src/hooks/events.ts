import { fetchAllEvents } from "../services/events";
import { RouterEventType } from "../types/router-events";
import { useQuery } from "@tanstack/react-query";
import useQueryNetwork from "./use-query-network";

const key = "events";

export const useQueryAllEvents = ({
  type,
  address,
}: {
  type?: RouterEventType;
  address?: string;
}) => {
  const { network, isValidQuery } = useQueryNetwork();

  return useQuery({
    queryKey: [key, network, type, address],
    queryFn: () => fetchAllEvents({ type, address, network: network! }),
    enabled: isValidQuery,
  });
};
