-- ============================================================
-- PART 03: SETUP
-- Run this whole script to create the humanresource sample database.
--
-- WARNING: the first statement DELETES an existing humanresource database.
-- If you built one for your SQL lab, back it up or rename it first.
--
-- In MySQL Workbench, press Ctrl+Shift+Enter to run the whole script.
-- ============================================================

DROP DATABASE IF EXISTS humanresource;
CREATE DATABASE humanresource;
USE humanresource;

CREATE TABLE departments (
    DeptNo   INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE employees (
    EmpNo    INT PRIMARY KEY,
    Ename    VARCHAR(50) NOT NULL,
    Job      VARCHAR(50),
    Salary   DECIMAL(10,2) CHECK (Salary > 0),
    DeptNo   INT,
    HireDate DATE,
    FOREIGN KEY (DeptNo) REFERENCES departments(DeptNo)
);

INSERT INTO departments (DeptNo, DeptName, Location) VALUES
(10, 'Human Resources', 'Kampala'),
(20, 'Finance',         'Entebbe'),
(30, 'Sales',           'Jinja'),
(40, 'Operations',      'Kampala'),
(50, 'Marketing',       'Jinja');

INSERT INTO employees (EmpNo, Ename, Job, Salary, DeptNo, HireDate) VALUES
(7001, 'Nakato',    'Manager',    4500.00, 10,   '2019-03-01'),
(7002, 'Okello',    'Accountant', 3200.00, 20,   '2020-07-15'),
(7003, 'Achieng',   'Sales Rep',  2800.00, 30,   '2021-01-10'),
(7004, 'Mugisha',   'Sales Rep',  2600.00, 30,   '2022-05-20'),
(7005, 'Namukasa',  'Analyst',    3500.00, 20,   '2018-11-03'),
(7006, 'Ssemakula', 'Clerk',      1900.00, NULL, '2023-02-14'),
(7007, 'Atim',      'Supervisor', 3900.00, 40,   '2017-08-22');

-- ------------------------------------------------------------
-- CHECK THE SETUP
-- ------------------------------------------------------------

SHOW TABLES;

SELECT COUNT(*) AS EmployeeCount FROM employees;     -- expect 7
SELECT COUNT(*) AS DepartmentCount FROM departments; -- expect 5

