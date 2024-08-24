-- Use the 'leetcode' database
USE leetcode;

-- Create 'Person_example' table
CREATE TABLE IF NOT EXISTS Person_example (
    PersonId INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create 'Address_example' table
CREATE TABLE IF NOT EXISTS Address_example (
    AddressId INT PRIMARY KEY,
    PersonId INT,
    City VARCHAR(50),
    State VARCHAR(50),
    FOREIGN KEY (PersonId) REFERENCES Person_example(PersonId)
);

-- Insert data into 'Person_example'
INSERT INTO Person_example (PersonId, FirstName, LastName) VALUES
    (1, 'John', 'Doe'),
    (2, 'Jane', 'Smith'),
    (3, 'Jim', 'Brown'),
    (4, 'Emily', 'Johnson'),
    (5, 'Michael', 'Williams'),
    (6, 'Sarah', 'Jones'),
    (7, 'David', 'Garcia'),
    (8, 'Emma', 'Martinez'),
    (9, 'Daniel', 'Lopez'),
    (10, 'Olivia', 'Hernandez'),
    (11, 'James', 'Gonzalez'),
    (12, 'Ava', 'Wilson'),
    (13, 'Benjamin', 'Anderson'),
    (14, 'Sophia', 'Thomas'),
    (15, 'Lucas', 'Taylor'),
    (16, 'Mia', 'Moore'),
    (17, 'Mason', 'Jackson'),
    (18, 'Charlotte', 'Martin'),
    (19, 'Ethan', 'Lee'),
    (20, 'Amelia', 'Perez'),
    (21, 'Henry', 'Thompson'),
    (22, 'Harper', 'White'),
    (23, 'Alexander', 'Harris'),
    (24, 'Evelyn', 'Sanchez'),
    (25, 'Sebastian', 'Clark'),
    (26, 'Abigail', 'Ramirez'),
    (27, 'Jack', 'Lewis'),
    (28, 'Ella', 'Robinson'),
    (29, 'Aiden', 'Walker'),
    (30, 'Scarlett', 'Young'),
    (31, 'Matthew', 'Allen'),
    (32, 'Victoria', 'King'),
    (33, 'Logan', 'Wright'),
    (34, 'Grace', 'Scott'),
    (35, 'Jacob', 'Torres'),
    (36, 'Zoey', 'Nguyen'),
    (37, 'William', 'Hill'),
    (38, 'Chloe', 'Flores'),
    (39, 'Jayden', 'Green'),
    (40, 'Lily', 'Adams'),
    (41, 'Owen', 'Nelson'),
    (42, 'Penelope', 'Baker'),
    (43, 'Luke', 'Hall'),
    (44, 'Riley', 'Rivera'),
    (45, 'Anthony', 'Campbell'),
    (46, 'Nora', 'Mitchell'),
    (47, 'Isaac', 'Carter'),
    (48, 'Aria', 'Roberts'),
    (49, 'Dylan', 'Gomez'),
    (50, 'Hannah', 'Phillips');

-- Insert data into 'Address_example'
INSERT INTO Address_example (AddressId, PersonId, City, State) VALUES
    (1, 1, 'New York', 'NY'),
    (2, 2, 'Los Angeles', 'CA'),
    (3, 3, 'Chicago', 'IL'),
    (4, 4, 'Houston', 'TX'),
    (5, 5, 'Phoenix', 'AZ'),
    (6, 6, 'Philadelphia', 'PA'),
    (7, 7, 'San Antonio', 'TX'),
    (8, 8, 'San Diego', 'CA'),
    (9, 9, 'Dallas', 'TX'),
    (10, 10, 'San Jose', 'CA'),
    (11, 11, 'Austin', 'TX'),
    (12, 12, 'Jacksonville', 'FL'),
    (13, 13, 'Fort Worth', 'TX'),
    (14, 14, 'Columbus', 'OH'),
    (15, 15, 'Charlotte', 'NC'),
    (16, 16, 'San Francisco', 'CA'),
    (17, 17, 'Indianapolis', 'IN'),
    (18, 18, 'Seattle', 'WA'),
    (19, 19, 'Denver', 'CO'),
    (20, 20, 'Washington', 'DC'),
    (21, 21, 'Boston', 'MA'),
    (22, 22, 'El Paso', 'TX'),
    (23, 23, 'Nashville', 'TN'),
    (24, 24, 'Detroit', 'MI'),
    (25, 25, 'Oklahoma City', 'OK'),
    (26, 26, 'Portland', 'OR'),
    (27, 27, 'Las Vegas', 'NV'),
    (28, 28, 'Memphis', 'TN'),
    (29, 29, 'Louisville', 'KY'),
    (30, 30, 'Baltimore', 'MD'),
    (31, 31, 'Milwaukee', 'WI'),
    (32, 32, 'Albuquerque', 'NM'),
    (33, 33, 'Tucson', 'AZ'),
    (34, 34, 'Fresno', 'CA'),
    (35, 35, 'Sacramento', 'CA'),
    (36, 36, 'Mesa', 'AZ'),
    (37, 37, 'Kansas City', 'MO'),
    (38, 38, 'Atlanta', 'GA'),
    (39, 39, 'Long Beach', 'CA'),
    (40, 40, 'Colorado Springs', 'CO'),
    (41, 41, 'Raleigh', 'NC'),
    (42, 42, 'Miami', 'FL'),
    (43, 43, 'Virginia Beach', 'VA'),
    (44, 44, 'Omaha', 'NE'),
    (45, 45, 'Oakland', 'CA'),
    (46, 46, 'Minneapolis', 'MN'),
    (47, 47, 'Tulsa', 'OK'),
    (48, 48, 'Arlington', 'TX'),
    (49, 49, 'New Orleans', 'LA'),
    (50, 50, 'Wichita', 'KS');

-- Create 'Users' table
CREATE TABLE IF NOT EXISTS Users (
    UserId INT PRIMARY KEY,
    UserName VARCHAR(100),
    UserEmail VARCHAR(100)
);

-- Insert data into 'Users'
INSERT INTO Users (UserId, UserName, UserEmail) VALUES
    (1, 'Alice Johnson', 'alice.johnson@example.com'),
    (2, 'Bob Smith', 'bob.smith@example.com'),
    (3, 'Charlie Brown', 'charlie.brown@example.com'),
    (4, 'Diana Prince', 'diana.prince@example.com'),
    (5, 'Edward Kenway', 'edward.kenway@example.com'),
    (50, 'User50', 'user50@example.com');

-- Create 'Orders' table
CREATE TABLE IF NOT EXISTS Orders (
    OrderId INT PRIMARY KEY,
    OrderDate DATE,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId)
);

-- Insert data into 'Orders'
INSERT INTO Orders (OrderId, OrderDate, CustomerId) VALUES
    (1, '2024-01-01', 1),
    (2, '2024-01-02', 2),
    (3, '2024-01-03', 3),
    (4, '2024-01-04', 4),
    (5, '2024-01-05', 5),
    (6, '2024-01-06', 50);

-- Create 'OrderDetails' table
CREATE TABLE IF NOT EXISTS OrderDetails (
    OrderDetailId INT PRIMARY KEY,
    OrderId INT,
    ProductId INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

-- Insert data into 'OrderDetails'
INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity, Price) VALUES
    (1, 1, 101, 2, 29.99),
    (2, 1, 102, 1, 19.99),
    (3, 2, 103, 5, 99.99),
    (4, 3, 104, 3, 39.99),
    (5, 4, 105, 4, 49.99),
    (50, 50, 150, 1, 199.99);

-- Create 'Calendar' table
CREATE TABLE IF NOT EXISTS Calendar (
    DateId INT PRIMARY KEY,
    Date DATE,
    Hol_Christian BIT,
    Hol_Jewish BIT,
    Hol_Islamic BIT
);

-- Insert data into 'Calendar'
INSERT INTO Calendar (DateId, Date, Hol_Christian, Hol_Jewish, Hol_Islamic) VALUES
    (1, '2024-01-01', 1, 0, 0),
    (2, '2024-01-02', 0, 1, 0),
    (3, '2024-01-03', 0, 0, 1),
    (4, '2024-01-04', 1, 0, 0),
    (5, '2024-01-05', 0, 1, 0),
    (6, '2024-01-06', 0, 0, 1);
