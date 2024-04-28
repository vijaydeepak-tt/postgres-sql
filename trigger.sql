-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER} {INSERT | UPDATE| DELETE}
-- ON table_name FOR EACH ROW
-- -- BEGIN
--     statement one
--     statement two
-- END

-- DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name; -- schema_name is optional

-- TRIGGER WORKS -> STATEMENT TYPE (not works for mysql), ROW TYPE
-- TRIGGER TYPE -> BEFORE, AFTER -> INSERT, UPDATE, DELETE

CREATE TRIGGER update_order_total
BEFORE UPDATE ON Orders
FOR EACH ROW
SET NEW.OrderTotal = NEW.OrderQty * NEW.Price;

CREATE TRIGGER LogNewOrder
AFTER INSERT ON Orders
FOR EACH ROW
INSERT INTO OrderLog VALUES ('New order', NEW.OrderID, NEW.OrderDate);

DROP TRIGGER IF EXISTS update_order_total;

SHOW TRIGGERS;
-- SHOW TRIGGERS
-- [{FROM | IN} database_name]
-- [LIKE 'pattern' | WHERE search_condition];
