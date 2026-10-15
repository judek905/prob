-- ============================================================
-- PART 15: INNER JOINS
-- ============================================================

USE humanresource;

-- Join employees to departments on the shared DeptNo (expect 6 rows)
SELECT e.Ename, d.DeptName, e.Salary
FROM employees e
INNER JOIN departments d
    ON e.DeptNo = d.DeptNo
ORDER BY d.DeptName, e.Ename;

-- JOIN on its own means INNER JOIN
SELECT e.Ename, d.DeptName
FROM employees e
JOIN departments d ON e.DeptNo = d.DeptNo;

-- USING works when the join column has the same name in both tables
SELECT Ename, DeptName
FROM employees
JOIN departments USING (DeptNo);

-- A join with a filter: departments in Kampala (expect Nakato and Atim)
SELECT e.Ename, d.DeptName
FROM employees e
JOIN departments d ON e.DeptNo = d.DeptNo
WHERE d.Location = 'Kampala';

-- Mistake on purpose: leaving out the join condition gives a cross join of 35 rows
-- SELECT e.Ename, d.DeptName FROM employees e, departments d;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: List each employee with their department location. Expect 6 rows.
-- Your answer:


-- Task 2: Show only the Sales staff with their department name. Expect Achieng and Mugisha.
-- Your answer:


-- Task 3: Count the employees in each department using an inner join.
--         Hint: GROUP BY d.DeptName. Expect Finance 2, Human Resources 1, Operations 1, Sales 2.
-- Your answer:


