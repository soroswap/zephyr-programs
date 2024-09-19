import { ApiNetwork } from "../types/network";
import axiosInstance from "./axios";

export const fetchXLMPrice = async (args: ApiNetwork) => {
  const { data } = await axiosInstance.get("/api/xlm-price", {
    params: { network: args.network },
  });
  return data;
};
