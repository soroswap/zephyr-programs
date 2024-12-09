import { Breadcrumbs, Typography } from "soroswap-ui";
import Link from "next/link";

type Breadcrumb = {
  label: string | JSX.Element;
  href?: string;
};

interface Props {
  breadcrumbs: Breadcrumb[];
}

const AppBreadcrumbs = ({ breadcrumbs }: Props) => {
  return (
    <Breadcrumbs separator="›" aria-label="breadcrumb">
      {breadcrumbs.map((breadcrumb, index) => {
        return (
          <Typography
            key={index}
            color={
              index === breadcrumbs.length - 1 ? "text.primary" : "inherit"
            }
            sx={{
              ":hover": {
                textDecoration:
                  index === breadcrumbs.length - 1 ? "none" : "underline",
              },
            }}
          >
            {breadcrumb.href ? (
              <Link href={breadcrumb.href}>{breadcrumb.label}</Link>
            ) : (
              breadcrumb.label
            )}
          </Typography>
        );
      })}
    </Breadcrumbs>
  );
};

export default AppBreadcrumbs;
