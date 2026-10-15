-- ============================================================
-- PART 16: OUTER JOINS
-- ============================================================

USE humanresource;

-- LEFT JOIN keeps all 7 employees; Ssemakula gets NULL for DeptName
SELECT e.Ename, d.DeptName
FROM employees e
LEFT JOIN departments d
    ON e.DeptNo = d.DeptNo;

-- Employees with no department (expect Ssemakula)
SELECT e.Ename
FROM employees e
LEFT JOIN departments d
    ON e.DeptNo = d.DeptNo
WHERE d.DeptNo IS NULL;

-- Departments with no employees (expect Marketing)
SELECT d.DeptName
FROM departments d
LEFT JOIN employees e
    ON d.DeptNo = e.DeptNo
WHERE e.EmpNo IS NULL;

-- RIGHT JOIN keeps every department (expect 7 rows, Marketing included)
SELECT e.Ename, d.DeptName
FROM employees e
RIGHT JOIN departments d
    ON e.DeptNo = d.DeptNo;

-- FULL OUTER JOIN built with UNION, since MySQL has no FULL JOIN (expect 8 rows)
SELECT e.Ename, d.DeptName
FROM employees e
LEFT JOIN departments d ON e.DeptNo = d.DeptNo
UNION
SELECT e.Ename, d.DeptName
FROM employees e
RIGHT JOIN departments d ON e.DeptNo = d.DeptNo;

-- The WHERE trap: this behaves like an inner join (expect Achieng and Mugisha)
SELECT e.Ename, d.DeptName
FROM employees e
LEFT JOIN departments d ON e.DeptNo = d.DeptNo
WHERE d.DeptName = 'Sales';

-- ------------------------------------------------------------
-- PRACTICE
-- Task 2 needs the assignments table from Part 17. Run that part first.
-- ------------------------------------------------------------

-- Task 1: Count the employees in each department, including the department with none.
--         Expect Marketing 0. Hint: count COUNT(e.EmpNo), not COUNT(*).
-- Your answer:


-- Task 2: Find employees with no project assignment. Expect Ssemakula and Atim.
-- Your answer:


