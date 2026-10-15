-- ============================================================
-- PART 09: SORTING AND LIMITING RESULTS
-- ============================================================

USE humanresource;

-- Highest salary first
SELECT Ename, Salary
FROM employees
ORDER BY Salary DESC;

-- The second column breaks ties (Achieng before Mugisha inside Sales Rep)
SELECT Ename, Job, Salary
FROM employees
ORDER BY Job, Salary DESC;

-- Sort by an alias
SELECT Ename, Salary * 12 AS AnnualSalary
FROM employees
ORDER BY AnnualSalary DESC;

-- NULL sorts first in MySQL when ascending (Ssemakula at the top)
SELECT Ename, DeptNo
FROM employees
ORDER BY DeptNo;

-- The top three earners (Nakato, Atim, Namukasa)
SELECT Ename, Salary
FROM employees
ORDER BY Salary DESC
LIMIT 3;

-- Page two with three rows per page (Okello, Achieng, Mugisha)
SELECT Ename, Salary
FROM employees
ORDER BY Salary DESC
LIMIT 3 OFFSET 3;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: The two lowest-paid employees. Expect Ssemakula and Mugisha.
-- Your answer:


-- Task 2: The three most recently hired employees, newest first. Expect Ssemakula, Mugisha and Achieng.
--         Hint: sort by HireDate.
-- Your answer:


-- Task 3: All employees in alphabetical order, showing only rows 3 and 4. Expect Mugisha and Nakato.
--         Hint: combine ORDER BY Ename with LIMIT and OFFSET.
-- Your answer:


