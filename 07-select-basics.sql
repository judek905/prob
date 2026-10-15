-- ============================================================
-- PART 07: YOUR FIRST REAL QUERIES WITH SELECT
-- Run each query, then compare the result with the note beside it.
-- ============================================================

USE humanresource;

-- Every column in every row
SELECT * FROM employees;

-- Only the columns you need
SELECT Ename, Job, Salary
FROM employees;

-- Aliases with AS
SELECT Ename AS Name, Salary AS MonthlyPay
FROM employees;

-- An alias with a space needs backticks
SELECT Ename AS `Employee Name`
FROM employees;

-- A calculated column (the table itself does not change)
SELECT Ename, Salary, Salary * 12 AS AnnualSalary
FROM employees;

-- DISTINCT: each job title once (expect 6 rows)
SELECT DISTINCT Job
FROM employees;

-- DISTINCT on a column with NULL (expect 5 rows, NULL counts as one value)
SELECT DISTINCT DeptNo
FROM employees;

-- A query with no table at all
SELECT 2 + 3 AS Result;

-- Comments: a single line
/* A longer comment
   that spans two lines */
SELECT Ename   -- comments can sit inside a query
FROM employees;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Show each employee's name and their salary increased by 10%,
--         using the alias NewSalary.
-- Your answer:


-- Task 2: Show every column of the departments table.
-- Your answer:


-- Task 3: Show the distinct department numbers, but only for employees who have one.
--         Hint: NULL needs its own check. Expect 4 rows.
-- Your answer:


