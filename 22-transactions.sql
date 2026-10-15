-- ============================================================
-- PART 22: TRANSACTIONS
-- ============================================================

USE humanresource;

-- Example 1: a raise that is undone (salaries return to their originals)
START TRANSACTION;

UPDATE employees
SET Salary = Salary * 1.10
WHERE DeptNo = 30;

SELECT Ename, Salary FROM employees WHERE DeptNo = 30;   -- expect 3080.00 and 2860.00

ROLLBACK;

SELECT Ename, Salary FROM employees WHERE DeptNo = 30;   -- expect 2800.00 and 2600.00

-- Example 2: a savepoint keeps the department but undoes the employee
START TRANSACTION;

INSERT INTO departments (DeptNo, DeptName, Location)
VALUES (60, 'Training', 'Jinja');

SAVEPOINT after_department;

INSERT INTO employees (EmpNo, Ename, Job, Salary, DeptNo, HireDate)
VALUES (7008, 'Test', 'Trainer', 2000.00, 60, '2026-10-15');

ROLLBACK TO after_department;   -- removes the employee, keeps the department

COMMIT;                        -- saves the department

-- Tidy up the practice department
DELETE FROM departments WHERE DeptNo = 60;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Start a transaction, delete employee 7006, check the table,
--         then ROLLBACK. Confirm that 7 employees remain.
-- Your answer:


-- Task 2: Write a transaction that inserts a department, sets a savepoint,
--         inserts an employee into that department, rolls back to the savepoint,
--         then commits. Describe the result in a comment, then run it and
--         delete the department afterwards.
-- Your answer:


