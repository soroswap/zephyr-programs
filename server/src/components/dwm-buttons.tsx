import { Box, Button } from "soroswap-ui";

const DWMButtons = () => {
  return (
    <Box display="flex" gap="8px">
      <Button variant="contained" sx={{ minWidth: 30, p: 0 }}>
        D
      </Button>
      <Button variant="contained" sx={{ minWidth: 30, p: 0 }}>
        W
      </Button>
      <Button variant="contained" sx={{ minWidth: 30, p: 0 }}>
        M
      </Button>
    </Box>
  );
};

export default DWMButtons;
