--Inner Join
SELECT orders.OrderID, orders.OrderDate, customers.Name
FROM orders
INNER JOIN customers ON orders.CustomerID = customers.CustomerID;

-- Left Join
SELECT customers.Name, orders.OrderID, orders.OrderDate
FROM customers
LEFT JOIN orders ON orders.CustomerID = customers.CustomerID;

-- Right Join
SELECT orders.OrderID, orders.OrderDate, customers.Name, customers.Email
FROM orders
RIGHT JOIN customers ON orders.CustomerID = customers.CustomerID;

-- SELF JOIN
SELECT e1.Name AS Employee, e2.Name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.ManagerID = e2.EmployeeID;