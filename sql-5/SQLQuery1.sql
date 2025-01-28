CREATE TABLE Orders_A (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT
);

-- DDL for the second table
CREATE TABLE Orders_B (
    OrderID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Quantity INT
);

-- Sample data for Orders_A
INSERT INTO Orders_A VALUES (1, 'ProductA', 5);
INSERT INTO Orders_A VALUES (2, 'ProductB', 10);
INSERT INTO Orders_A VALUES (3, 'ProductC', 8);

-- Sample data for Orders_B
INSERT INTO Orders_B VALUES (4, 'ProductD', 15);
INSERT INTO Orders_B VALUES (5, 'ProductE', 7);
INSERT INTO Orders_B VALUES (6, 'ProductF', 12);

select * from Orders_A

select * from Orders_B

SELECT * from Orders_A
UNION all
SELECT * from Orders_B

select sum(Quantity) as total
from
(
  SELECT Quantity  FROM Orders_A
  UNION
  SELECT Quantity FROM Orders_B
) tmp

select sum(quantity) as total_product, min(quantity) MinQuantity, max(quantity) MaxQuantity
from (
  SELECT Quantity  FROM Orders_A
  UNION
  SELECT Quantity FROM Orders_B
) tmp

-- DDL for the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- DDL for the VIPCustomers table
CREATE TABLE VIPCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Sample data for Customers
INSERT INTO Customers VALUES (1, 'John Doe');
INSERT INTO Customers VALUES (2, 'Jane Smith');
INSERT INTO Customers VALUES (3, 'Bob Johnson');
INSERT INTO Customers VALUES (4, 'Alice Williams');
INSERT INTO Customers VALUES (5, 'Charlie Brown');

-- Sample data for VIPCustomers
INSERT INTO VIPCustomers VALUES (2, 'Jane Smith');
INSERT INTO VIPCustomers VALUES (4, 'Alice Williams');
INSERT INTO VIPCustomers VALUES (6, 'Eve White');

select * from Customers
select * from Customers
select * from VIPCustomers

SELECT * from Customers
intersect
SELECT * from VIPCustomers

SELECT * from VIPCustomers
except
SELECT * from Customers

SELECT * from Customers
except
SELECT * from VIPCustomers





-- Create table
CREATE TABLE GroupbyMultipleColumns
(
    ID INT,
    Typ VARCHAR(1),
    Value1 VARCHAR(1),
    Value2 VARCHAR(1),
    Value3 VARCHAR(1)
);

-- Insert Data
INSERT INTO GroupbyMultipleColumns(ID, Typ, Value1, Value2, Value3)
VALUES
    (1, 'I', 'a', 'b', ''),
    (2, 'O', 'a', 'd', 'f'),
    (3, 'I', 'd', 'b', ''),
    (4, 'O', 'g', 'l', ''),
    (5, 'I', 'z', 'g', 'a'),
    (6, 'I', 'z', 'g', 'a');

	select typ, 
		sum(case when Value1 = 'a' then 1 else 0 end) +
		sum(case when Value2 = 'a' then 1 else 0 end) +
		sum(case when Value3 = 'a' then 1 else 0 end)
		from GroupbyMultipleColumns
		group by Typ

select * from GroupbyMultipleColumns


CREATE TABLE FruitCount
(
    Name VARCHAR(20),
    Fruit VARCHAR(25)
);
--Insert Data
INSERT INTO FruitCount(Name, Fruit) 
VALUES
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'MANGO'),
    ('Neeraj', 'APPLE'),
    ('Neeraj', 'ORANGE'),
    ('Neeraj', 'LICHI'),
    ('Neeraj', 'LICHI'),
    ('Neeraj', 'LICHI'),
    ('Isha', 'MANGO'),
    ('Isha', 'MANGO'),
    ('Isha', 'APPLE'),
    ('Isha', 'ORANGE'),
    ('Isha', 'LICHI'),
    ('Gopal', 'MANGO'),
    ('Gopal', 'MANGO'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'APPLE'),
    ('Gopal', 'ORANGE'),
    ('Gopal', 'LICHI'),
    ('Mayank', 'MANGO'),
    ('Mayank', 'MANGO'),
    ('Mayank', 'APPLE'),
    ('Mayank', 'APPLE'),
    ('Mayank', 'ORANGE'),
    ('Mayank', 'LICHI');

	select * from FruitCount
	select Name from FruitCount
	select Fruit from FruitCount

	select Name, 
		sum(case when Fruit = 'MANGO' then 1 else 0 end) as Mango_Count ,
		sum(case when Fruit = 'APPLE' then 1 else 0 end) as apple_Count,
		sum(case when Fruit = 'LICHI' then 1 else 0 end) as	 Lichi_Count,
		sum(case when Fruit = 'ORANGE' then 1 else 0 end) as orange_Count
		from FruitCount
		group by Name

        select Fruit from FruitCount
        where Name = 'APPLe'	