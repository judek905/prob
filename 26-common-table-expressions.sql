-- ============================================================
-- PART 26: COMMON TABLE EXPRESSIONS (CTEs)
-- Needs MySQL 8.0 or later.
-- ============================================================

USE humanresource;

-- A CTE: average salary per department, then compare each employee to it
WITH dept_avg AS (
    SELECT DeptNo, AVG(Salary) AS AvgPay
    FROM employees
    GROUP BY DeptNo
)
SELECT e.Ename, e.Salary, d.AvgPay
FROM employees e
JOIN dept_avg d ON e.DeptNo = d.DeptNo
WHERE e.Salary > d.AvgPay;

-- Two CTEs, where the second one uses the first (expect departments 10, 20 and 40)
WITH dept_avg AS (
    SELECT DeptNo, AVG(Salary) AS AvgPay
    FROM employees
    GROUP BY DeptNo
),
busy_depts AS (
    SELECT DeptNo
    FROM dept_avg
    WHERE AvgPay > (SELECT AVG(Salary) FROM employees)
)
SELECT DeptNo FROM busy_depts;

-- A recursive CTE: the numbers 1 to 5
WITH RECURSIVE counter AS (
    SELECT 1 AS n                          -- anchor: the starting row
    UNION ALL
    SELECT n + 1 FROM counter WHERE n < 5  -- recursive part
)
SELECT n FROM counter;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Use a CTE to count the employees in each department, then show only
--         departments with at least 2 people. Expect 20 and 30.
-- Your answer:


-- Task 2: Use a recursive CTE to produce the even numbers from 2 to 20. Expect 10 rows.
-- Your answer:


-- Task 3: Use a recursive CTE to produce the powers of 2 up to 64.
--         Expect 1, 2, 4, 8, 16, 32 and 64.
-- Your answer:


