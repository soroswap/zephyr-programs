import { Box, Button, Tab, Tabs } from "soroswap-ui";
import { useTheme } from "soroswap-ui";
import React from "react";

interface Props {
  tabs: { label: string; value: string }[];
  value: string;
  handleChange: (value: any) => void;
}

const ChartSwitcher = ({ tabs, value, handleChange }: Props) => {
  const theme = useTheme();
  return (
    <Box
      display="flex"
      gap="12px"
      bgcolor="#1b1b1b"
      padding="4px 10px"
      borderRadius="30px"
      fontSize={12}
    >
      {tabs.map((tab) => (
        <Box
          key={tab.value}
          onClick={() => handleChange(tab.value)}
          sx={{
            fontWeight: 500,
            cursor: "pointer",
            bgcolor:
              value === tab.value
                ? theme.palette.customBackground.accentAction
                : "",
            color: "white",
            padding: "4px 16px",
            borderRadius: "30px",
          }}
        >
          {tab.label}
        </Box>
      ))}
    </Box>
  );
};

export default ChartSwitcher;
