import { useEffect, useState } from "react";
import { useQueryPools } from "./pools";

const key = "savedPoolsIds";

const useSavedPools = () => {
  const pools = useQueryPools();
  const [savedPoolsIds, setSavedPoolsIds] = useState<string[]>([]);
  const savedPools = pools.data?.filter((row) =>
    savedPoolsIds.includes(row.address)
  );

  useEffect(() => {
    const savedPoolsIds = localStorage.getItem(key) || "[]";
    const parsedSavedPoolsIds = JSON.parse(savedPoolsIds);
    setSavedPoolsIds(parsedSavedPoolsIds);
  }, []);

  const handleSavePool = (id: string) => {
    if (savedPoolsIds.includes(id)) {
      const newSavedPoolsIds = savedPoolsIds.filter((poolId) => poolId !== id);
      localStorage.setItem(key, JSON.stringify(newSavedPoolsIds));
      setSavedPoolsIds(newSavedPoolsIds);
    } else {
      const newSavedPoolsIds = [...savedPoolsIds, id];
      localStorage.setItem(key, JSON.stringify(newSavedPoolsIds));
      setSavedPoolsIds(newSavedPoolsIds);
    }
  };

  const isPoolSaved = (id: string) => {
    return savedPoolsIds.includes(id);
  };

  return { savedPools, savedPoolsIds, handleSavePool, isPoolSaved };
};

export default useSavedPools;
