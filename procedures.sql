CREATE PROCEDURE getAllOrders() SELECT * FROM Orders;

CALL getAllOrders()

DROP PROCEDURE getAllOrders;

CREATE PROCEDURE getAllLowestPriceOrders(lowestPrice INT)
SELECT * FROM Orders WHERE OrderTotal < lowestPrice;

CALL getAllLowestPriceOrders(500);

DROP PROCEDURE getAllLowestPriceOrders;