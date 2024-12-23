import { AppBar, Box, Container } from "soroswap-ui";
import { ReactNode } from "react";
import Banner from "./banner";
import Header from "./header";
import Footer from "./footer";
import { useTheme } from "soroswap-ui";

export default function Layout({ children }: { children: ReactNode }) {
  const theme = useTheme();

  return (
    <main>
      <AppBar
        position="fixed"
        elevation={0}
        sx={{
          borderBottom: "1px solid #1B1B1B",
        }}
      >
        <Box bgcolor={theme.palette.customBackground.accentAction}>
          <Container maxWidth="lg">
            <Banner />
          </Container>
        </Box>
        <Box bgcolor={theme.palette.background.default}>
          <Container maxWidth="lg">
            <Header />
          </Container>
        </Box>
      </AppBar>
      <Box mt="140px" p={4} bgcolor={theme.palette.background.default}>
        <Container maxWidth="lg" sx={{ minHeight: "100vh" }}>
          {children}
        </Container>
      </Box>
      <Footer />
    </main>
  );
}
