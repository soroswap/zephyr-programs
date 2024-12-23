import { Button } from "soroswap-ui";
import { styled } from "soroswap-ui";

export const PrimaryButton = styled(Button)`
  background-color: ${(props) =>
    props.theme.palette.customBackground.accentAction};
  border: 1px solid
    ${(props) => props.theme.palette.customBackground.accentAction};
  border-radius: 8px;
  color: white;
  text-transform: none;
  &:hover {
    opacity: 0.9;
    background-color: ${(props) =>
      props.theme.palette.customBackground.accentAction};
    border: 1px solid transparent;
  }
`;

export const SecondaryButton = styled(Button)({
  background: "transparent",
  border: "1px solid white",
  borderRadius: "8px",
  color: "white",
  textTransform: "none",
  "&:hover": {
    backgroundColor: "#1b1b1b",
  },
});
