# SQL Practice Files

Two SQL practice scripts covering data changes (DML) and more advanced querying. Both assume a sample database with the tables `customers`, `categories`, `products`, `orders`, and `order_items`, created by `01_setup_sample_data.sql` (not included here). Run that script first, and re-run it any time you want to reset the data.

## Files

| File | Topic |
|------|-------|
| `02_insert_update_delete.sql` | Creating, changing, and removing rows (CRUD), plus foreign key behaviour |
| `06_subqueries_cte_windows.sql` | Subqueries, CTEs, window functions, and set operators |

## 02: INSERT, UPDATE, DELETE

Covers:

- **INSERT**: single rows, multiple rows at once, `RETURNING` to get generated values back, and inserting from a query.
- **UPSERT**: `INSERT ... ON CONFLICT (email) DO UPDATE`, which inserts a row or updates it if the email already exists. This requires a unique constraint on `email`.
- **UPDATE**: including updates that pull values from another table using `FROM`.
- **DELETE and TRUNCATE**: removing rows, emptying a table, and dropping a table.
- **Foreign key rules**: `CASCADE`, `SET NULL`, and `RESTRICT`. The final `DELETE FROM products` statement is meant to fail, which demonstrates `RESTRICT`.

Safety habit from the file: write the `SELECT` first to check which rows match, then change it to `UPDATE` or `DELETE`. Always include a `WHERE` clause in `UPDATE` and `DELETE`, or every row will change.

## 06: Subqueries, CTEs, Window Functions, Set Operators

Covers:

- **Subqueries** in `WHERE`, `SELECT`, and `FROM`, including `IN`, `EXISTS`, `NOT EXISTS`, `ANY`, and `ALL`.
- **CTEs** (`WITH`) for readable multi-step queries, and a **recursive CTE** that generates a number sequence. Recursive CTEs are also used for hierarchies such as org charts or category trees.
- **Window functions**: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `AVG ... OVER`, `LAG`, `LEAD`, `NTILE`, and running totals. Window functions calculate across rows without collapsing them into one row.
- **Set operators**: `UNION`, `UNION ALL`, `EXCEPT`, and `INTERSECT`.

## Notes

- In `06_subqueries_cte_windows.sql`, the `running_sum` column uses `SUM(order_id)`, so it adds up order IDs rather than order totals. If you want a running total of sales, use `SUM` on the order total instead.
- Several statements in `02_insert_update_delete.sql` filter on a `country` column in `customers`, so make sure your setup script includes it.
- The file 02 comments refer to file 10 for transactions. That file is not included here.

## Suggested order

1. Run `01_setup_sample_data.sql`.
2. Work through `02_insert_update_delete.sql` and try each statement on its own.
3. Work through `06_subqueries_cte_windows.sql`, starting with subqueries, then CTEs, then window functions.
