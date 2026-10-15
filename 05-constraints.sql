-- ============================================================
-- PART 05: CONSTRAINTS
-- Uses a demo table, so the sample tables are not changed.
-- ============================================================

USE humanresource;

DROP TABLE IF EXISTS constraint_demo;

CREATE TABLE constraint_demo (
    DemoID  INT PRIMARY KEY,
    Email   VARCHAR(100) UNIQUE,
    Name    VARCHAR(50) NOT NULL,
    Score   INT DEFAULT 0,
    Level   INT CHECK (Level BETWEEN 1 AND 5),
    DeptNo  INT,
    CONSTRAINT fk_demo_dept FOREIGN KEY (DeptNo) REFERENCES departments(DeptNo)
);

-- Valid rows. Notice that NULL is allowed in the optional columns.
INSERT INTO constraint_demo (DemoID, Email, Name, Level, DeptNo)
VALUES (1, 'a@example.com', 'Nakato', 3, 10);

INSERT INTO constraint_demo (DemoID, Name)
VALUES (2, 'Okello');

SELECT * FROM constraint_demo;

-- ------------------------------------------------------------
-- INTENTIONAL ERRORS
-- Each statement below should FAIL. Uncomment them one at a time to see the error.
-- ------------------------------------------------------------

-- 1. Duplicate primary key (DemoID 1 already exists)
-- INSERT INTO constraint_demo (DemoID, Name) VALUES (1, 'Duplicate');

-- 2. Duplicate UNIQUE email
-- INSERT INTO constraint_demo (DemoID, Email, Name) VALUES (3, 'a@example.com', 'Copy');

-- 3. NOT NULL violated (Name is missing)
-- INSERT INTO constraint_demo (DemoID, Name) VALUES (4, NULL);

-- 4. CHECK violated (Level must be between 1 and 5)
-- INSERT INTO constraint_demo (DemoID, Name, Level) VALUES (5, 'Test', 9);

-- 5. FOREIGN KEY violated (department 99 does not exist)
-- INSERT INTO constraint_demo (DemoID, Name, DeptNo) VALUES (6, 'Test', 99);

-- ------------------------------------------------------------
-- ADDING A CONSTRAINT TO AN EXISTING TABLE
-- ------------------------------------------------------------

ALTER TABLE departments ADD CONSTRAINT uq_deptname UNIQUE (DeptName);

-- Remove it again, so the sample data is back to its original state
ALTER TABLE departments DROP INDEX uq_deptname;

-- See how a table's rules are written down
SHOW CREATE TABLE constraint_demo;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: In constraint_demo, insert a row with DemoID 3, Name 'Wasswa' and Level 5. It should succeed.
-- Your answer:


-- Task 2: Create a table called members with MemberID (primary key), Age (INT, must be at least 18)
--         and Phone (VARCHAR, must be unique). Then try to insert an age of 17 and watch it fail.
-- Your answer:


-- ------------------------------------------------------------
-- CLEAN UP
-- ------------------------------------------------------------

DROP TABLE constraint_demo;

