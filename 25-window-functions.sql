-- ============================================================
-- PART 25: WINDOW FUNCTIONS
-- Needs MySQL 8.0 or later. Every row is kept in the results.
-- ============================================================

USE humanresource;

-- RANK: highest salary is 1 (no ties in this data)
SELECT Ename,
       Salary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM employees;

-- ROW_NUMBER restarts for each department
SELECT Ename,
       DeptNo,
       Salary,
       ROW_NUMBER() OVER (PARTITION BY DeptNo ORDER BY Salary DESC) AS RankInDept
FROM employees;

-- Running total in employee-number order (ends at 22400.00)
SELECT EmpNo,
       Ename,
       Salary,
       SUM(Salary) OVER (ORDER BY EmpNo) AS RunningTotal
FROM employees;

-- Every row also shows its department average
SELECT Ename,
       DeptNo,
       Salary,
       AVG(Salary) OVER (PARTITION BY DeptNo) AS DeptAverage
FROM employees;

-- The top earner in each department, using a subquery to filter on the window result
SELECT Ename, DeptNo, Salary
FROM (SELECT Ename,
             DeptNo,
             Salary,
             ROW_NUMBER() OVER (PARTITION BY DeptNo ORDER BY Salary DESC) AS rn
      FROM employees) AS ranked
WHERE rn = 1;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Rank employees by hire date, oldest first, using RANK().
--         Expect Atim ranked 1.
-- Your answer:


-- Task 2: Show each employee with the number of people in their department on every row.
--         Hint: COUNT(*) OVER (PARTITION BY DeptNo). Expect Nakato to show 1 and Okello to show 2.
-- Your answer:


-- Task 3: Show each employee's share of the company's total salary as a percentage, rounded to 2 places.
--         Hint: divide by SUM(Salary) OVER (). Expect Nakato to show 20.09.
-- Your answer:


