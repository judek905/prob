-- ============================================================
-- PART 06: INSERT, UPDATE AND DELETE
-- Every change below sits inside a transaction and is rolled back,
-- so the sample data stays exactly as it was.
-- ============================================================

USE humanresource;

START TRANSACTION;

-- INSERT one row, then several rows
INSERT INTO departments (DeptNo, DeptName, Location)
VALUES (60, 'Training', 'Jinja');

INSERT INTO departments (DeptNo, DeptName, Location)
VALUES (70, 'IT', 'Kampala'),
       (80, 'Legal', 'Entebbe');

SELECT * FROM departments;

-- UPDATE with a WHERE clause (5% raise for department 30)
UPDATE employees
SET Salary = Salary * 1.05
WHERE DeptNo = 30;

SELECT Ename, Salary FROM employees WHERE DeptNo = 30;

-- DELETE with a WHERE clause
DELETE FROM departments
WHERE DeptNo = 80;

SELECT * FROM departments;

-- Undo everything above. Change this to COMMIT only if you want to keep the changes.
ROLLBACK;

SELECT * FROM departments;   -- back to the original five departments

-- ------------------------------------------------------------
-- INTENTIONAL ERROR
-- Uncomment to see the foreign key stop a delete.
-- Nakato still works in department 10, so the department cannot be removed.
-- ------------------------------------------------------------

-- DELETE FROM departments WHERE DeptNo = 10;

-- ------------------------------------------------------------
-- PRACTICE
-- Write each statement inside a transaction and ROLLBACK at the end.
-- ------------------------------------------------------------

-- Task 1: Insert a new employee: EmpNo 7008, Ename 'Wasswa', Job 'Driver',
--         Salary 2000.00, DeptNo 20, HireDate '2025-01-15'.
-- Your answer:


-- Task 2: Give every employee in department 20 a raise of 200.00.
-- Your answer:


-- Task 3: Delete the employee with EmpNo 7006 (Ssemakula). Then check how many rows remain. Expect 6.
-- Your answer:


