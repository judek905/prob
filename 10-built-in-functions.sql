-- ============================================================
-- PART 10: BUILT-IN FUNCTIONS
-- Date results depend on today's date, so they will change over time.
-- ============================================================

USE humanresource;

-- Text functions
SELECT UPPER(Ename), LOWER(Job), LENGTH(Ename)
FROM employees;

-- Join text together: "Nakato (Manager)"
SELECT CONCAT(Ename, ' (', Job, ')') AS Label
FROM employees;

-- SUBSTRING and LEFT: positions start at 1
SELECT SUBSTRING(Ename, 1, 3) AS Prefix,
       LEFT(Ename, 1)         AS Initial
FROM employees;

-- REPLACE and TRIM
SELECT REPLACE(Job, 'Rep', 'Representative') AS FullJob
FROM employees
WHERE Job LIKE '%Rep%';

SELECT TRIM('   spaced out   ') AS Cleaned;

-- Number functions (Nakato's TenPercent is 450.00)
SELECT Ename,
       Salary,
       ROUND(Salary * 0.10, 2) AS TenPercent
FROM employees;

SELECT CEIL(2.5)  AS CeilingExample,
       FLOOR(2.5) AS FloorExample,
       ABS(-2.5)  AS AbsoluteExample,
       MOD(10, 3) AS Remainder;

-- Date functions
SELECT Ename,
       HireDate,
       YEAR(HireDate)                           AS HireYear,
       TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) AS YearsWithCompany,
       DATE_FORMAT(HireDate, '%d %M %Y')        AS HireDateFormatted
FROM employees;

-- A date one year after hire
SELECT Ename, DATE_ADD(HireDate, INTERVAL 1 YEAR) AS FirstReview
FROM employees;

-- Functions inside WHERE (expect Nakato, Namukasa and Atim)
SELECT Ename FROM employees WHERE YEAR(HireDate) < 2020;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Each employee's name in capitals, and their monthly salary rounded to the nearest whole number.
--         Expect Nakato 375 and Okello 267.
-- Your answer:


-- Task 2: Employees hired in 2020 or later. Expect Okello, Achieng, Mugisha and Ssemakula.
-- Your answer:


-- Task 3: Each employee's name with the first three letters of their job title.
-- Your answer:


