import { SxProps, Theme, Typography } from "soroswap-ui";

interface Props {
  percentage: number;
  sx?: SxProps<Theme>;
  noParentheses?: boolean;
}

const PercentageChanged = ({ percentage, noParentheses, sx }: Props) => {
  const arrow = percentage > 0 ? "↑" : "↓";
  const color = percentage > 0 ? "green" : "red";

  const getText = () => {
    if (!percentage) return "0%";
    const text = `${arrow} ${Math.abs(percentage)}%`;
    if (noParentheses) {
      return text;
    } else {
      return `(${text})`;
    }
  };

  return (
    <Typography color={color} sx={sx}>
      {getText()}
    </Typography>
  );
};

export default PercentageChanged;
