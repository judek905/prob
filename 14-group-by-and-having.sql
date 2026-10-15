-- ============================================================
-- PART 14: GROUP BY AND HAVING
-- ============================================================

USE humanresource;

-- Staff count and pay per department (NULL department appears first)
SELECT DeptNo,
       COUNT(*)    AS Staff,
       SUM(Salary) AS TotalPay,
       AVG(Salary) AS AvgPay
FROM employees
GROUP BY DeptNo
ORDER BY DeptNo;

-- HAVING keeps groups whose average is above 3000 (expect 10, 20 and 40)
SELECT DeptNo,
       AVG(Salary) AS AvgPay
FROM employees
GROUP BY DeptNo
HAVING AVG(Salary) > 3000;

-- WHERE first, then GROUP BY, then HAVING (expect 20 and 30)
SELECT DeptNo,
       COUNT(*) AS Staff
FROM employees
WHERE Salary >= 2500
GROUP BY DeptNo
HAVING COUNT(*) >= 2;

-- Two grouping columns
SELECT DeptNo, Job, COUNT(*) AS People
FROM employees
GROUP BY DeptNo, Job
ORDER BY DeptNo, Job;

-- Mistake on purpose: Ename is neither grouped nor aggregated
-- SELECT Ename, DeptNo, COUNT(*) FROM employees GROUP BY DeptNo;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: The number of employees for each job title. Sales Rep should show 2.
-- Your answer:


-- Task 2: Departments with more than one employee. Expect 20 and 30.
-- Your answer:


-- Task 3: For each department, the highest salary. Expect 10 to show 4500 and 30 to show 2800.
-- Your answer:


