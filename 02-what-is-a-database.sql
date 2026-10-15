-- ============================================================
-- PART 02: WHAT IS A DATABASE?
-- Look at how the tables are built and what they contain.
-- ============================================================

USE humanresource;

SHOW TABLES;
DESCRIBE departments;
DESCRIBE employees;

SELECT * FROM departments;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Look at the output of DESCRIBE employees.
--         Which column is the primary key? Write your answer as a comment.
-- Your answer:


-- Task 2: Classify each statement as DDL, DML, DQL, DCL or TCL.
--         Write the answer as a comment after each letter.
--   a) CREATE TABLE courses (...)
--   b) SELECT * FROM employees;
--   c) GRANT SELECT ON humanresource.employees TO some_user;
--   d) UPDATE employees SET Salary = 3000 WHERE EmpNo = 7002;
--   e) COMMIT;
--   f) DROP TABLE courses;
-- Your answers:


