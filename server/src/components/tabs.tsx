import React from "react";
import { Row } from "./styled/row";
import { Box, useMediaQuery } from "soroswap-ui";
import { useTheme } from "soroswap-ui";

interface Props {
  children: (selected: string) => React.ReactNode;
  endContent?: (selected: string) => React.ReactNode;
  items: string[];
}

const Tabs = ({ children, endContent, items }: Props) => {
  const [selected, setSelected] = React.useState(items[0]);

  const theme = useTheme();

  const isMobile = useMediaQuery(theme.breakpoints.down("sm"));

  return (
    <Box>
      <Row justifyContent="space-between" gap="16px" flexWrap="wrap">
        <Row gap="8px">
          {items.map((item, idx) => (
            <Box
              key={idx}
              bgcolor={selected === item ? "#1b1b1b" : "transparent"}
              color={selected === item ? "white" : "gray"}
              py={1}
              px={2}
              borderRadius="8px"
              sx={{ cursor: "pointer" }}
              onClick={() => setSelected(item)}
            >
              {item}
            </Box>
          ))}
        </Row>
        {!isMobile && <> {endContent?.(selected)}</>}
      </Row>
      {children(selected)}
    </Box>
  );
};

export default Tabs;
