create database Techshop;
use techshop;
--TASK 1--

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(100)
);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate date,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Sri', 'Varshini', 'sri.var@gmail.com', '8976543218', '12 abc St, Thiruvarur'),
(2, 'Abinaya', 'Murugan', 'abi.mgn@gmail.com', '7654321908', '45 def St, Kanyakumari'),
(3, 'Shalini', 'Shanmugam', 'shalu@gmail.com', '6543210987', '78 ghi St, Chennai'),
(4,'Revathi', 'Vignesh', 'bob.brown@gmail.com', '1234567890', '10 jkl St, Chennai'),
(5, 'Roshini', 'Davis', 'rd@gmail.com', '5432109876', '20 mno St, Trichy'),
(6, 'Ashwitha', 'Sidhuraj', 'a.sidhu@gmail.com', '7685940321', '30 pqr St, Salem'),
(7, 'Harini', 'Thangamani', 'ht@gmail.com', '9087655435', '40 stu St, Chennai'),
(8, 'Lavanya', 'Kumar', 'lk@gmail.com', '6578905789', '50 vwx St, Chennai'),
(9, 'Preethi', 'Rathnam', 'pn@gmail.com', '9123456780', '60 yza St, Chennai'),
(10,'Reena', 'Arjun', 'reena.arjun@gmail.com', '7509641320', '70 acb St, Chennai');

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', '14 inch, 8GB RAM, 256GB SSD', 799.99),
(2, 'Smartphone', '6.0 inch display', 499.99),
(3, 'Headphones', 'Noise-cancellation', 149.99),
(4, 'Keyboard', 'Keyboard with backlight', 89.99),
(5, 'Mouse', 'Wireless mouse', 29.99),
(6, 'Monitor', '27 inch 4K UHD monitor', 349.99),
(7, 'Printer', 'All-in-one inkjet printer', 119.99),
(8, 'Tablet', '10 inch tablet', 299.99),
(9,'Smartwatch', 'Fitness tracker', 199.99),
(10, 'External Hard Drive', '1TB portable external hard drive', 89.99);



INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-09-01', 799.99),
(2, 2, '2024-09-02', 499.99),
(3, 3, '2024-09-03', 149.99),
(4, 4, '2024-09-04', 89.99),
(5, 5, '2024-09-05', 29.99),
(6, 6, '2024-09-06', 349.99),
(7, 7, '2024-09-07', 119.99),
(8, 8, '2024-09-08', 299.99),
(9, 9, '2024-09-09', 199.99),
(10, 10, '2024-09-10', 89.99);

INSERT INTO OrderDetails (OrderDetailID,OrderID, ProductID, Quantity) VALUES
(1,1, 1, 1),
(2,2, 2, 1),
(3, 3,3, 1),
(4, 4,4, 1),
(5, 5,5, 1),
(6, 6,6, 1),
(7, 7,7, 1),
(8, 8,8, 1),
(9, 9,9, 1),
(10, 10,10, 1);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 50, '2024-09-01'),
(2, 2, 30, '2024-09-02'),
(3, 3, 100, '2024-09-03'),
(4, 4, 75, '2024-09-04'),
(5, 5, 200, '2024-09-05'),
(6, 6, 20, '2024-09-06'),
(7, 7, 40, '2024-09-07'),
(8, 8, 60, '2024-09-08'),
(9, 9, 25, '2024-09-09'),
(10, 10, 15, '2024-09-10');

--TASK 2--

1.--to retrieve name and emails of all customer--

SELECT FirstName, LastName, Email
FROM Customers;

2.--Write an SQL query to list all orders with their order dates and corresponding customer 
names--

SELECT o.OrderID, o.OrderDate, c.FirstName, c.LastName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;

3.--add new customer record into customer table--

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address) 
VALUES (11, 'Bela', 'Gupta', 'bela.gupta@gmail.com', '80 dfs St, Mumbai');


4. Update Prices of All Products by Increasing Them by 10%

SET SQL_SAFE_UPDATES = 0;
UPDATE Products
SET Price = Price * 1.10;
select * from Products;

5.--Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter--

DELETE FROM OrderDetails WHERE OrderID = 2;

DELETE FROM Orders WHERE OrderID = 2;

6.--Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
order date, and any other necessary information.--

INSERT INTO Orders(OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(11, 11, '2024-09-11', 549.22);

7.--Write an SQL query to update the contact information (e.g., email and address) of a specific 
customer in the "Customers" table. Allow users to input the customer ID and new contact 
information.--

UPDATE Customers 
SET Email = 'harini@gmail.com', Address = '45 Neithal St, Nagai' 
WHERE CustomerID = 7;

8.--Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
table based on the prices and quantities in the "OrderDetails" table.--

UPDATE Orders o
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = o.OrderID
);

9.-- Write an SQL query to delete all orders and their associated order details for a specific 
customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
as a parameter.--

DELETE od FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.CustomerID = 4;

DELETE FROM Orders WHERE CustomerID = 4;

10.-- Write an SQL query to insert a new electronic gadget product into the "Products" table, 
including product name, category, price, and any other relevant details.--

INSERT INTO Products(ProductID, ProductName, Description, Price) VALUES
(11, 'Pendrive', '16 gb storage', 650.25);

11.--Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
"Pending" to "Shipped"). Allow users to input the order ID and the new status.--

ALTER TABLE Orders
add column status;
update orders set status='pending';
update orders set status='shipped' where orderid in (3,4,5,6);
select * from orders;

12.-- Write an SQL query to calculate and update the number of orders placed by each customer 
in the "Customers" table based on the data in the "Orders" table--

ALTER TABLE Customers ADD NumofOrder INT;
UPDATE Customers c
SET NumofOrder = (
    SELECT COUNT(*)
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

--TASK 3--

1.-- Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
customer name) for each order.--

select * 
from orders o inner join customers c
on o.customerId = c.customerId;

2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
Include the product name and the total revenue.

select p.productName, sum(od.quantity * p.price) as TotalRevenue
from Products p INNER JOIN OrderDetails od 
on p.ProductId = od.ProductId
group by p.ProductName;

3. Write an SQL query to list all customers who have made at least one purchase. Include their 
names and contact information.

SELECT c.firstName, c.lastName, c.address, count(o.OrderId) as NumberOfOrders
from customers c INNER JOIN Orders o 
on c.CustomerId = o.CustomerId
group by c.CustomerId
having count(o.OrderId) >= 1;

4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
total quantity ordered. Include the product name and the total quantity ordered.

select p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
group by p.ProductName
order by TotalQuantityOrdered DESC
LIMIT 1;

5. Write an SQL query to retrieve a list of electronic gadgets along with their corresponding 
categories.

ALTER TABLE Products add column Categories varchar(60);
update Products set Categories = 'Electronics';
select * from Products;

select ProductName, Categories
from Products
where Categories = 'Electronics';

6. Write an SQL query to calculate the average order value for each customer. Include the 
customer's name and their average order value.--

select c.FirstName, c.LastName, AVG(o.TotalAmount) AS AvgOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
customer information, and the total revenue.

select o.OrderID, c.FirstName, c.LastName, o.TotalAmount
from Orders o
join Customers c ON o.CustomerID = c.CustomerID
order by o.TotalAmount DESC
LIMIT 1;

8.--Write an SQL query to list electronic gadgets and the number of times each product has been 
ordered.--

select p.ProductName, SUM(od.Quantity) AS TotalOrdered
from OrderDetails od
join Products p on od.ProductID = p.ProductID
group by p.ProductName;

9.--Write an SQL query to find customers who have purchased a specific electronic gadget product. 
Allow users to input the product name as a parameter.--

select distinct c.FirstName, c.LastName, c.Email, c.Phone
from Customers c
join Orders o on c.CustomerID = o.CustomerID
join OrderDetails od ON o.OrderID = od.OrderID
join Products p ON od.ProductID = p.ProductID
where p.ProductName = 'Mouse'; 

10.-- Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period.
Allow users to input the start and end dates as parameters.--

select SUM(TotalAmount) AS TotalRevenue
from Orders
where OrderDate BETWEEN '2024-09-01' AND '2024-09-06';



