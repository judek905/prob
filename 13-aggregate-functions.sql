-- ============================================================
-- PART 13: AGGREGATE FUNCTIONS
-- ============================================================

USE humanresource;

-- The five essential aggregates in one row
SELECT COUNT(*)    AS Employees,
       SUM(Salary) AS TotalPay,
       AVG(Salary) AS AveragePay,
       MIN(Salary) AS LowestPay,
       MAX(Salary) AS HighestPay
FROM employees;

-- Distinct values (expect 6)
SELECT COUNT(DISTINCT Job) AS DifferentJobs
FROM employees;

-- WHERE filters before aggregating (expect 2 and 3350)
SELECT COUNT(*)    AS FinanceStaff,
       AVG(Salary) AS FinanceAverage
FROM employees
WHERE DeptNo = 20;

-- Mistake on purpose: a plain column next to an aggregate needs GROUP BY
-- SELECT Ename, MAX(Salary) FROM employees;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: The earliest and latest HireDate in the company. Expect 2017-08-22 and 2023-02-14.
-- Your answer:


-- Task 2: How many employees were hired before 2020? Expect 3.
-- Your answer:


-- Task 3: The average salary of the Sales department only. Expect 2700.
-- Your answer:


