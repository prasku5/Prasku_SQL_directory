-- Create the Books table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    name VARCHAR(100),
    available_from DATE
);

-- Insert example data into Books
INSERT INTO Books (book_id, name, available_from) VALUES 
(1, 'Book A', '2019-05-01'),
(2, 'Book B', '2019-05-15'),
(3, 'Book C', '2019-04-20');

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    book_id INT,
    customer_id INT,
    quantity INT,
    dispatch_date DATE,
    order_type INT
);

-- Insert example data into Orders
INSERT INTO Orders (order_id, book_id, customer_id, quantity, dispatch_date, order_type) VALUES
(1, 1, 1, 5, '2019-05-30', 1),
(2, 2, 2, 10, '2019-06-10', 0),
(3, 3, 1, 15, '2019-06-15', 1),
(4, 1, 3, 8, '2019-06-20', 0);


-- SQL Queries Using CTEs and Subqueries
-- Problem 1098. Unpopular Books

-- Subquery Solution:

SELECT
  B.book_id,
  B.name
FROM
  Books B
WHERE
  B.available_from < DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
  AND NOT EXISTS (
    SELECT
      1
    FROM
      Orders O
    WHERE
      O.book_id = B.book_id
      AND O.dispatch_date
        BETWEEN DATE_SUB('2019-06-23', INTERVAL 1 YEAR) AND '2019-06-23'
    GROUP BY
      O.book_id
    HAVING
      SUM(O.quantity) >= 10
  );

-- CTE Solution:


WITH eligible_books AS (
  SELECT
    *
  FROM
    Books B
  WHERE B.available_from < DATE_SUB('2019-06-23', INTERVAL 1 MONTH)
), eligible_orders AS (
  SELECT
    *
  FROM
    Orders O
  WHERE O.dispatch_date > DATE_SUB('2019-06-23', INTERVAL 1 YEAR)
)
SELECT
  EB.book_id, EB.name
FROMs
  eligible_books EB
  LEFT JOIN eligible_orders EO ON EB.book_id = EO.book_id
GROUP BY
  EB.book_id, EB.name
HAVING
  SUM(EO.quantity) IS NULL OR SUM(EO.quantity) < 10;

-- Problem 2084. Drop Type 1 Orders for Customers With Type 0 Orders

-- CTE Solution:

WITH Type0Orders AS (
  SELECT * FROM Orders O1 WHERE O1.order_type = 0
), ValidType1Orders AS (
  SELECT * FROM Orders O2 WHERE O2.customer_id NOT IN (SELECT customer_id FROM Type0Orders) AND O2.order_type = 1
)
SELECT * FROM Type0Orders
UNION ALL
SELECT * FROM ValidType1Orders;

-- Additional Example: Aggregation and CTEs
-- CTE Example:

WITH head_count_tab (job, HeadCount) AS (
  SELECT
    job,
    COUNT(empno)
  FROM
    emp
  GROUP BY
    job
)
SELECT
  MAX(HeadCount) AS HighestJobHeadCount
FROM
  head_count_tab;

