import * as React from "react";
import { ExpandMore } from "@mui/icons-material";
import { Box } from "soroswap-ui";
import { Row } from "components/styled/row";
import { useRouter } from "next/router";
import useQueryNetwork from "hooks/use-query-network";
import { useTheme, MenuItem, Menu } from "soroswap-ui";

const capitalize = (s: string) => {
  if (typeof s !== "string") return "";
  return s.charAt(0).toUpperCase() + s.slice(1).toLowerCase();
};

export default function NetworkSelector() {
  const theme = useTheme();

  const router = useRouter();

  const { network } = useQueryNetwork();

  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
  const open = Boolean(anchorEl);
  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const onClickItem = (value: string) => {
    router.push({ query: { network: value } });
    handleClose();
  };

  return (
    <Box>
      <Box
        component="button"
        aria-controls={open ? "basic-menu" : undefined}
        aria-haspopup="true"
        aria-expanded={open ? "true" : undefined}
        onClick={handleClick}
        sx={{
          borderRadius: "8px",
          bgcolor: theme.palette.customBackground.accentAction,
          fontFamily: theme.typography.fontFamily,
          cursor: "pointer",
          border: 0,
          padding: "0px 16px",
          height: 40,
          width: 115,
          fontSize: "16px",
          fontWeight: 600,
        }}
      >
        <Row>
          {capitalize(network || "mainnet")}
          <ExpandMore />
        </Row>
      </Box>
      <Menu
        anchorEl={anchorEl}
        open={open}
        onClose={handleClose}
        disableScrollLock={true}
        MenuListProps={{
          sx: {
            width: anchorEl && anchorEl.offsetWidth,
            bgcolor: "#1b1b1b",
          },
        }}
      >
        <MenuItem onClick={() => onClickItem("mainnet")}>Mainnet</MenuItem>
        <MenuItem onClick={() => onClickItem("testnet")}>Testnet</MenuItem>
      </Menu>
    </Box>
  );
}
