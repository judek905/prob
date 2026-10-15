-- ============================================================
-- PART 08: FILTERING ROWS WITH WHERE
-- ============================================================

USE humanresource;

-- Comparison: earning more than 3000 (expect 4 rows)
SELECT Ename, Salary
FROM employees
WHERE Salary > 3000;

-- Text goes in single quotes (expect Achieng and Mugisha)
SELECT Ename
FROM employees
WHERE Job = 'Sales Rep';

-- AND (expect Namukasa only)
SELECT Ename, Salary, DeptNo
FROM employees
WHERE DeptNo = 20 AND Salary > 3300;

-- OR (expect Achieng, Mugisha and Ssemakula)
SELECT Ename
FROM employees
WHERE DeptNo = 30 OR Job = 'Clerk';

-- Parentheses change the meaning (expect Atim only)
SELECT Ename
FROM employees
WHERE (DeptNo = 30 OR DeptNo = 40) AND Salary > 3000;

-- IN (expect Namukasa and Ssemakula)
SELECT Ename
FROM employees
WHERE Job IN ('Clerk', 'Analyst');

-- NOT IN quietly leaves out the NULL department (expect Achieng, Mugisha and Atim)
SELECT Ename
FROM employees
WHERE DeptNo NOT IN (10, 20);

-- BETWEEN includes both ends (expect 4 rows)
SELECT Ename, Salary
FROM employees
WHERE Salary BETWEEN 2500 AND 3500;

-- LIKE with % (expect Achieng and Atim)
SELECT Ename FROM employees WHERE Ename LIKE 'A%';

-- LIKE with _ (expect Atim)
SELECT Ename FROM employees WHERE Ename LIKE '_tim';

-- LIKE inside a job title (expect two rows)
SELECT Ename FROM employees WHERE Job LIKE '%Rep%';

-- NULL checks (expect Ssemakula, then 6 rows)
SELECT Ename FROM employees WHERE DeptNo IS NULL;
SELECT Ename FROM employees WHERE DeptNo IS NOT NULL;

-- Returns NO rows, because = NULL is never true
SELECT Ename FROM employees WHERE DeptNo = NULL;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Employees in department 40 or department 50. Expect Atim.
-- Your answer:


-- Task 2: Employees whose salary is from 2000 to 3000 inclusive. Expect Achieng and Mugisha.
-- Your answer:


-- Task 3: Employees whose name ends with the letter a. Expect Mugisha, Namukasa and Ssemakula.
--         Hint: put % at the start of the pattern.
-- Your answer:


