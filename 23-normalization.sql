-- ============================================================
-- PART 23: NORMALISATION
-- Builds a flat table, then splits it into two tables.
-- ============================================================

USE humanresource;

DROP TABLE IF EXISTS norm_staff;
DROP TABLE IF EXISTS norm_departments;
DROP TABLE IF EXISTS staff_flat;

-- The unnormalised table: department facts repeat on every row
CREATE TABLE staff_flat (
    EmpNo        INT PRIMARY KEY,
    Ename        VARCHAR(50),
    DeptName     VARCHAR(50),
    DeptLocation VARCHAR(50)
);

INSERT INTO staff_flat (EmpNo, Ename, DeptName, DeptLocation) VALUES
(7001, 'Nakato',   'Human Resources', 'Kampala'),
(7002, 'Okello',   'Finance',         'Entebbe'),
(7005, 'Namukasa', 'Finance',         'Entebbe');

SELECT * FROM staff_flat;

-- Split into two tables, so each department fact is stored once
CREATE TABLE norm_departments (
    DeptName     VARCHAR(50) PRIMARY KEY,
    DeptLocation VARCHAR(50)
);

INSERT INTO norm_departments (DeptName, DeptLocation)
SELECT DISTINCT DeptName, DeptLocation
FROM staff_flat;

CREATE TABLE norm_staff (
    EmpNo    INT PRIMARY KEY,
    Ename    VARCHAR(50),
    DeptName VARCHAR(50),
    FOREIGN KEY (DeptName) REFERENCES norm_departments (DeptName)
);

INSERT INTO norm_staff (EmpNo, Ename, DeptName)
SELECT EmpNo, Ename, DeptName
FROM staff_flat;

-- The update anomaly is solved: Finance changes in one place only
UPDATE norm_departments
SET DeptLocation = 'Jinja'
WHERE DeptName = 'Finance';

SELECT s.Ename, d.DeptName, d.DeptLocation
FROM norm_staff s
JOIN norm_departments d ON s.DeptName = d.DeptName;

-- The insert anomaly is solved: a department can exist with no employees
INSERT INTO norm_departments (DeptName, DeptLocation) VALUES ('Training', 'Entebbe');

-- ------------------------------------------------------------
-- PRACTICE (run these before the clean up below)
-- ------------------------------------------------------------

-- Task 1: Write an UPDATE on staff_flat that changes Finance's location to Jinja.
--         How many rows change? Expect 2. Then roll back or rebuild the table.
-- Your answer:


-- Task 2: Add employee 7006 (Ssemakula, no department) to norm_staff.
--         Write a comment explaining whether the foreign key allows it, and why.
-- Your answer:


-- Task 3: Write a comment explaining why a department with no employees could not be
--         stored in staff_flat without inventing an employee.
-- Your answer:


-- ------------------------------------------------------------
-- CLEAN UP when you have finished
-- ------------------------------------------------------------

DROP TABLE norm_staff;
DROP TABLE norm_departments;
DROP TABLE staff_flat;

