import { ApiNetwork } from "types/network";
import {
  RouterEventType,
  RouterEventsAPIResponse,
} from "../types/router-events";
import axiosInstance from "./axios";

interface FetchAllEventsProps extends ApiNetwork {
  type?: RouterEventType;
  address?: string;
}

export const fetchAllEvents = async ({
  type,
  address,
  network,
}: FetchAllEventsProps) => {
  const { data } = await axiosInstance.get<RouterEventsAPIResponse>(
    `/api/events`,
    {
      params: { type, address, network },
    }
  );

  return data;
};
