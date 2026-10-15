# SQL Practice Scripts

These are 29 SQL scripts for practising the SQL From Zero course, one script per part. Each script matches a reading lesson in the `sql-course` folder, so you can read the lesson, then run the script and do the tasks.

## Before you start

You need MySQL 8.0 or later. MySQL Workbench is the easiest way to run the scripts.

Run `03-setup-your-environment.sql` first. It creates the `humanresource` sample database that most of the other scripts use.

Be careful: the first statement in that script deletes any existing database called `humanresource`. If you built one for your SQL lab, rename or back it up before you run it.

## How to run a script

Open the script in MySQL Workbench, connect to your server, and press Ctrl+Shift+Enter (Cmd+Shift+Enter on macOS) to run the whole script. Ctrl+Enter runs only the statement your cursor is on.

Scripts are written to run from top to bottom. Run them in the order of the part numbers.

Some lines are commented out on purpose. Lines marked "INTENTIONAL ERROR" or "Mistake on purpose" show you what goes wrong. Uncomment them one at a time, run them, and read the error message.

## How the scripts are organised

Examples come first. Each one has a comment explaining what to expect, such as "expect 6 rows" or "expect Nakato and Atim". If your result does not match, compare your output with the note before you change anything.

Practice tasks come after the examples. Each task has a `-- Your answer:` line with empty space below it. Write your query there, run it, and check the result against the expected output in the task comment.

Cleanup sections at the end remove any tables, views, or indexes that the script created, so the sample data stays tidy.

## The files

| File | Part | Topic |
|---|---|---|
| 01-start-here.sql | 01 | Checking that the sample database is ready |
| 02-what-is-a-database.sql | 02 | Looking at tables with SHOW, DESCRIBE and SELECT |
| 03-setup-your-environment.sql | 03 | Creating the humanresource sample database |
| 04-create-tables-and-data-types.sql | 04 | CREATE, ALTER and DROP on a separate practice database |
| 05-constraints.sql | 05 | NOT NULL, UNIQUE, CHECK and foreign keys, with failing examples |
| 06-insert-update-delete.sql | 06 | INSERT, UPDATE and DELETE, all rolled back |
| 07-select-basics.sql | 07 | SELECT, aliases, calculations and DISTINCT |
| 08-where-filtering.sql | 08 | WHERE, AND, OR, IN, BETWEEN, LIKE and IS NULL |
| 09-sorting-and-limiting.sql | 09 | ORDER BY, LIMIT and OFFSET |
| 10-built-in-functions.sql | 10 | Text, number and date functions |
| 11-null-values.sql | 11 | How NULL behaves, plus COALESCE, IFNULL and NULLIF |
| 12-case-expressions.sql | 12 | CASE in SELECT, inside SUM, and in ORDER BY |
| 13-aggregate-functions.sql | 13 | COUNT, SUM, AVG, MIN and MAX |
| 14-group-by-and-having.sql | 14 | GROUP BY and HAVING |
| 15-inner-joins.sql | 15 | INNER JOIN and JOIN ... USING |
| 16-outer-joins.sql | 16 | LEFT JOIN, RIGHT JOIN and a FULL OUTER JOIN built with UNION |
| 17-self-and-multi-table-joins.sql | 17 | Self joins and three-table joins. Creates the projects and assignments tables |
| 18-subqueries.sql | 18 | Scalar, list, derived and correlated subqueries, plus EXISTS |
| 19-set-operations.sql | 19 | UNION, UNION ALL, INTERSECT and EXCEPT |
| 20-views.sql | 20 | CREATE VIEW, CREATE OR REPLACE VIEW and DROP VIEW |
| 21-indexes.sql | 21 | CREATE INDEX, SHOW INDEX and EXPLAIN |
| 22-transactions.sql | 22 | START TRANSACTION, COMMIT, ROLLBACK and SAVEPOINT |
| 23-normalization.sql | 23 | Splitting a flat table into normalised tables |
| 24-relationships-and-er-diagrams.sql | 24 | A library database with one-to-many relationships |
| 25-window-functions.sql | 25 | RANK, ROW_NUMBER, running totals and OVER () |
| 26-common-table-expressions.sql | 26 | WITH, several CTEs, and recursive CTEs |
| 27-practice-exercises.sql | 27 | 29 blank exercises, grouped into six stages |
| 28-solutions.sql | 28 | Working answers to all 29 exercises |
| 29-cheat-sheet.sql | 29 | A runnable reference of the main syntax, plus common mistakes |

## Dependencies between scripts

Part 16 has one task that uses the projects and assignments tables. Run `17-self-and-multi-table-joins.sql` before you attempt it.

Exercise 19 in `27-practice-exercises.sql` also needs those tables. `28-solutions.sql` rebuilds them itself, so you can run the solutions on their own.

Part 04 uses its own database called `practice`. The script rebuilds it every time it runs. When you finish, drop it with `DROP DATABASE practice;`.

Part 17 keeps the projects and assignments tables after the script finishes, because later parts use them.

## Resetting the sample data

If your data has changed, or a script stopped partway through, run `03-setup-your-environment.sql` again. It rebuilds the humanresource database from scratch.

Most scripts can be run more than once. The exceptions are the ones that create indexes or add rows that are not removed. Part 21 creates indexes and removes them at the end. If it stopped partway, run Part 03 to clear the leftover indexes. Part 22 adds a department and removes it at the end. If that script stopped partway, the department may still be there, and running it again will report a duplicate key.

## Things to know

Date results depend on today's date, so the output from Part 10 will change over time.

Salaries may appear as 4500.00 and averages may show extra zeros after the decimal point. This is normal.

A query without ORDER BY can return rows in any order. Where order matters, the script includes ORDER BY.

Part 29 contains one dangerous statement, `DELETE FROM employees;`, which is commented out. It deletes every row, so do not uncomment it.

Some features need newer versions. INTERSECT and EXCEPT need MySQL 8.0.31 or later. Window functions and CTEs need MySQL 8.0 or later.

## Suggested routine

Read the matching lesson in `sql-course`. Run the script and check the examples against their notes. Do the practice tasks in the script. Then try the exercises in Part 27, and check your answers against Part 28.
