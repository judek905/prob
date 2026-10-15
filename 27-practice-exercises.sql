-- ============================================================
-- PART 27: PRACTICE EXERCISES
-- Write each query under its exercise, run it, then check Part 28.
--
-- Setup notes:
--   Start from the Part 03 sample database.
--   Exercise 19 needs the projects and assignments tables from Part 17.
--   Exercise 21 creates a view and exercise 27 creates a table.
--   If you need to build them again, first run:
--       DROP VIEW IF EXISTS high_earners;
--       DROP TABLE IF EXISTS leave_requests;
-- ============================================================

USE humanresource;

-- ------------------------------------------------------------
-- STAGE 1: Querying basics (Parts 7 to 9)
-- ------------------------------------------------------------

-- Exercise 1: Show the name, job and salary of every employee.
-- Your answer:


-- Exercise 2: Show the name and salary of employees in department 30,
--             sorted from highest salary to lowest.
-- Your answer:


-- Exercise 3: Find the names of employees whose names start with N or A.
-- Your answer:


-- Exercise 4: Show the names of the two highest-paid employees.
-- Your answer:


-- Exercise 5: List the names of employees who work in a department but are not in department 10 or 20.
-- Your answer:


-- ------------------------------------------------------------
-- STAGE 2: Functions, NULL and CASE (Parts 10 to 12)
-- ------------------------------------------------------------

-- Exercise 6: Show each employee's name in capitals, along with their monthly salary
--             rounded to two decimal places.
-- Your answer:


-- Exercise 7: Find employees who have no department, and show their name and hire date.
-- Your answer:


-- Exercise 8: Show every employee's name and department number, displaying 'Not assigned'
--             where there is no department.
-- Your answer:


-- Exercise 9: Label each employee's salary as High (3500 or more), Medium (2500 to 3499)
--             or Entry (below 2500).
-- Your answer:


-- ------------------------------------------------------------
-- STAGE 3: Summarising (Parts 13 and 14)
-- ------------------------------------------------------------

-- Exercise 10: How many employees are there, and how many of them have a department?
-- Your answer:


-- Exercise 11: What are the total and average salaries for the whole company?
-- Your answer:


-- Exercise 12: How many employees are in each department? Include the group with no department.
-- Your answer:


-- Exercise 13: Which departments have an average salary above 3000?
-- Your answer:


-- ------------------------------------------------------------
-- STAGE 4: Combining tables (Parts 15 to 19)
-- ------------------------------------------------------------

-- Exercise 14: List each employee with the name of their department.
--              Only employees who have a department should appear.
-- Your answer:


-- Exercise 15: List all departments, including those with no employees,
--              with the number of employees in each.
-- Your answer:


-- Exercise 16: Find the employees who earn more than the average salary of their own department.
-- Your answer:


-- Exercise 17: Find the departments that have no employees at all.
-- Your answer:


-- Exercise 18: Produce one alphabetical list containing every employee name and every department name.
-- Your answer:


-- Exercise 19: Using the projects and assignments tables, list the employees working on
--              the Payroll System Upgrade.
-- Your answer:


-- Exercise 20: List every pair of different employees who work in the same department,
--              without repeating any pair.
-- Your answer:


-- ------------------------------------------------------------
-- STAGE 5: Advanced queries (Parts 20 to 26)
-- ------------------------------------------------------------

-- Exercise 21: Create a view called high_earners that shows the name, department
--              and salary of employees earning more than 3500. Then select everything from the view.
-- Your answer:


-- Exercise 22: Use a window function to rank all employees by salary, highest first.
-- Your answer:


-- Exercise 23: For each department, number the employees by salary, highest first,
--              starting again at 1 for each department.
-- Your answer:


-- Exercise 24: Use a CTE to list the departments whose average salary is higher than the company average.
-- Your answer:


-- Exercise 25: Show each employee's salary alongside a running total of salaries,
--              ordered by employee number.
-- Your answer:


-- Exercise 26: Find the top earner in each department. Think carefully about how the
--              employee with no department should be treated.
-- Your answer:


-- ------------------------------------------------------------
-- STAGE 6: Design and safety (Parts 4 to 6 and 22 to 24)
-- ------------------------------------------------------------

-- Exercise 27: Create a table called leave_requests with these columns:
--   LeaveID   an automatically numbered primary key
--   EmpNo     must match an employee
--   StartDate and EndDate
--   DaysTaken must be greater than zero
--   Status    defaults to 'Pending'
-- Then insert two leave requests and list them with each employee's name.
-- Your answer:


-- Exercise 28: Inside a transaction, give every Sales employee a 5% raise. Look at the results,
--              then undo the change. Confirm the salaries match their original values.
-- Your answer:


-- Exercise 29: A shop keeps one table called orders with these columns: OrderNo, CustomerName,
--              CustomerPhone, ProductName, ProductPrice and Quantity.
--              Write a comment describing three problems with this design.
--              Then write CREATE TABLE statements for a better split into tables.
-- Your answer:


