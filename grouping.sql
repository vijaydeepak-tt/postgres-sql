-- GROUP BY
SELECT c.CustomerID, c.Name, COUNT(o.OrderID)  AS 'Total Orders', SUM(o.TotalAmount) AS 'Total Amount' FROM Orders o
LEFT JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name;

-- HAVING - works as where condition
SELECT c.CustomerID, c.Name, COUNT(o.OrderID)  AS 'Total Orders', SUM(o.TotalAmount) AS 'Total Amount' FROM Orders o
LEFT JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING 'Total Amount' < 2200;