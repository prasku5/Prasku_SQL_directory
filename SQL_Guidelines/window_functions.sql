-- 1. CUME_DIST() Example
-- Table DDL
CREATE TABLE Sales (
    SaleID INT,
    Salesperson VARCHAR(50),
    SalesAmount DECIMAL(10, 2)
);

-- Insert example data
INSERT INTO Sales VALUES (1, 'Alice', 1000.00), 
                         (2, 'Bob', 1500.00),
                         (3, 'Charlie', 1200.00),
                         (4, 'Alice', 1700.00),
                         (5, 'Bob', 1500.00);

-- Query to calculate cumulative distribution
SELECT 
    Salesperson, 
    SalesAmount, 
    CUME_DIST() OVER (ORDER BY SalesAmount DESC) AS CumeDist
FROM 
    Sales;

-- 2. DENSE_RANK() Example
-- Table DDL
CREATE TABLE Scores (
    ID INT,
    Student VARCHAR(50),
    Score INT
);

-- Insert example data
INSERT INTO Scores VALUES (1, 'John', 95), 
                          (2, 'Jane', 90),
                          (3, 'John', 95),
                          (4, 'Jane', 85),
                          (5, 'Joe', 90);

-- Query to calculate dense rank
SELECT 
    Student, 
    Score, 
    DENSE_RANK() OVER (ORDER BY Score DESC) AS Rank_generated 
FROM 
    Scores;

-- 3. FIRST_VALUE() Example - This will return the first value in the window frame based on the specified order. 
-- for example below query will return the first salary in the window frame which is  9000.00
-- This is useful when you want to get the first value in a sorted window frame.

-- Table DDL
CREATE TABLE Employees (
    EmpID INT,
    EmpName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert example data
INSERT INTO Employees VALUES (1, 'Alice', 6000.00), 
                             (2, 'Bob', 7000.00),
                             (3, 'Charlie', 8000.00),
                             (4, 'David', 9000.00);

-- Query to get first salary in the window frame
SELECT 
    EmpName, 
    Salary, 
    FIRST_VALUE(Salary) OVER (ORDER BY Salary DESC) AS FirstSalary
FROM 
    Employees;

-- 4. LAG() Example
-- Table DDL
CREATE TABLE Visits (
    VisitID INT,
    UserID INT,
    VisitDate DATE
);

-- Insert example data
INSERT INTO Visits VALUES (1, 101, '2024-01-01'), 
                          (2, 102, '2024-01-02'),
                          (3, 101, '2024-01-05'),
                          (4, 102, '2024-01-07'),
                          (5, 103, '2024-01-10');

-- Query to calculate previous visit date using LAG
SELECT 
    UserID, 
    VisitDate, 
    LAG(VisitDate, 1) OVER (PARTITION BY UserID ORDER BY VisitDate) AS PreviousVisit
FROM 
    Visits;

-- 5. LAST_VALUE() Example
-- Table DDL
CREATE TABLE Orders (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT
);

-- Insert example data
INSERT INTO Orders
VALUES (1, 'Product A', 10),
    (2, 'Product B', 20),
    (3, 'Product C', 15),
    (4, 'Product A', 12);

-- Query to get last value in window frame
-- Here we are using ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING to consider all rows in the window frame
-- This will return the last quantity in the window frame which is 20 in this case as it is the last value in the sorted window frame. 
-- UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING are used to consider all rows in the window frame.
-- If you want to consider only the current row and the last row before that, you can use ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING instead. 
-- This will return the current row's quantity and the next row's quantity in the window frame.
-- If you want to consider only the current row and the previous row, you can use ROWS BETWEEN 1 PRECEDING AND CURRENT ROW instead.
-- This will return the current row's quantity and the previous row's quantity in the window frame.
-- If you want to consider a fixed number of rows before and after the current row, you can use ROWS BETWEEN n PRECEDING AND n FOLLOWING instead.
-- This will return the current row's quantity and the n rows before and after the current row in the window frame.
-- If you want to consider all rows before the current row, you can use ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW instead.
-- This will return the current row's quantity and all rows before the current row in the window frame.
-- If you want to consider all rows after the current row, you can use ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING instead.
-- This will return the current row's quantity and all rows after the current row in the window frame.
-- If we want to include current as well then we can use ROWS BETWEEN CURRENT ROW AND unbouned following then it will include current row as well.

SELECT 
    Product, 
    Quantity, 
    LAST_VALUE(Quantity) OVER (ORDER BY Quantity DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LastQty
FROM 
    Orders;

-- 6. LEAD() Example
-- Table DDL
CREATE TABLE Interviews (
    CandidateID INT,
    InterviewDate DATE,
    Score INT
);

-- Insert example data
INSERT INTO Interviews VALUES (1, '2024-01-10', 85), 
                              (2, '2024-01-15', 90),
                              (3, '2024-01-20', 88),
                              (4, '2024-01-25', 92);

-- Query to calculate the next interview date using LEAD
SELECT 
    CandidateID, 
    InterviewDate, 
    LEAD(InterviewDate, 1) OVER (ORDER BY InterviewDate) AS NextInterviewDate
FROM 
    Interviews;

-- 7. NTH_VALUE() Example
-- Table DDL
CREATE TABLE SalesReps (
    RepID INT,
    SalesAmount DECIMAL(10, 2)
);

-- Insert example data
INSERT INTO SalesReps VALUES (1, 5000.00), 
                             (2, 7000.00),
                             (3, 6500.00),
                             (4, 9000.00);

-- Query to get the 2nd highest sales amount using NTH_VALUE
SELECT 
    RepID, 
    SalesAmount, 
    NTH_VALUE(SalesAmount, 2) OVER (ORDER BY SalesAmount DESC) AS SecondHighestSales
FROM 
    SalesReps;

-- 8. NTILE() Example 
-- NTILE() function is used to divide the result set into a specified number of approximately equal parts or buckets. 
-- For example, if you want to divide the employees into quartiles based on their salary,
-- you can use NTILE(4) to assign quartile numbers to each employee.
-- In this example, we are dividing the employees into 4 quartiles based on their salary.
-- The NTILE function assigns a quartile number to each employee based on their salary in descending order.
-- The result set will have quartile numbers ranging from 1 to 4, with 1 being the lowest quartile and 4 being the highest quartile.
-- The NTILE function ensures that each quartile has approximately the same number of employees. 
-- If the number of employees is not evenly divisible by the specified number of quartiles, 
-- the function will distribute the remaining employees as evenly as possible among the quartiles.

-- NTILE(8) will divide the result set into 8 approximately equal parts or buckets.
-- NTILE(10) will divide the result set into 10 approximately equal parts or buckets.

-- IF THERE ARE ONLY 5 EMPLOYEE THEN NTILE(4) WILL ASSIGN 1 TO 2 EMPLOYEES AND 2 TO 2 EMPLOYEES AND 3 TO 1 EMPLOYEE
-- IF THERE ARE ONLY 6 EMPLOYEE THEN NTILE(4) WILL ASSIGN 1 TO 2 EMPLOYEES AND 2 TO 2 EMPLOYEES AND 3 TO 2 EMPLOYEES
-- IF THERE ARE ONLY 7 EMPLOYEE THEN NTILE(4) WILL ASSIGN 1 TO 2 EMPLOYEES AND 2 TO 2 EMPLOYEES AND 3 TO 2 EMPLOYEES AND 4 TO 1 EMPLOYEE
-- IF THERE ARE ONLY 8 EMPLOYEE THEN NTILE(4) WILL ASSIGN 1 TO 2 EMPLOYEES AND 2 TO 2 EMPLOYEES AND 3 TO 2 EMPLOYEES AND 4 TO 2 EMPLOYEES

-- NTILE NUMBER SHOULD BE LESS THAN OR EQUAL TO NUMBER OF ROWS IN THE TABLE OTHERWISE IT WILL THROW ERROR.

-- Table DDL
CREATE TABLE Employees (
    EmpID INT,
    EmpName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert example data
INSERT INTO Employees VALUES (1, 'Alice', 6000.00), 
                             (2, 'Bob', 7000.00),
                             (3, 'Charlie', 8000.00),
                             (4, 'David', 9000.00);

-- Query to assign quartiles using NTILE
SELECT 
    EmpName, 
    Salary, 
    NTILE(4) OVER (ORDER BY Salary DESC) AS Quartile
FROM 
    Employees;

-- 9. PERCENT_RANK() Example
-- Table DDL
CREATE TABLE Races (
    RacerID INT,
    FinishTime DECIMAL(5, 2)
);

-- Insert example data
INSERT INTO Races VALUES (1, 12.34), 
                         (2, 11.22),
                         (3, 12.67),
                         (4, 11.85);

-- Query to calculate percentage rank
SELECT 
    RacerID, 
    FinishTime, 
    PERCENT_RANK() OVER (ORDER BY FinishTime ASC) AS PercentRank
FROM 
    Races;

-- 10. RANK() Example
-- Table DDL
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(50),
    SalesAmount DECIMAL(10, 2)
);

-- Insert example data
INSERT INTO Products VALUES (1, 'Product A', 5000.00), 
                            (2, 'Product B', 7000.00),
                            (3, 'Product C', 5000.00),
                            (4, 'Product D', 9000.00);

-- Query to calculate rank with gaps
SELECT 
    ProductName, 
    SalesAmount, 
    RANK() OVER (ORDER BY SalesAmount DESC) AS Rank
FROM 
    Products;

-- 11. ROW_NUMBER() Example
-- Table DDL
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    TestScore INT
);

-- Insert example data
INSERT INTO Students VALUES (1, 'John', 85), 
                            (2, 'Jane', 90),
                            (3, 'Jack', 88),
                            (4, 'Jill', 85);

-- Query to assign row numbers
SELECT 
    StudentName, 
    TestScore, 
    ROW_NUMBER() OVER (ORDER BY TestScore DESC) AS RowNum
FROM 
    Students;

-- 12. SUM() Example
-- Table DDL
CREATE TABLE Salaries (
    EmpID INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert example data
INSERT INTO Salaries VALUES (1, 'HR', 5000.00), 
                            (2, 'IT', 7000.00),
                            (3, 'HR', 6500.00),
                            (4, 'IT', 9000.00);

-- Query to calculate running total using SUM
SELECT 
    Department, 
    Salary, 
    SUM(Salary) OVER (PARTITION BY Department ORDER BY Salary DESC) AS RunningTotal
FROM 
    Salaries;


CUME_DIST(): Calculates the cumulative distribution of a value within a set of values.

DENSE_RANK(): Assigns ranks to rows in a result set with no gaps between rank values.

FIRST_VALUE(): Retrieves the first value in the specified window of rows.

LAG(): Accesses data from a previous row in the same result set without the need for a self-join.

LAST_VALUE(): Retrieves the last value in the specified window of rows.

LEAD(): Accesses data from the next row in the result set.

NTH_VALUE(): Returns the Nth value in the ordered set.

NTILE(): Distributes the rows into a specified number of approximately equal parts or buckets.

PERCENT_RANK(): Calculates the relative rank of a row within a group of rows.

RANK(): Assigns ranks to rows in a result set with gaps in rank values if there are ties.

ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition of a result set.

SUM(): Calculates the running total or sum over a set of values.

This structure provides a complete set of SQL window functions with practical examples that can be directly run on a relational database system.