-- ============================================================
-- PART 24: RELATIONSHIPS
-- Turns a small library design into tables, then queries it.
-- ============================================================

USE humanresource;

DROP TABLE IF EXISTS library_loans;
DROP TABLE IF EXISTS library_books;
DROP TABLE IF EXISTS library_members;

-- One-to-many: a member has many loans, and a book has many loans
CREATE TABLE library_members (
    MemberID INT PRIMARY KEY,
    FullName VARCHAR(80) NOT NULL
);

CREATE TABLE library_books (
    BookID INT PRIMARY KEY,
    Title  VARCHAR(120) NOT NULL,
    Author VARCHAR(80)
);

CREATE TABLE library_loans (
    LoanID     INT AUTO_INCREMENT PRIMARY KEY,
    MemberID   INT NOT NULL,
    BookID     INT NOT NULL,
    LoanDate   DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES library_members (MemberID),
    FOREIGN KEY (BookID)   REFERENCES library_books (BookID)
);

INSERT INTO library_members (MemberID, FullName) VALUES
(1, 'Nakato'),
(2, 'Okello');

INSERT INTO library_books (BookID, Title, Author) VALUES
(101, 'Introduction to SQL', 'J. Doe'),
(102, 'Data Structures',     'A. Smith'),
(103, 'Web Design Basics',   'M. Lee');

INSERT INTO library_loans (MemberID, BookID, LoanDate, ReturnDate) VALUES
(1, 101, '2026-09-01', '2026-09-15'),
(1, 102, '2026-10-01', NULL),
(2, 101, '2026-10-05', NULL);

-- Books currently on loan (a NULL ReturnDate means not yet returned)
-- Expect Data Structures and Introduction to SQL
SELECT b.Title, m.FullName, l.LoanDate
FROM library_loans l
JOIN library_books b   ON b.BookID = l.BookID
JOIN library_members m ON m.MemberID = l.MemberID
WHERE l.ReturnDate IS NULL;

-- Number of loans per member (expect Nakato 2 and Okello 1)
SELECT m.FullName, COUNT(l.LoanID) AS Loans
FROM library_members m
LEFT JOIN library_loans l ON l.MemberID = m.MemberID
GROUP BY m.MemberID, m.FullName;

-- Books that have never been loaned (expect Web Design Basics)
SELECT b.Title
FROM library_books b
LEFT JOIN library_loans l ON l.BookID = b.BookID
WHERE l.LoanID IS NULL;

-- ------------------------------------------------------------
-- PRACTICE
-- ------------------------------------------------------------

-- Task 1: Count the loans that are still open. Expect 2.
-- Your answer:


-- Task 2: Find the member with the most loans. Hint: GROUP BY, ORDER BY and LIMIT 1. Expect Nakato.
-- Your answer:


-- Task 3: Write CREATE TABLE for a junction table called book_authors that lets one book
--         have several authors. Hint: its key is the pair of BookID and an author name.
-- Your answer:


-- ------------------------------------------------------------
-- CLEAN UP
-- ------------------------------------------------------------

DROP TABLE library_loans;
DROP TABLE library_books;
DROP TABLE library_members;

