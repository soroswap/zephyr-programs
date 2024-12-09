import { Skeleton, SkeletonTypeMap } from "soroswap-ui";
import React from "react";

interface Props {
  isLoading: boolean;
  children: React.ReactNode;
  width?: number | string;
  height?: number;
  variant?: SkeletonTypeMap["props"]["variant"];
  [key: string]: any;
}

const LoadingSkeleton = ({
  isLoading,
  children,
  width = 200,
  height = 30,
  variant = "rounded",
  ...rest
}: Props) => {
  if (isLoading) {
    return (
      <Skeleton width={width} height={height} variant={variant} {...rest} />
    );
  }
  return children;
};

export default LoadingSkeleton;
