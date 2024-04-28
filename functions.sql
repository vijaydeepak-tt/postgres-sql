-- Number Functions

-- Aggregate Functions
-- SUM(), AVG(), COUNT(), MIN(), MAX()
SELECT SUM(HandlingCost) FROM employee_orders;

SELECT Status, AVG(HandlingCost) FROM employee_orders GROUP BY Status;

SELECT COUNT(*) FROM employee_orders;

SELECT MIN(HandlingCost) FROM employee_orders;

SELECT MAX(HandlingCost) FROM employee_orders;

-- Math Functions
-- ABS(), CEIL(), FLOOR(), ROUND(), MOD(), SQRT(), EXP(), LN(), LOG(), LOG10(), 
-- POWER() or POW(), PI(), RADIANS(), SIN(), COS(), TAN(), DEGREES(), RADIANS()

SELECT ABS(HandlingCost) FROM employee_orders;

SELECT CEIL(AVG(HandlingCost)) FROM employee_orders;

SELECT FLOOR(AVG(HandlingCost)) FROM employee_orders;

SELECT ROUND(AVG(HandlingCost)) FROM employee_orders;

SELECT MOD(AVG(HandlingCost), 3) FROM employee_orders;

SELECT POWER(2, 3);
SELECT POW(2, 3);

-- String Functions
-- UPPER() or UCASE(), LOWER() or LCASE() LENGTH(), TRIM(), LTRIM(), RTRIM(), SUBSTRING(), CONCAT(), FORMAT(), REPLACE()

SELECT UPPER(Status) FROM employee_orders;

SELECT UCASE(Status) FROM employee_orders;

SELECT LOWER(Status) FROM employee_orders;

SELECT LCASE(Status) FROM employee_orders;

SELECT LENGTH(Status) FROM employee_orders;

SELECT TRIM(Status) FROM employee_orders;

SELECT LTRIM(Status) FROM employee_orders;

SELECT RTRIM(Status) FROM employee_orders;

SELECT SUBSTRING(Status, 1, 3) FROM employee_orders;

SELECT CONCAT(Status, ' - ', HandlingCost) FROM employee_orders;

SELECT FORMAT(AVG(HandlingCost), 2) FROM employee_orders;

SELECT REPLACE(Status, ' ', '-') FROM employee_orders;

-- Date Functions
-- NOW(), CURRENT_DATE(), CURRENT_TIME(), DATE(), TIME(), DATE_ADD(), DATE_SUB(), DATEDIFF(), DATE_FORMAT(), DAY(), MONTH(), YEAR(), HOUR(), MINUTE(), SECOND()
-- COALESCE()

SELECT NOW() FROM orders;

SELECT CURRENT_DATE() FROM orders;

SELECT CURRENT_TIME() FROM orders;

SELECT DATE(OrderDate) FROM orders;

SELECT TIME(OrderDate) FROM orders;

SELECT DATE_ADD(OrderDate, INTERVAL 1 DAY) FROM orders;

SELECT DATE_SUB(OrderDate, INTERVAL 1 DAY) FROM orders;

SELECT DATEDIFF(CURRENT_DATE(), OrderDate) FROM orders;

SELECT DATE_FORMAT(OrderDate, '%d %M %Y') FROM orders;

SELECT DAY(OrderDate) FROM orders;

SELECT MONTH(OrderDate) FROM orders;

SELECT YEAR(OrderDate) FROM orders;

SELECT HOUR(OrderDate) FROM orders;

SELECT MINUTE(OrderDate) FROM orders;

SELECT SECOND(OrderDate) FROM orders;

SELECT OrderID, ItemID, Quantity, Cost,  OrderDate,COALESCE (DeliveryDate,'NOT DELIVERED'), OrderStatus 
FROM mg_orders;

-- Comparison Functions
-- GREATEST(), LEAST(), ISNULL(), NULLIF(), COALESCE()

SELECT GREATEST(OrderQty, OrderTotal) FROM orders;

SELECT LEAST(OrderQty, OrderTotal) FROM orders;

SELECT * FROM orders WHERE ISNULL(OrderDate);

-- it compares the two expressions (10 and 15) and returns NULL if they are equal. Otherwise, the first expression is returned. 
SELECT NULLIF(OrderTotal, OrderQty) FROM orders;

-- COALESCE() function returns the first non-null value in a list.
SELECT COALESCE(OrderTotal, OrderQty) FROM orders;
SELECT COALESCE(OrderTotal, OrderQty, 0) FROM orders;
SELECT COALESCE(NULL, 'Coursera', NULL, 'Database');

-- Control Flow Functions
-- CASE

SELECT CASE
    WHEN OrderTotal > 1000 THEN 'High'
    WHEN OrderTotal > 500 THEN 'Medium'
    ELSE 'Low'
END AS OrderStatus
FROM orders;

SELECT * FROM MenuItems
WHERE Type in (SELECT CASE
                WHEN Type = 'Desserts' THEN 'Desserts'
                WHEN Type = NULL THEN 'Starters'
                ELSE 'Main Courses'
                END as ItemType
                FROM MenuItems
            )

-- Variables

-- Outside

SET @variable_name = 100;
SELECT * FROM orders WHERE OrderQty > @variable_name;

SELECT @max_price := MAX(OrderTotal) FROM orders;
SELECT @max_price;

-- Inside SELECT
-- stores value in that variable
SELECT AVG(OrderTotal) INTO @variable_name FROM orders;
SELECT @variable_name

-- User defined functions

CREATE FUNCTION GetTotalCost(Cost DECIMAL(5, 2)) RETURNS DECIMAL(5, 2) DETERMINISTIC
BEGIN
    IF (Cost >= 100 AND Cost < 500) THEN SET Cost = Cost - (Cost * 0.1);
    ELSEIF (Cost >= 500) THEN SET Cost = Cost - (Cost * 0.2);
    END IF;
    RETURN (Cost);
END;

DROP GetTotalCost;