-- ============================================================
-- PART 11: NULL VALUES
-- ============================================================

USE humanresource;

-- NULL is not equal to anything, not even to NULL
SELECT NULL = NULL AS Result;     -- returns NULL
SELECT 5 + NULL AS Result;        -- returns NULL

-- The correct way to find NULL
SELECT Ename FROM employees WHERE DeptNo IS NULL;

-- COUNT(*) counts rows, COUNT(column) skips NULL (expect 7 and 6)
SELECT COUNT(*)      AS AllRows,
       COUNT(DeptNo) AS RowsWithDept
FROM employees;

-- COALESCE replaces NULL with a label
SELECT Ename, COALESCE(DeptNo, 'Not assigned') AS Dept
FROM employees;

-- IFNULL does the same in MySQL, with two arguments
SELECT Ename, IFNULL(DeptNo, 0) AS DeptNo
FROM employees;

-- NULLIF prevents division by zero (returns NULL instead of an error)
SELECT 100 / NULLIF(0, 0) AS SafeDivision;

-- CONCAT with NULL returns NULL in MySQL (only Ssemakula is returned)
SELECT CONCAT('Dept: ', DeptNo) AS Label
FROM employees
WHERE DeptNo IS NULL;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: How many employees have no department? Expect 1.
-- Your answer:


-- Task 2: Show each employee's name and department, using 'Unassigned' where there is no department.
-- Your answer:


-- Task 3: In one row, show how many employees have a department and how many do not.
--         Expect 6 and 1.
-- Your answer:


