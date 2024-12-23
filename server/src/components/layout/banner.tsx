import { formatNumberToMoney } from "../../utils/utils";
import { Info } from "@mui/icons-material";
import { Row } from "../styled/row";
import { Text } from "../styled/text";
import { useMediaQuery } from "soroswap-ui";
import { useQueryXLMPrice } from "../../hooks/xlm-price";
import LoadingSkeleton from "../loading-skeleton";
import { useTheme } from "soroswap-ui";

const Banner = () => {
  const theme = useTheme();

  const isMobile = useMediaQuery(theme.breakpoints.down("md"));

  const xlm = useQueryXLMPrice();

  return (
    <Row
      padding="8px"
      alignItems="flex-end"
      justifyContent="space-between"
      width="100%"
    >
      <Row gap="4px">
        <Info sx={{ fontSize: "16px" }} />
        <Text>
          This is a beta version, and data computation is actively in progress.
        </Text>
      </Row>
      {!isMobile && (
        <Row gap="4px">
          <Text>XLM Price:</Text>
          <LoadingSkeleton isLoading={xlm.isLoading} height={15} width={80}>
            <Text fontWeight={600}>{formatNumberToMoney(xlm.data)}</Text>
          </LoadingSkeleton>
        </Row>
      )}
    </Row>
  );
};

export default Banner;
