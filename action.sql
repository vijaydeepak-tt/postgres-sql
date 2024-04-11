CREATE TABLE FoodOrders (OrderID INT, Quantity INT, Order_Status VARCHAR(15), Cost Decimal(4,2));

SHOW COLUMNS FROM FoodOrders;

--INSERT
INSERT INTO FoodOrders VALUES(1, 3, "In Progress", 10.00);

--REPLACE
REPLACE INTO FoodOrders VALUES(1, 2, "Delivered", 100.00);

--MODIFY
ALTER TABLE FoodOrders MODIFY OrderID INT PRIMARY KEY;
ALTER TABLE FoodOrders, MODIFY Quantity INT NOT NULL, MODIFY Cost decimal(4,2) NOT NULL;

--ADD COLUMN
ALTER TABLE FoodOrders ADD COLUMN OrderDate DATE NOT NULL, ADD COLUMN CustomerID INT NOT NULL, ADD FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

--DROP COLUMN
ALTER TABLE FoodOrders DROP COLUMN OrderDate;

--CHANGE COLUMN
ALTER TABLE OrderStatus CHANGE Order_status DeliveryStatus VARCHAR(15);

--RENAME TABLE
ALTER TABLE OrderStatus RENAME OrderDeliveryStatus;

--COPY TABLE
CREATE TABLE OrdersCopy AS SELECT * FROM Orders;

-- COPY TABLE BY LIMITED COLUMNS
CREATE TABLE OrdersCopy AS SELECT OrderID, Quantity FROM Orders;

--COPY TALES IN DIFFERENT DATABASE
CREATE TABLE db2.OrdersCopy AS SELECT * FROM db2.Orders;