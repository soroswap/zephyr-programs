import {
  Link,
  Skeleton,
  Tab,
  Tabs,
  Box,
  Table,
  TableBody,
  TableHead,
  TablePagination,
  TableRow,
  TableSortLabel,
  TableContainer,
} from "soroswap-ui";

import { visuallyHidden } from "@mui/utils";
import TimeAgo from "javascript-time-ago";
import en from "javascript-time-ago/locale/en";
import useTable from "../../hooks/use-table";
import {
  formatEvent,
  shortenAddress,
  shouldShortenCode,
} from "../../utils/utils";
import {
  RouterEventAPI,
  RouterEventType,
  RouterEventsAPIResponse,
} from "../../types/router-events";
import { UseEventTopicFilterReturnProps } from "../../hooks/use-event-topic-filter";
import { StyledTableCell } from "components/styled/table-cell";
import { StyledCard } from "components/styled/card";
import { useTheme } from "soroswap-ui";
import useQueryNetwork from "hooks/use-query-network";

TimeAgo.addLocale(en);
const timeAgo = new TimeAgo("en-US");

interface HeadCell {
  id: keyof RouterEventAPI;
  label: string;
  numeric: boolean;
  sortable?: boolean;
}

const headCells: readonly HeadCell[] = [
  {
    id: "amountA",
    numeric: true,
    label: "Token Amount",
  },
  {
    id: "amountB",
    numeric: true,
    label: "Token Amount",
  },
  {
    id: "account",
    numeric: true,
    label: "Account",
  },
  {
    id: "timestamp",
    numeric: true,
    label: "Time",
    sortable: true,
  },
];

interface TransactionsTableProps {
  onRequestSort: (
    event: React.MouseEvent<unknown>,
    property: keyof RouterEventAPI
  ) => void;
  order: "asc" | "desc";
  orderBy: string;
  setCurrentFilter: React.Dispatch<
    React.SetStateAction<"All" | RouterEventType>
  >;
  currentFilter: "All" | RouterEventType;
}

function TransactionsTableHead(props: TransactionsTableProps) {
  const { order, orderBy, onRequestSort, setCurrentFilter, currentFilter } =
    props;

  const createSortHandler =
    (property: keyof RouterEventAPI) => (event: React.MouseEvent<unknown>) => {
      onRequestSort(event, property);
    };

  return (
    <TableHead>
      <TableRow sx={{ bgcolor: "#1b1b1b" }}>
        <StyledTableCell>
          <Tabs value={currentFilter} onChange={(e, v) => setCurrentFilter(v)}>
            <Tab
              label="All"
              value="All"
              sx={{ fontSize: 14, p: 0.5, minWidth: 30 }}
            />
            <Tab
              label="Swaps"
              value="Swap"
              sx={{ fontSize: 14, p: 0.5, minWidth: 30 }}
            />
            <Tab
              label="Adds"
              value="Add"
              sx={{ fontSize: 14, p: 0.5, minWidth: 30 }}
            />
            <Tab
              label="Removes"
              value="Remove"
              sx={{ fontSize: 14, p: 0.5, minWidth: 30 }}
            />
          </Tabs>
        </StyledTableCell>
        {headCells.map((headCell) => (
          <StyledTableCell
            key={headCell.id}
            align={headCell.numeric ? "right" : "left"}
            sortDirection={orderBy === headCell.id ? order : false}
          >
            {headCell.sortable ? (
              <TableSortLabel
                active={orderBy === headCell.id}
                direction={orderBy === headCell.id ? order : "asc"}
                onClick={createSortHandler(headCell.id)}
              >
                {headCell.label}
                {orderBy === headCell.id ? (
                  <Box component="span" sx={visuallyHidden}>
                    {order === "desc"
                      ? "sorted descending"
                      : "sorted ascending"}
                  </Box>
                ) : null}
              </TableSortLabel>
            ) : (
              <>{headCell.label}</>
            )}
          </StyledTableCell>
        ))}
      </TableRow>
    </TableHead>
  );
}

interface Props {
  rows: RouterEventsAPIResponse;
  isLoading: boolean;
  filters: UseEventTopicFilterReturnProps;
}

export default function TransactionsTable({ rows, isLoading, filters }: Props) {
  const { currentFilter, setCurrentFilter } = filters;

  const {
    order,
    orderBy,
    handleRequestSort,
    visibleRows,
    emptyRows,
    rowsPerPage,
    page,
    handleChangePage,
    handleChangeRowsPerPage,
  } = useTable<RouterEventAPI>({
    rows,
    defaultOrder: "desc",
    defaultOrderBy: "timestamp",
  });

  const theme = useTheme();
  const { networkName } = useQueryNetwork();

  if (isLoading) {
    return <Skeleton variant="rounded" height={300} />;
  }

  return (
    <Box sx={{ width: "100%" }}>
      <StyledCard sx={{ width: "100%" }}>
        <TableContainer sx={{ minHeight: 610 }}>
          <Table sx={{ minWidth: 750 }} aria-labelledby="tableTitle">
            <TransactionsTableHead
              order={order}
              orderBy={orderBy}
              onRequestSort={handleRequestSort}
              setCurrentFilter={setCurrentFilter}
              currentFilter={currentFilter}
            />
            <TableBody>
              {visibleRows.map((row, index) => {
                return (row.txHash &&
                  <TableRow
                    key={index}
                    sx={{
                      "&:nth-of-type(2n)": {
                        bgcolor: "#1b1b1b",
                      },
                      "&:hover": {
                        cursor: "pointer",
                        bgcolor: theme.palette.background.paper,
                        borderTop: `1px solid ${theme.palette.customBackground.accentAction}`,
                        borderBottom: `1px solid ${theme.palette.customBackground.accentAction}`,
                      },
                      bgcolor: "transparent",
                    }}
                  >
                    <StyledTableCell align="left">
                      <>
                        <Link
                          href={`https://stellar.expert/explorer/${networkName}/tx/${row.txHash}`}
                          target="_blank"
                          underline="hover"
                        >
                          {formatEvent(
                            row.eType,
                            row.tokenA?.code ?? "",
                            row.tokenB?.code ?? ""
                          )}
                        </Link>
                      </>
                    </StyledTableCell>
                    <StyledTableCell align="right">
                      {row.amountA} {shouldShortenCode(row.tokenA?.code ?? "")}
                    </StyledTableCell>
                    <StyledTableCell align="right">
                      {row.amountB} {shouldShortenCode(row.tokenB?.code ?? "")}
                    </StyledTableCell>
                    <StyledTableCell align="right">
                      <>
                        <Link
                          href={`https://stellar.expert/explorer/${networkName}/account/${row.account}`}
                          target="_blank"
                          underline="hover"
                        >
                          {shortenAddress(row.account ?? "")}
                        </Link>
                      </>
                    </StyledTableCell>
                    <StyledTableCell align="right">
                      {timeAgo.format(Number(row.timestamp) * 1000 || 0)}
                    </StyledTableCell>
                  </TableRow>
                );
              })}
              {emptyRows > 0 && (
                <TableRow
                  style={{
                    height: 53 * emptyRows,
                  }}
                >
                  <StyledTableCell colSpan={6} />
                </TableRow>
              )}
              {visibleRows.length === 0 && (
                <TableRow>
                  <StyledTableCell colSpan={6} align="center">
                    No transactions found
                  </StyledTableCell>
                </TableRow>
              )}
            </TableBody>
          </Table>
        </TableContainer>
        <TablePagination
          component="div"
          count={rows.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
          rowsPerPageOptions={[]}
        />
      </StyledCard>
    </Box>
  );
}
