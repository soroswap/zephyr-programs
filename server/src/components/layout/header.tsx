import { useMediaQuery } from "soroswap-ui";
import { Menu } from "@mui/icons-material";
import { Row } from "../styled/row";
import Image from "next/image";
import NetworkSelector from "./network-selector";
import PagesMenu from "./pages-menu";
import { useRouter } from "next/router";
import Link from "next/link";
import { Navbar } from "soroswap-ui";
import { useTheme } from "soroswap-ui";

interface NavItem {
  href: string;
  label: string;
  target?: string;
  active?: boolean;
}

const Header = () => {
  const theme = useTheme();

  const isMobile = useMediaQuery(theme.breakpoints.down(1220));
  const isSmall = useMediaQuery(theme.breakpoints.down(526));

  const router = useRouter();

  const HeaderNavbar = () => (
    <Navbar
      onClickItem={(item) => {
        if (item.path === "/") {
          router.push("/");
        } else {
          window.open(`https://app.soroswap.finance${item.path}`, "_blank");
        }
      }}
      isActiveItem={(item) => item.label === "Info"}
      isMobile={isMobile}
      mobileProps={{
        drawerMarginTop: isSmall ? 138 : 132,
      }}
    />
  );

  return (
    <Row paddingY="24px" justifyContent="space-between">
      <Link href="/">
        <Image src="/logo-dark.svg" width={115} height={40} alt="Soroswap" />
      </Link>

      {!isMobile && <HeaderNavbar />}

      <Row gap="16px">
        <NetworkSelector />
        {isMobile ? <HeaderNavbar /> : <PagesMenu />}
      </Row>
    </Row>
  );
};

export default Header;
