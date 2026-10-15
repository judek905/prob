-- ============================================================
-- PART 21: INDEXES
-- The indexes created here are removed again at the end.
-- ============================================================

USE humanresource;

-- Indexes on columns you search often
CREATE INDEX idx_emp_job  ON employees (Job);
CREATE INDEX idx_emp_hire ON employees (HireDate);

-- A composite index: column order matters
CREATE INDEX idx_emp_job_salary ON employees (Job, Salary);

-- A unique index prevents duplicate values
CREATE UNIQUE INDEX idx_dept_name ON departments (DeptName);

-- List the indexes on a table
SHOW INDEX FROM employees;

-- Ask the database which plan it will use
EXPLAIN SELECT Ename FROM employees WHERE Job = 'Clerk';

-- Comparing the column directly can use an index on HireDate
SELECT Ename FROM employees WHERE HireDate < '2020-01-01';

-- Wrapping the column in a function can stop the index being used
SELECT Ename FROM employees WHERE YEAR(HireDate) < 2020;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Create an index on employees(Ename). Run EXPLAIN on a query that
--         filters by Ename = 'Okello'. Then drop the index again.
-- Your answer:


-- Task 2: Write a comment explaining why an index on a seven-row table
--         will not show a speed improvement.
-- Your answer:


-- ------------------------------------------------------------
-- CLEAN UP
-- ------------------------------------------------------------

DROP INDEX idx_emp_job ON employees;
DROP INDEX idx_emp_hire ON employees;
DROP INDEX idx_emp_job_salary ON employees;
DROP INDEX idx_dept_name ON departments;

