import React from "react";

interface Props {
  isTrue: boolean;
  children: React.ReactNode;
}

const RenderIf = ({ isTrue, children }: Props) => {
  return <>{isTrue ? children : null}</>;
};

export default RenderIf;
