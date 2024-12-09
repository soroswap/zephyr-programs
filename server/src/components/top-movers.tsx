import { Box, Card, Typography, useMediaQuery } from "soroswap-ui";
import Slider, { Settings } from "react-slick";
import Token from "./token";
import PercentageChanged from "./percentage-changed";
import { useRouter } from "next/router";

export default function TopMovers() {
  const isLg = useMediaQuery("(max-width: 1280px)");

  const isMd = useMediaQuery("(max-width: 960px)");

  const isSm = useMediaQuery("(max-width: 600px)");

  var settings: Settings = {
    infinite: true,
    speed: 60000,
    slidesToShow: isSm ? 1 : isMd ? 2 : isLg ? 3 : 5,
    slidesToScroll: 10,
    autoplay: true,
    autoplaySpeed: 1,
    cssEase: "linear",
  };
  return (
    <Box>
      <Typography variant="h6">Top Movers</Typography>
      <Slider {...settings}>
        {Array.from(Array(10).keys()).map((i) => (
          <TokenPriceChange i={i} key={i} />
        ))}
      </Slider>
    </Box>
  );
}

const TokenPriceChange = ({ i }: { i: number }) => {
  const router = useRouter();

  const handleClick = () => {
    router.push({
      pathname: `/tokens/${i}`,
      query: {
        network: router.query.network,
      },
    });
  };

  return (
    <div>
      <Card
        onClick={handleClick}
        sx={{
          p: 2,
          bgcolor: "white",
          width: 200,
          m: 2,
          ":hover": {
            opacity: 0.8,
            bgcolor: "#00000014",
            cursor: "pointer",
          },
        }}
      >
        <Box display="flex" alignItems="flex-start" gap="8px">
          <Token token="ETH" />
          <Box>
            <Typography>ETH {i + 1}</Typography>
            <Box display="flex" alignItems="center" gap="8px">
              <Typography>$2.13k</Typography>
              <PercentageChanged percentage={-10.72} noParentheses />
            </Box>
          </Box>
        </Box>
      </Card>
    </div>
  );
};
