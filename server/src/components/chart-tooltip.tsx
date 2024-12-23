import { formatNumberToToken } from "utils/utils";
import { StyledCard } from "./styled/card";
import { Text } from "./styled/text";
import { useTheme } from "soroswap-ui";

const ChartTooltip = ({ active, payload, label }: any) => {
  const theme = useTheme();

  if (active && payload && payload.length) {
    return (
      <StyledCard bgcolor={theme.palette.background.default} p="12px">
        <Text color="gray">{(payload?.[0]?.name as string).toUpperCase()}</Text>
        <Text fontWeight={600}>{formatNumberToToken(payload[0].value)}</Text>
        <Text color={theme.palette.customBackground.accentAction}>{label}</Text>
      </StyledCard>
    );
  }

  return null;
};

export default ChartTooltip;
