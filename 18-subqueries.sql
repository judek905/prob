-- ============================================================
-- PART 18: SUBQUERIES
-- ============================================================

USE humanresource;

-- Scalar subquery: earns more than the company average (expect Nakato, Namukasa and Atim)
SELECT Ename, Salary
FROM employees
WHERE Salary > (SELECT AVG(Salary) FROM employees);

-- List subquery: employees in departments located in Kampala (expect Nakato and Atim)
SELECT Ename
FROM employees
WHERE DeptNo IN (SELECT DeptNo
                 FROM departments
                 WHERE Location = 'Kampala');

-- Derived table: department averages above 3000 (expect 10, 20 and 40)
SELECT DeptNo, AvgPay
FROM (SELECT DeptNo, AVG(Salary) AS AvgPay
      FROM employees
      GROUP BY DeptNo) AS dept_avg
WHERE AvgPay > 3000;

-- Correlated subquery: earns more than their own department's average
-- (expect Namukasa and Achieng)
SELECT e.Ename, e.Salary, e.DeptNo
FROM employees e
WHERE e.Salary > (SELECT AVG(x.Salary)
                  FROM employees x
                  WHERE x.DeptNo = e.DeptNo);

-- EXISTS: departments with at least one employee (expect 4 rows, not Marketing)
SELECT d.DeptName
FROM departments d
WHERE EXISTS (SELECT 1
              FROM employees e
              WHERE e.DeptNo = d.DeptNo);

-- NOT EXISTS: departments with no employees (expect Marketing)
SELECT d.DeptName
FROM departments d
WHERE NOT EXISTS (SELECT 1
                  FROM employees e
                  WHERE e.DeptNo = d.DeptNo);

-- The NOT IN trap: returns NO rows, because the list contains NULL
SELECT DeptName
FROM departments
WHERE DeptNo NOT IN (SELECT DeptNo FROM employees);

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: The employee with the highest salary, using a subquery with MAX. Expect Nakato.
-- Your answer:


-- Task 2: Employees in the Finance department, using IN with a subquery on departments.
--         Expect Okello and Namukasa.
-- Your answer:


-- Task 3: Departments whose highest salary is above 3800. Expect Human Resources and Operations.
--         Hint: use a correlated subquery with MAX.
-- Your answer:


