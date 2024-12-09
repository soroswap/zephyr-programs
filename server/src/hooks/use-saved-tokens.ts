import { useEffect, useState } from "react";
import { useQueryTokens } from "./tokens";

const key = "savedTokensIds";

const useSavedTokens = () => {
  const tokens = useQueryTokens();

  const [savedTokensIds, setSavedTokensIds] = useState<string[]>([]);
  const savedTokens = tokens.data?.filter((row) =>
    savedTokensIds.includes(row.asset.contract)
  );

  useEffect(() => {
    const savedTokensIds = localStorage.getItem(key) || "[]";
    const parsedSavedTokensIds = JSON.parse(savedTokensIds);
    setSavedTokensIds(parsedSavedTokensIds);
  }, []);

  const handleSaveToken = (id: string) => {
    if (savedTokensIds.includes(id)) {
      const newSavedTokensIds = savedTokensIds.filter(
        (poolId) => poolId !== id
      );
      localStorage.setItem(key, JSON.stringify(newSavedTokensIds));
      setSavedTokensIds(newSavedTokensIds);
    } else {
      const newSavedTokensIds = [...savedTokensIds, id];
      localStorage.setItem(key, JSON.stringify(newSavedTokensIds));
      setSavedTokensIds(newSavedTokensIds);
    }
  };

  const isTokenSaved = (id: string) => {
    return savedTokensIds.includes(id);
  };

  return { savedTokens, savedTokensIds, handleSaveToken, isTokenSaved };
};

export default useSavedTokens;
