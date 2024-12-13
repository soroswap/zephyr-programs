import styled from "@emotion/styled";
import { Search } from "@mui/icons-material";
import { Input, InputProps } from "soroswap-ui";
import { useTheme } from "soroswap-ui";

export const StyledInput = styled(Input)({
  border: "1px solid #3E3E3F",
  padding: "3px 12px",
  borderRadius: "8px",
  minWidth: "300px",
  fontSize: "14px",
});

export const SearchInput = ({ ...rest }: InputProps) => {
  const theme = useTheme();
  return (
    <StyledInput
      startAdornment={
        <Search
          sx={{
            color: theme.palette.customBackground.accentAction,
            marginRight: "8px",
          }}
        />
      }
      disableUnderline
      {...rest}
    />
  );
};
