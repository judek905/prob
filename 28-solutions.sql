-- ============================================================
-- PART 28: SOLUTIONS
-- Try each exercise in Part 27 before reading its answer.
-- Exercise 19 needs the projects and assignments tables, which are rebuilt below.
-- ============================================================

USE humanresource;

-- Setup for exercise 19 (same as Part 17)
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS projects;

CREATE TABLE projects (
    ProjectNo INT PRIMARY KEY,
    Title     VARCHAR(80) NOT NULL
);

INSERT INTO projects (ProjectNo, Title) VALUES
(1, 'Payroll System Upgrade'),
(2, 'Staff Training Portal'),
(3, 'Recruitment Drive');

CREATE TABLE assignments (
    EmpNo     INT,
    ProjectNo INT,
    PRIMARY KEY (EmpNo, ProjectNo),
    FOREIGN KEY (EmpNo)     REFERENCES employees(EmpNo),
    FOREIGN KEY (ProjectNo) REFERENCES projects(ProjectNo)
);

INSERT INTO assignments (EmpNo, ProjectNo) VALUES
(7001, 1), (7001, 3), (7002, 1),
(7003, 2), (7004, 2), (7005, 1);

-- ------------------------------------------------------------
-- STAGE 1
-- ------------------------------------------------------------

-- Exercise 1
SELECT Ename, Job, Salary
FROM employees;

-- Exercise 2 (expect Achieng 2800, then Mugisha 2600)
SELECT Ename, Salary
FROM employees
WHERE DeptNo = 30
ORDER BY Salary DESC;

-- Exercise 3 (expect Achieng, Atim, Nakato, Namukasa)
SELECT Ename
FROM employees
WHERE Ename LIKE 'N%' OR Ename LIKE 'A%'
ORDER BY Ename;

-- Exercise 4 (expect Nakato 4500 and Atim 3900)
SELECT Ename, Salary
FROM employees
ORDER BY Salary DESC
LIMIT 2;

-- Exercise 5 (expect Achieng, Mugisha and Atim; Ssemakula is left out because his department is NULL)
SELECT Ename
FROM employees
WHERE DeptNo NOT IN (10, 20);

-- ------------------------------------------------------------
-- STAGE 2
-- ------------------------------------------------------------

-- Exercise 6 (expect NAKATO 375.00, OKELLO 266.67, ACHIENG 233.33, and so on)
SELECT UPPER(Ename) AS Name,
       ROUND(Salary / 12, 2) AS MonthlySalary
FROM employees;

-- Exercise 7 (expect Ssemakula, hired 2023-02-14)
SELECT Ename, HireDate
FROM employees
WHERE DeptNo IS NULL;

-- Exercise 8 (Ssemakula shows 'Not assigned')
SELECT Ename,
       COALESCE(DeptNo, 'Not assigned') AS Department
FROM employees;

-- Exercise 9 (the order of the WHEN lines matters)
SELECT Ename,
       Salary,
       CASE
           WHEN Salary >= 3500 THEN 'High'
           WHEN Salary >= 2500 THEN 'Medium'
           ELSE 'Entry'
       END AS Band
FROM employees;

-- ------------------------------------------------------------
-- STAGE 3
-- ------------------------------------------------------------

-- Exercise 10 (expect 7 and 6)
SELECT COUNT(*)      AS TotalEmployees,
       COUNT(DeptNo) AS WithDepartment
FROM employees;

-- Exercise 11 (expect 22400.00 and 3200)
SELECT SUM(Salary) AS TotalSalary,
       AVG(Salary) AS AverageSalary
FROM employees;

-- Exercise 12 (NULL group appears first)
SELECT DeptNo, COUNT(*) AS Staff
FROM employees
GROUP BY DeptNo
ORDER BY DeptNo;

-- Exercise 13 (expect 10, 20 and 40)
SELECT DeptNo, AVG(Salary) AS AverageSalary
FROM employees
GROUP BY DeptNo
HAVING AVG(Salary) > 3000;

-- ------------------------------------------------------------
-- STAGE 4
-- ------------------------------------------------------------

-- Exercise 14 (six rows)
SELECT e.Ename, d.DeptName
FROM employees e
INNER JOIN departments d ON e.DeptNo = d.DeptNo;

-- Exercise 15 (COUNT(e.EmpNo) gives Marketing 0; COUNT(*) would give 1)
SELECT d.DeptName, COUNT(e.EmpNo) AS Staff
FROM departments d
LEFT JOIN employees e ON d.DeptNo = e.DeptNo
GROUP BY d.DeptNo, d.DeptName
ORDER BY d.DeptNo;

-- Exercise 16 (expect Namukasa and Achieng)
SELECT e.Ename, e.Salary, e.DeptNo
FROM employees e
WHERE e.Salary > (SELECT AVG(x.Salary)
                  FROM employees x
                  WHERE x.DeptNo = e.DeptNo);

-- Exercise 17 (expect Marketing)
SELECT d.DeptName
FROM departments d
LEFT JOIN employees e ON d.DeptNo = e.DeptNo
WHERE e.EmpNo IS NULL;

-- Exercise 18 (twelve rows)
SELECT Ename AS Name FROM employees
UNION
SELECT DeptName FROM departments
ORDER BY Name;

-- Exercise 19 (expect Nakato, Namukasa and Okello)
SELECT e.Ename
FROM employees e
JOIN assignments a ON e.EmpNo = a.EmpNo
JOIN projects p    ON p.ProjectNo = a.ProjectNo
WHERE p.Title = 'Payroll System Upgrade'
ORDER BY e.Ename;

-- Exercise 20 (expect Okello with Namukasa, and Achieng with Mugisha)
SELECT a.Ename AS Employee1,
       b.Ename AS Employee2,
       a.DeptNo
FROM employees a
JOIN employees b
    ON a.DeptNo = b.DeptNo
   AND a.EmpNo < b.EmpNo;

-- ------------------------------------------------------------
-- STAGE 5
-- ------------------------------------------------------------

-- Exercise 21 (expect Nakato and Atim)
DROP VIEW IF EXISTS high_earners;

CREATE VIEW high_earners AS
SELECT e.Ename, d.DeptName, e.Salary
FROM employees e
LEFT JOIN departments d ON e.DeptNo = d.DeptNo
WHERE e.Salary > 3500;

SELECT * FROM high_earners;

-- Exercise 22
SELECT Ename,
       Salary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM employees;

-- Exercise 23
SELECT Ename,
       DeptNo,
       Salary,
       ROW_NUMBER() OVER (PARTITION BY DeptNo ORDER BY Salary DESC) AS RankInDept
FROM employees;

-- Exercise 24 (expect departments 10, 20 and 40)
WITH dept_avg AS (
    SELECT DeptNo, AVG(Salary) AS AverageSalary
    FROM employees
    GROUP BY DeptNo
)
SELECT DeptNo, AverageSalary
FROM dept_avg
WHERE AverageSalary > (SELECT AVG(Salary) FROM employees);

-- Exercise 25 (running totals: 4500, 7700, 10500, 13100, 16600, 18500, 22400)
SELECT EmpNo,
       Ename,
       Salary,
       SUM(Salary) OVER (ORDER BY EmpNo) AS RunningTotal
FROM employees;

-- Exercise 26 (Ssemakula appears as the top of the NULL group)
WITH ranked AS (
    SELECT Ename,
           DeptNo,
           Salary,
           ROW_NUMBER() OVER (PARTITION BY DeptNo ORDER BY Salary DESC) AS rn
    FROM employees
)
SELECT Ename, DeptNo, Salary
FROM ranked
WHERE rn = 1
ORDER BY DeptNo;

-- ------------------------------------------------------------
-- STAGE 6
-- ------------------------------------------------------------

-- Exercise 27
DROP TABLE IF EXISTS leave_requests;

CREATE TABLE leave_requests (
    LeaveID   INT AUTO_INCREMENT PRIMARY KEY,
    EmpNo     INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate   DATE NOT NULL,
    DaysTaken INT NOT NULL,
    Status    VARCHAR(20) DEFAULT 'Pending',
    CONSTRAINT chk_days CHECK (DaysTaken > 0),
    FOREIGN KEY (EmpNo) REFERENCES employees(EmpNo)
);

INSERT INTO leave_requests (EmpNo, StartDate, EndDate, DaysTaken)
VALUES (7001, '2026-11-02', '2026-11-04', 3),
       (7003, '2026-12-01', '2026-12-05', 5);

SELECT e.Ename, l.StartDate, l.EndDate, l.DaysTaken, l.Status
FROM leave_requests l
JOIN employees e ON l.EmpNo = e.EmpNo;

-- Exercise 28 (raise shows 2940.00 and 2730.00, then rollback restores 2800.00 and 2600.00)
START TRANSACTION;

UPDATE employees
SET Salary = Salary * 1.05
WHERE DeptNo = 30;

SELECT Ename, Salary FROM employees WHERE DeptNo = 30;

ROLLBACK;

SELECT Ename, Salary FROM employees WHERE DeptNo = 30;

-- Exercise 29: problems with a single orders table
-- 1. Customer details repeat on every order. Changing a phone number means updating many rows,
--    and missing one leaves the data contradicting itself (update anomaly).
-- 2. A customer cannot be stored until they place an order (insert anomaly).
-- 3. Deleting a customer's last order also deletes their details (delete anomaly).
-- Product names and prices repeat too, and old orders lose the price they were charged.

CREATE TABLE customers (
    CustomerID    INT PRIMARY KEY,
    CustomerName  VARCHAR(80) NOT NULL,
    CustomerPhone VARCHAR(20)
);

CREATE TABLE products (
    ProductID    INT PRIMARY KEY,
    ProductName  VARCHAR(80) NOT NULL,
    CurrentPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    OrderNo    INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate  DATE,
    FOREIGN KEY (CustomerID) REFERENCES customers (CustomerID)
);

CREATE TABLE order_items (
    OrderNo   INT,
    ProductID INT,
    Quantity  INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,   -- price at the time of sale, kept for history
    PRIMARY KEY (OrderNo, ProductID),
    FOREIGN KEY (OrderNo)   REFERENCES orders (OrderNo),
    FOREIGN KEY (ProductID) REFERENCES products (ProductID)
);

-- Clean up the solution tables for exercise 29 (uncomment to remove them)
-- DROP TABLE order_items;
-- DROP TABLE orders;
-- DROP TABLE products;
-- DROP TABLE customers;

