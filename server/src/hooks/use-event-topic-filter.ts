import React from "react";
import { RouterEventType } from "../types/router-events";

export interface UseEventTopicFilterReturnProps {
  currentFilter: "All" | RouterEventType;
  setCurrentFilter: React.Dispatch<
    React.SetStateAction<"All" | RouterEventType>
  >;
  topic: RouterEventType | undefined;
}

const useEventTopicFilter = (): UseEventTopicFilterReturnProps => {
  const [currentFilter, setCurrentFilter] = React.useState<
    "All" | RouterEventType
  >("All");

  const topic: RouterEventType | undefined =
    currentFilter === "All"
      ? undefined
      : (currentFilter.toLowerCase() as RouterEventType);

  return { currentFilter, setCurrentFilter, topic };
};

export default useEventTopicFilter;
