create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

Describe Accounts;
Describe Transactions;
describe Branches;
describe AccountBranches;
describe Loans;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

SELECT * FROM ACCOUNTS;

select * from customers;

-- Insert 4 Records into Customers Table
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into Branches Table
INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

-- Insert 5 Records into Loans Table
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

-- Display customer Table.
select * from customers;

-- Display all customer FirstName in uppercase.
SELECT
FirstName,
UPPER(FirstName) AS UpperCaseName
FROM customers;

-- Display all customer FirstName in lowercase.
SELECT
FirstName,
LOWER(FirstName) AS LowerCaseName
FROM customers;

-- Find the total number of characters in each customer FirstName .
SELECT
FirstName,
LENGTH(FirstName) AS NameLength
FROM customers;

-- Display only the first three characters of customer FirstName .
SELECT
FirstName,
LEFT(FirstName,3) AS Initials
FROM customers;

-- Combine customer's FirstName with LastName.
SELECT
CONCAT(FirstName,' - ',LastName) AS FullName
FROM customers;

-- Rounds a decimal number to the nearest whole number.
SELECT ROUND(1256.75) AS Rounded_Value;

-- Returns the smallest integer greater than or equal to a number.
SELECT CEIL(1256.25) AS Ceiling_Value;

-- Returns the largest integer less than or equal to a number.
SELECT FLOOR(1256.75) AS Floor_Value;

-- Returns the absolute (positive) value of a number.
SELECT ABS(-2500) AS Absolute_Value;

-- Returns the remainder after dividing one number by another.
SELECT MOD(25,4) AS Remainder;

-- Display customer Table
select * from customers;

-- Display the current system date. 
SELECT CURDATE(); 

-- Display the current system date and time.
SELECT NOW();

-- Display the Birth of year.
SELECT
CustomerID,
YEAR(DateOfBirth) AS BirthYear
FROM customers;

-- Display the Birth month.
SELECT
CustomerID,
MONTH(DateOfBirth) AS BirthMonth
FROM customers;

-- Calculate the number of days since BirthDate.
SELECT
CustomerID,
DATEDIFF(CURDATE(),DateOfBirth) AS Days
FROM customers;

-- Categorize customers as Adult or Young based on their birth year.
SELECT
    FirstName,
    DateOfBirth,
    IF(YEAR(DateOfBirth) <= 1995,
       'Adult',
       'Young') AS Category
FROM Customers;

-- Display 'Not Available' if a phone number is NULL.
SELECT
    FirstName,
    IFNULL(Phone, 'Not Available') AS PhoneNumber
FROM Customers;

-- Find the latest birth date.
SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

-- Find the earliest birth date.
SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

-- Compare two customer names.
SELECT
    FirstName,
    NULLIF(FirstName,'Priya') AS Result
FROM Customers;

Select * from Accounts;

-- Calculate the total balance maintained across all customer accounts.
SELECT SUM(Balance) as total_balance
FROM Accounts;

-- Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
SELECT AVG(Balance) AS average_balance
FROM Accounts;

-- Identify the highest balance maintained in any customer account.
SELECT MAX(Balance) AS highest_balance
FROM Accounts;

-- Identify the lowest balance maintained in any customer account.
SELECT MIN(Balance) AS lowest_balance
FROM Accounts;

-- Determine the total number of customer accounts available in the system.
SELECT COUNT(*) AS total_accounts
FROM Accounts;

-- The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and 
-- identify which account type is attracting the highest total deposits from customers.
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

-- The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
SELECT 
    AccountType,
    SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;