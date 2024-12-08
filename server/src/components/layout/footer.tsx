import { Box, Container, Link } from "soroswap-ui";
import Image from "next/image";
import { Row } from "components/styled/row";
import { GitHub, Telegram } from "@mui/icons-material";
import { FaDiscord } from "react-icons/fa";

const Footer = () => {
  return (
    <Box
      component="footer"
      borderTop={`1px solid rgba(136, 102, 221, 0.5)`}
      mt="32px"
    >
      <Container maxWidth="lg" sx={{ p: "32px" }}>
        <Row justifyContent="space-between">
          <Image src="/soroswap.png" width={113} height={24} alt="Soroswap" />
          <Row gap="16px">
            <Link href="https://github.com/soroswap" target="_blank">
              <GitHub sx={{ fontSize: "20px" }} />
            </Link>
            <Link href="https://github.com/soroswap" target="_blank">
              <Telegram sx={{ fontSize: "25px" }} />
            </Link>

            <Link href="https://discord.gg/G8c98rhfqw" target="_blank">
              <FaDiscord fontSize="24px" />
            </Link>
          </Row>
        </Row>
      </Container>
    </Box>
  );
};

export default Footer;
