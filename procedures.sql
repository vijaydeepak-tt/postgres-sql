CREATE PROCEDURE getAllOrders() SELECT * FROM Orders;

CALL getAllOrders()

DROP PROCEDURE getAllOrders;

CREATE PROCEDURE getAllLowestPriceOrders(lowestPrice INT)
SELECT * FROM Orders WHERE OrderTotal < lowestPrice;

CALL getAllLowestPriceOrders(500);

DROP PROCEDURE getAllLowestPriceOrders;

-- PARAMETERS - IN, OUT, INOUT
-- In PARAMETER

CREATE PROCEDURE CalculateTax(IN Salary DECIMAL(10, 2)) SELECT Salary * 0.2 as TAX;
CALL CalculateTax(10000);

-- OUT PARAMETER

CREATE PROCEDURE GetLowestCost (OUT lowestCost DECIMAL(10, 2)) SELECT MIN(OrderTotal) INTO lowestCost FROM Orders;
CALL GetLowestCost(@lowest_cost);
SELECt @lowest_cost;

-- INOUT PARAMETER

CREATE PROCEDURE SquareANumber(INOUT number INT)
BEGIN
    SET number = number * number;
END;

SET @number = 10;
CALL SquareANumber(@number);
SELECT @number;

-- COMPLEX PROCEDURES

CREATE PROCEDURE GetItemSummary(OUT NumberOfLowPriceProducts INT, OUT NumberOfHighPriceProducts INT)
BEGIN
    SELECT COUNT(Name) INTO NumberOfLowPriceProducts FROM item WHERE Cost < 500;
    SELECT COUNT(Name) INTO NumberOfHighPriceProducts FROM item WHERE Cost > 500;
END;

CALL GetItemSummary(@NumberOfLowPriceProducts, @NumberOfHighPriceProducts);
SELECT @NumberOfLowPriceProducts, @NumberOfHighPriceProducts