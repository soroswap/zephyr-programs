import React, { useEffect } from "react";

const useBoolean = (defaultValue: boolean = false) => {
  const [value, setValue] = React.useState(defaultValue);
  const toggle = () => setValue((v) => !v);
  const setTrue = () => setValue(true);
  const setFalse = () => setValue(false);

  useEffect(() => {
    setValue(defaultValue);
  }, [defaultValue]);

  return { value, toggle, setTrue, setFalse };
};

export default useBoolean;
