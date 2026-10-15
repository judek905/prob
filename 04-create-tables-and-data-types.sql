-- ============================================================
-- PART 04: CREATING DATABASES AND TABLES
-- This part uses its own practice database, so the sample data is safe.
-- The script drops and rebuilds the practice database each time it runs.
-- ============================================================

SHOW DATABASES;

DROP DATABASE IF EXISTS practice;
CREATE DATABASE practice;
USE practice;

CREATE TABLE projects (
    ProjectNo INT PRIMARY KEY,
    Title     VARCHAR(80) NOT NULL
);

DESCRIBE projects;

-- Change the structure without losing data
ALTER TABLE projects ADD COLUMN Budget DECIMAL(12,2);
ALTER TABLE projects MODIFY COLUMN Title VARCHAR(120) NOT NULL;
ALTER TABLE projects RENAME COLUMN Budget TO TotalBudget;
ALTER TABLE projects DROP COLUMN TotalBudget;

DESCRIBE projects;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Create a table called courses with CourseCode (text, primary key),
--         CourseName (text) and Credits (whole number).
-- Your answer:


-- Task 2: Run DESCRIBE courses to check the structure.
-- Your answer:


-- Task 3: Create a table called salary_grades with Grade (a single character, primary key),
--         MinSalary and MaxSalary (both DECIMAL(10,2)).
-- Your answer:


-- ------------------------------------------------------------
-- CLEAN UP when you have finished (removes the practice database)
-- ------------------------------------------------------------

-- DROP DATABASE practice;

