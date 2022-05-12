-- Shopify Data Science Challenge

-- a) How many orders were shipped by Speedy Express in total?

SELECT count(*) AS Orders 
FROM Orders
JOIN Shippers
ON Orders.ShipperID == Shippers.ShipperID
WHERE ShipperName =="Speedy Express"

-- ANSWER - 54

-- b) What is the last name of the employee with the most orders? 

SELECT LastName FROM Orders
LEFT JOIN Employees
ON Orders.EmployeeID == Employees.EmployeeID
GROUP BY Orders.EmployeeID
ORDER BY Count(*) DESC
LIMIT 1

-- ANSWER-  Peacock

-- c) What product was ordered the most by customers in Germany?

SELECT Products.ProductID, Products.ProductName, 
       (COUNT(*) * OrderDetails.Quantity) AS TotalOrders 
FROM Orders, OrderDetails
JOIN Customers 
ON Orders.CustomerID == Customers.CustomerID
JOIN Products 
ON OrderDetails.ProductID == Products.ProductID
WHERE Country =="Germany"
GROUP BY Products.ProductId
ORDER BY TotalOrders DESC
LIMIT 1

-- Answer -  
-- Product Name : Camembert Pierrot
-- Product ID : 60