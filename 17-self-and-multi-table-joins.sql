-- ============================================================
-- PART 17: SELF JOINS AND MULTI-TABLE JOINS
-- This part creates two small tables: projects and assignments.
-- They are used again in later practice, so keep them.
-- ============================================================

USE humanresource;

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

-- Self join: pairs of employees in the same department
-- (expect Okello with Namukasa, and Achieng with Mugisha)
SELECT a.Ename AS Employee1,
       b.Ename AS Employee2,
       a.DeptNo
FROM employees a
JOIN employees b
    ON a.DeptNo = b.DeptNo
   AND a.EmpNo < b.EmpNo;

-- Self join: who earns more than a colleague in the same department
SELECT a.Ename AS HigherPaid,
       b.Ename AS LowerPaid
FROM employees a
JOIN employees b
    ON a.DeptNo = b.DeptNo
   AND a.Salary > b.Salary;

-- Three tables chained together (expect 6 rows)
SELECT e.Ename, p.Title
FROM employees e
JOIN assignments a ON e.EmpNo = a.EmpNo
JOIN projects p    ON p.ProjectNo = a.ProjectNo
ORDER BY p.Title, e.Ename;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Count the employees on each project, including projects with nobody.
--         Expect Payroll System Upgrade 3, Staff Training Portal 2, Recruitment Drive 1.
-- Your answer:


-- Task 2: Show the names of the people on the Staff Training Portal. Expect Achieng and Mugisha.
-- Your answer:


-- Task 3: Which pairs of employees share a project? Hint: join assignments to itself on ProjectNo.
--         Expect three pairs, all on the Payroll System Upgrade.
-- Your answer:


