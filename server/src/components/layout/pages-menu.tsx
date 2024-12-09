import { Box, Link } from "soroswap-ui";
import { Article, GitHub, Info, MoreHoriz } from "@mui/icons-material";
import * as React from "react";
import { FaDiscord } from "react-icons/fa";
import { useTheme, Menu, MenuItem } from "soroswap-ui";

export default function PagesMenu() {
  const theme = useTheme();
  const [anchorEl, setAnchorEl] = React.useState<null | HTMLElement>(null);
  const open = Boolean(anchorEl);
  const handleClick = (event: React.MouseEvent<HTMLButtonElement>) => {
    setAnchorEl(event.currentTarget);
  };
  const handleClose = () => {
    setAnchorEl(null);
  };

  return (
    <div>
      <Box
        component="button"
        aria-controls={open ? "basic-menu" : undefined}
        aria-haspopup="true"
        aria-expanded={open ? "true" : undefined}
        onClick={handleClick}
        sx={{
          border: "1px solid white",
          borderRadius: "8px",
          width: 40,
          height: 40,
          bgcolor: "transparent",
          cursor: "pointer",
        }}
      >
        <MoreHoriz />
      </Box>

      <Menu
        id="basic-menu"
        anchorEl={anchorEl}
        open={open}
        onClose={handleClose}
        disableScrollLock={true}
        MenuListProps={{
          sx: {
            bgcolor: "#1b1b1b",
          },
        }}
      >
        <MenuItem>
          <Link
            href="https://soroswap.finance/"
            target="_blank"
            display="flex"
            alignItems="center"
            gap="6px"
            underline="none"
            color="white"
          >
            <Info
              sx={{
                fontSize: "16px",
                color: theme.palette.customBackground.accentAction,
              }}
            />
            About
          </Link>
        </MenuItem>
        <MenuItem>
          <Link
            href="https://docs.soroswap.finance/"
            target="_blank"
            display="flex"
            alignItems="center"
            gap="6px"
            underline="none"
            color="white"
          >
            <Article
              sx={{
                fontSize: "16px",
                color: theme.palette.customBackground.accentAction,
              }}
            />
            Docs
          </Link>
        </MenuItem>
        <MenuItem>
          <Link
            href="https://github.com/soroswap"
            target="_blank"
            display="flex"
            alignItems="center"
            gap="6px"
            underline="none"
            color="white"
          >
            <GitHub
              sx={{
                fontSize: "16px",
                color: theme.palette.customBackground.accentAction,
              }}
            />
            Github
          </Link>
        </MenuItem>
        <MenuItem>
          <Link
            href="https://discord.gg/G8c98rhfqw"
            target="_blank"
            display="flex"
            alignItems="center"
            gap="6px"
            underline="none"
            color="white"
          >
            <FaDiscord
              fontSize="16px"
              color={theme.palette.customBackground.accentAction}
            />
            Discord
          </Link>
        </MenuItem>
      </Menu>
    </div>
  );
}
