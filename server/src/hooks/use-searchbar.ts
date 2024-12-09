import { TokenType } from "../types/tokens";
import { useEffect, useRef, useState } from "react";
import { useQueryPools } from "./pools";
import { useQueryTokens } from "./tokens";
import useBoolean from "./use-boolean";

const useSearchbar = () => {
  const pools = useQueryPools();
  const tokens = useQueryTokens();

  const [maxTokens, setMaxTokens] = useState(3);
  const [maxPools, setMaxPools] = useState(3);

  const [searchTerm, setSearchTerm] = useState("");

  const listboxRef = useRef<HTMLDivElement>(null);

  const isListboxVisible = useBoolean();

  const shouldShowListBox = isListboxVisible.value;

  const handleViewMoreTokens = () => {
    setMaxTokens(maxTokens + 3);
  };

  const handleViewMorePools = () => {
    setMaxPools(maxPools + 3);
  };

  const shouldFilterToken = (token: TokenType) => {
    const codeStartWithSearchTerm = token.code
      .toLowerCase()
      .startsWith(searchTerm.toLowerCase());
    const nameStartWithSearchTerm = token.name
      ?.toLowerCase()
      .startsWith(searchTerm.toLowerCase());
    const contractStartWithSearchTerm = token.contract
      .toLowerCase()
      .startsWith(searchTerm.toLowerCase());

    return (
      codeStartWithSearchTerm ||
      nameStartWithSearchTerm ||
      contractStartWithSearchTerm
    );
  };

  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        listboxRef.current &&
        !listboxRef.current.contains(event.target as Node)
      ) {
        isListboxVisible.setFalse();
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => {
      document.removeEventListener("mousedown", handleClickOutside);
    };
  }, []);

  const filteredTokens = tokens.data?.filter((token) => {
    if (!searchTerm || searchTerm.trim() === "") return true;

    return shouldFilterToken(token.asset);
  });

  const filteredPools = pools.data?.filter((pool) => {
    if (!searchTerm || searchTerm.trim() === "") return true;

    const poolStartWithSearchTerm = pool.address
      .toLowerCase()
      .startsWith(searchTerm.toLowerCase());

    return (
      shouldFilterToken(pool.tokenA) ||
      shouldFilterToken(pool.tokenB) ||
      poolStartWithSearchTerm
    );
  });

  const tokensData = filteredTokens?.slice(0, maxTokens);
  const poolsData = filteredPools?.slice(0, maxPools);

  const shouldShowViewMoreTokens =
    tokensData &&
    tokensData?.length !== filteredTokens?.length &&
    tokensData?.length > 0;

  const shouldShowViewMorePools =
    poolsData &&
    poolsData?.length !== filteredPools?.length &&
    poolsData?.length > 0;

  return {
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
  };
};

export default useSearchbar;
