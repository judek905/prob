-- ============================================================
-- PART 12: CASE EXPRESSIONS
-- ============================================================

USE humanresource;

-- Searched CASE: label each salary
SELECT Ename,
       Salary,
       CASE
           WHEN Salary >= 3500 THEN 'High'
           WHEN Salary >= 2500 THEN 'Medium'
           ELSE 'Entry'
       END AS SalaryBand
FROM employees;

-- Simple CASE: compare one value against a list
SELECT Ename,
       CASE DeptNo
           WHEN 10 THEN 'HR office'
           WHEN 20 THEN 'Finance office'
           ELSE 'Other or none'
       END AS Office
FROM employees;

-- CASE inside SUM: company total next to the Sales total
SELECT SUM(Salary) AS CompanyTotal,
       SUM(CASE WHEN DeptNo = 30 THEN Salary ELSE 0 END) AS SalesTotal
FROM employees;

-- CASE in ORDER BY: managers first, then everyone else
SELECT Ename, Job
FROM employees
ORDER BY CASE WHEN Job = 'Manager' THEN 0 ELSE 1 END, Ename;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Show each name and job, with 'Manager' shown as 'Leader' and every other job shown as 'Staff'.
-- Your answer:


-- Task 2: Count the High earners (salary 3500 or more) using CASE inside SUM. Expect 3.
-- Your answer:


-- Task 3: Show 'Kampala' for departments 10 and 40, and 'Elsewhere' for everyone else.
--         Include the name of each employee. Expect Atim to show Kampala.
-- Your answer:


