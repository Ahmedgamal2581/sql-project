use northwind
SELECT * 
FROM Customers;



---Displays the product name and total quantity sold for each product--


SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY ProductName
ORDER BY TotalQuantity DESC;


---Total sales per product category---


SELECT Categories.CategoryName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalSales
FROM [Order Details]
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName


--Monthly sales--


SELECT MONTH(OrderDate) AS Month, YEAR(OrderDate) AS Year, SUM(UnitPrice * Quantity) AS TotalSales
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY MONTH(OrderDate), YEAR(OrderDate)
ORDER BY Year, Month;


--Most spending customers--

SELECT Customers.CustomerID, Customers.CompanyName, SUM(UnitPrice * Quantity) AS TotalSpending
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName
ORDER BY TotalSpending DESC;


--Number of orders per customer--


SELECT Customers.CustomerID, Customers.CompanyName, COUNT(*) AS TotalOrders
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.CompanyName;


--Countries where most orders come from--

SELECT ShipCountry, COUNT(*) AS TotalOrders
FROM Orders
GROUP BY ShipCountry
ORDER BY TotalOrders DESC;


--Employees with the most sales--


SELECT Employees.EmployeeID, LastName, FirstName, SUM(UnitPrice * Quantity) AS TotalSales
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID, LastName, FirstName
ORDER BY TotalSales DESC;


---Knowing the average order value for each customer in a specific country (France)---


SELECT Customers.CustomerID, Customers.CompanyName, AVG(UnitPrice * Quantity) AS AverageOrderValue
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country= 'France'
GROUP BY Customers.CustomerID, Customers.CompanyName;


--- count the number of rows--


SELECT COUNT(*) AS TotalOrders
FROM Orders;


---Calculates the sum of the values ​​of a column---


SELECT SUM(UnitPrice * Quantity) AS TotalSales
FROM [Order Details];


--To calculate the average--


SELECT AVG(Freight) AS AverageFreight
FROM Orders;


---To find the largest value--


SELECT MAX(UnitPrice) AS HighestPrice
FROM Products;


---To find the smallest value---


SELECT MIN(OrderDate) AS FirstOrderDate
FROM Orders;


--To group data by a specific value--

SELECT CategoryName, COUNT(*) AS ProductCount
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName;


---To sort the results---

SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;


---Filtering--To select rows that satisfy a certain condition---


SELECT * 
FROM Customers
WHERE Country = 'Germany';


---To extract the year from a date--


SELECT YEAR(OrderDate) AS OrderYear
FROM Orders;


---To extract the month from a date--

SELECT MONTH(OrderDate) AS OrderMonth
FROM Orders;


--To extract a specific part of the date (year, month, day, hour, minute, second)--


SELECT DATEPART(QUARTER, OrderDate) AS Quarter
FROM Orders;


---Top spending customers in each country---


SELECT Customers.Country, Customers.CustomerID, Customers.CompanyName, SUM(UnitPrice * Quantity) AS TotalSpending
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Country, Customers.CustomerID, Customers.CompanyName
ORDER BY Customers.Country, TotalSpending DESC;


---Products sold more than 100 units---


SELECT ProductName, SUM(Quantity) AS TotalQuantity
FROM [Order Details]
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY ProductName
HAVING SUM(Quantity) > 100;

