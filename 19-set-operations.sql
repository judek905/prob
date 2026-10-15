-- ============================================================
-- PART 19: SET OPERATIONS
-- INTERSECT and EXCEPT need MySQL 8.0.31 or later.
-- ============================================================

USE humanresource;

-- UNION removes duplicates (expect 6 rows)
SELECT DeptNo FROM employees
UNION
SELECT DeptNo FROM departments;

-- UNION ALL keeps duplicates (expect 12 rows)
SELECT DeptNo FROM employees
UNION ALL
SELECT DeptNo FROM departments;

-- One alphabetical list of employee names and department names
SELECT Ename AS Name FROM employees
UNION
SELECT DeptName FROM departments
ORDER BY Name;

-- INTERSECT: department numbers present in both tables (expect 10, 20, 30 and 40)
SELECT DeptNo FROM employees
INTERSECT
SELECT DeptNo FROM departments;

-- EXCEPT: departments with no employees (expect 50)
SELECT DeptNo FROM departments
EXCEPT
SELECT DeptNo FROM employees;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Combine all job titles and all department names into one list called Label,
--         without duplicates. Expect 11 rows.
-- Your answer:


-- Task 2: Find department numbers that appear in employees but not in departments.
--         Expect one row containing NULL, because NULL never matches anything.
-- Your answer:


-- Task 3: Use UNION ALL to list every employee name and department name, then count the rows.
--         Expect 12.
-- Your answer:


