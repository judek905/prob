-- ============================================================
-- PART 20: VIEWS
-- ============================================================

USE humanresource;

-- A view that joins employees and departments
CREATE OR REPLACE VIEW staff_directory AS
SELECT e.EmpNo,
       e.Ename,
       e.Job,
       d.DeptName
FROM employees e
LEFT JOIN departments d ON e.DeptNo = d.DeptNo;

-- Use the view as if it were a table
SELECT * FROM staff_directory;

SELECT Ename, Job
FROM staff_directory
WHERE DeptName = 'Sales';

-- A view that leaves out salaries
CREATE OR REPLACE VIEW public_directory AS
SELECT Ename, Job, DeptNo
FROM employees;

SELECT * FROM public_directory;

-- Change the definition of an existing view
CREATE OR REPLACE VIEW staff_directory AS
SELECT e.EmpNo, e.Ename, e.Job, e.Salary, d.DeptName
FROM employees e
LEFT JOIN departments d ON e.DeptNo = d.DeptNo;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Create a view called sales_team that shows Ename and Salary for department 30.
--         Then select everything from it. Expect Achieng and Mugisha.
-- Your answer:


-- Task 2: Create a view called top_paid that shows employees earning more than 3800.
--         Expect Nakato and Atim.
-- Your answer:


-- ------------------------------------------------------------
-- CLEAN UP
-- ------------------------------------------------------------

DROP VIEW IF EXISTS public_directory;
DROP VIEW IF EXISTS staff_directory;
-- DROP VIEW IF EXISTS sales_team;
-- DROP VIEW IF EXISTS top_paid;

