-- Table Aliases

-- Description: Use table aliases that are abbreviations of the table name. Avoid using the AS keyword for table aliases to clearly distinguish them from column aliases.

SELECT
  P.FirstName,
  P.LastName
FROM
  leetcode.Person_example P
LEFT JOIN leetcode.Address_example A ON P.PersonId = A.PersonId;


-- Column Aliases
-- Description: Use the AS keyword to define column aliases. Always qualify column names with their table aliases.

SELECT
  P.FirstName AS FName,
  P.LastName AS LName
FROM
  leetcode.Person_example P;


-- Dot Notation
-- Description: Use dot notation to clarify which table a column is coming from.


SELECT
  U.UserId,
  O.OrderId
FROM
  Users U
JOIN Orders O ON U.UserId = O.UserId;


-- Consistency
-- Description: Be consistent in capitalization, underscores, indentation, etc.


SELECT
  P.FirstName,
  P.LastName,
  A.City
FROM
  leetcode.Person_example P
LEFT JOIN Address A ON P.PersonId = A.PersonId;


-- Readability
-- Description: Write SQL code in a way that makes it easy for others (and yourself) to understand.

SELECT
  P.FirstName,
  P.LastName,
  A.City
FROM
  leetcode.Person_example P
LEFT JOIN Address A ON P.PersonId = A.PersonId;

-- Table and Column Names
-- Description: Use only alphanumeric characters and underscores in table and column names. Avoid spaces and special characters.

CREATE TABLE Orders (
  OrderId INT PRIMARY KEY,
  OrderDate DATE
);

-- Plurality of Table Names
-- Description: Table names are usually plural to reflect that they contain multiple instances of an entity.


CREATE TABLE Customers (
  CustomerId INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Customers is plural, indicating it stores multiple customer records.


-- Singularity of Primary Key Column Names
-- Description: Primary key names are singular and typically follow the pattern [TableName]Id.

CREATE TABLE Orders (
  OrderId INT PRIMARY KEY
);

-- OrderId is singular, matching the Orders table.

-- Foreign Key and Primary Key Naming Consistency
-- Description: Use the same name for foreign key and primary key columns to make relationships clear.

CREATE TABLE Orders (
  OrderId INT PRIMARY KEY,
  CustomerId INT,
  FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

-- CamelCase
-- Description: Use CamelCase (also called CamelBack) for table and column names to improve readability.

CREATE TABLE OrderDetails (
  OrderDetailId INT PRIMARY KEY,
  OrderId INT,
  ProductId INT
);

-- CamelCase is used in OrderDetails, OrderDetailId, OrderId, and ProductId.

-- Underscore Usage
-- Description: Use underscores to group related columns together.


CREATE TABLE Calendar (
  DateId INT PRIMARY KEY,
  Hol_Christian BIT,
  Hol_Jewish BIT,
  Hol_Islamic BIT
);

-- Hol_ prefixes group the holiday-related columns together.

-- Reserved Words
-- Description: Avoid using SQL reserved words as table or column names.


CREATE TABLE Orders (
  OrderId INT PRIMARY KEY,
  OrderDate DATE
);

-- No reserved words like ORDER or GROUP are used as table or column names.

-- Left Alignment of High-Level Clauses
-- Description: Align high-level SQL clauses (e.g., SELECT, FROM, WHERE) on the left.

SELECT
  P.FirstName,
  P.LastName
FROM
  leetcode.Person_example P
WHERE
  P.City = 'New York';

-- SELECT, FROM, and WHERE are aligned on the left.

-- Alignment Within Clauses
-- Description: Align subsequent lines within a clause under the keyword.


SELECT
  P.FirstName,
  P.LastName,
  A.City
FROM
  leetcode.Person_example P
LEFT JOIN Address A ON P.PersonId = A.PersonId;

-- The columns in the SELECT clause and the table in the FROM clause are aligned. 


-- Alignment Within Subqueries
-- Description: Subqueries should follow similar alignment rules as main queries.


SELECT
  P.FirstName,
  P.LastName
FROM
  leetcode.Person_example P
WHERE
  P.PersonId IN (
    SELECT
      A.PersonId
    FROM
      Address A
    WHERE
      A.City = 'New York'
  );

-- The subquery is indented and follows the same alignment rules as the main query.


-- Alignment Within FROM Clause
-- Description: Align table names and JOIN keywords within the FROM clause on separate lines.


SELECT
  P.FirstName,
  A.City
FROM
  leetcode.Person_example P
LEFT JOIN Address A ON P.PersonId = A.PersonId;

-- leetcode.Person_example P and LEFT JOIN Address A are aligned on separate lines.

-- Operator Spacing
-- Description: Add spaces around operators (e.g., =, +, -).

SELECT
  P.FirstName,
  P.LastName
FROM
  leetcode.Person_example P
WHERE
  P.City = 'New York';

-- The = operator has spaces around it.

-- Comma Placement
-- Description: Place commas at the end of the line, not at the beginning.

SELECT
  P.FirstName,
  P.LastName,
  A.City
FROM
  leetcode.Person_example P;

-- Commas are placed at the end of each line in the SELECT clause.

-- Parentheses Across Multiple Lines
-- Description: Align closing parentheses with the opening parenthesis when they span multiple lines.

SELECT
  P.FirstName,
  P.LastName
FROM
  leetcode.Person_example P
WHERE
  P.City IN (
    'New York',
    'Los Angeles',
    'Chicago'
  );

-- The closing parenthesis is aligned with the IN keyword.

-- CASE Statements and Parentheses
-- Description: Always surround CASE statements with parentheses.

SELECT
  P.FirstName,
  P.LastName,
  (CASE WHEN P.City = 'New York' THEN 'NY' ELSE 'Other' END) AS CityCode
FROM
  leetcode.Person_example P;

--   The CASE statement is enclosed in parentheses.