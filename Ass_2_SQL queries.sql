--Find all customers in Berlin
SELECT * FROM Customers
WHERE City='Berlin';

--Find all customers in Mexico City
SELECT * FROM Customers
WHERE City = 'México D.F.';

--Find avg price of all products
SELECT AVG(Price) FROM Products;

--Find number of products that Have price = 18
SELECT * FROM Products
WHERE Price=18;

--Find orders between 1996-08-01 and 1996-09-06
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-08-01' AND '1996-09-06';

--Find customers with more than 3 orders
--How do we know if the customer ordered more than 3 orders?
--We have to count the number of times the CustomerID appears because 
-- the OrderID is a unique value
SELECT Customers.CustomerID, Customers.CustomerName, COUNT(*) AS 'No_of_Orders'
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Orders.CustomerID
HAVING COUNT(*) > 3;

--Find all customers that are from the same city
SELECT GROUP_CONCAT(CustomerName), City
FROM Customers
GROUP BY City;