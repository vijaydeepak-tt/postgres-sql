-- one time events

-- CREATE EVENT [IF NOT EXISTS] event_name
-- ON SCHEDULE AT CURRENT_TIMESTAMP [+ INTERVAL]
-- DO
-- sql statement

CREATE EVENT IF NOT EXISTS GenerateRevenueReport
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 12 HOUR
DO
BEGIN
    INSERT INTO ReportData (OrderID, ClientID, ProductID, Quantity, Cost, Date)
    SELECT * FROm Orders
    WHERE Date BETWEEN '2022-08-01' AND '2022-08-31';
END

-- recurring events

-- CREATE EVENT [IF NOT EXISTS] event_name
-- ON SCHEDULE
-- EVERY [+ INTERVAL] or EVERY INTERVAL STARTS timestamp [+ INTERVAL] ENDS timestamp [+ INTERVAL]
-- DO
-- sql statement

CREATE EVENT IF NOT EXISTS DailyStockCheck
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    IF Products.NumberOfItemsINSERT < 10 THEN
        UPDATE Products SET NumberOfItems = 10;
    END IF;
END

DROP EVENT IF EXISTS DailyStockCheck;
