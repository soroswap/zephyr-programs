import axiosInstance from "services/axios";
import { ApiNetwork } from "types/network";
export interface ZephyrTables {
  soroswap_events: string;
  soroswap_pairs: string;
  soroswap_rsv_ch: string;
  phoenix_pairs: string;
  aqua_pairs: string;
  soroswap_providers:string;
}

const parseZephyrAddress = (address: string) => {
  const zephyrRegex = /^zephyr_[a-f0-9]{32}$/;
  if(zephyrRegex.test(address)) {
    const newAddress = address.replace('zephyr_', '');
    const segments = newAddress.match(/[A-Za-z]+|[0-9]+/g);
    const capitalizedSegments = segments?.map(segment => segment.charAt(0).toUpperCase() + segment.slice(1));
    const capitalizedAddress = capitalizedSegments?.join('');
    const prefixAddress = `allZephyr${capitalizedAddress}`;
    let parsedZephyrAddress = prefixAddress;
    const lastCharacter = parsedZephyrAddress.charAt(parsedZephyrAddress.length - 1);
    if (isNaN(Number(lastCharacter))) {
      parsedZephyrAddress += 's';
    } else {
      parsedZephyrAddress += 'S';
    }
    return parsedZephyrAddress;
  } else {
    console.log('Not a zephyr address');
    return '';
  }
}

export const fetchZephyrTables = async ({ network }: ApiNetwork) => {
  const parsedNetwork = network.toLowerCase();
  const { data } = await axiosInstance.get(
    `https://raw.githubusercontent.com/soroswap/zephyr-programs/main/public/${parsedNetwork}.zephyr-tables.json`
  );
  const response: ZephyrTables = {
    soroswap_events: parseZephyrAddress(data.soroswap_events),
    soroswap_pairs: parseZephyrAddress(data.soroswap_pairs),
    soroswap_rsv_ch: parseZephyrAddress(data.soroswap_rsv_ch),
    phoenix_pairs: parseZephyrAddress(data.phoenix_pairs),
    aqua_pairs: parseZephyrAddress(data.aqua_pairs),
    soroswap_providers: parseZephyrAddress(data.soroswap_providers),
  };
  return response;
}
