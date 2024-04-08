-- https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-select/
-- select all from table
SELECT * FROM film;

-- select columns from table
SELECT first_name, last_name FROM actor;

-- DISTINCT keyword
SELECT DISTINCT first_name, last_name FROM actor;

SELECT DISTINCT release_year FROM film;

SELECT DISTINCT(release_year) FROM film;

SELECT DISTINCT(rental_rate) FROM film;

SELECT DISTINCT * FROM customer; -- 599

SELECT DISTINCT first_name FROM customer; --591

-- COUNT keyword
SELECT COUNT(*) FROM actor; -- 200

SELECT COUNT(DISTINCT first_name) FROM actor; --128

-- WHERE and with BETWEEN, AND, OR keyword's
SELECT * FROM payment;

SELECT * FROm payment WHERE amount > 10; --107

SELECT * FROM rental WHERE staff_id = 2; --8004

SELECT * FROM payment WHERE amount BETWEEN 10 AND 11; --99

SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-10' AND '2007-02-15'; --27

SELECT * FROM customer WHERE store_id = 2 AND address_id > 100;  --227

SELECT COUNT(*) FROM film WHERE rating = 'R' AND rental_rate > 4; --65

SELECT * FROM film WHERE rating = 'R' OR rating = 'PG-13'; --418

SELECT title FROM film WHERE rating = 'PG' AND replacement_cost < 10; --9

SELECT * FROM language;

SELECT COUNT(picture) FROM staff; --1

SELECT * FROM staff WHERE picture IS null; --staff_id - 2

SELECT * FROM staff WHERE picture IS NOT null; --staff_id - 1

-- ORDER BY keyword
SELECT * FROM film ORDER BY film_id DESC;

SELECT store_id, first_name, last_name, customer_id FROM customer ORDER BY store_id, first_name DESC;

-- LIMIT keyword

SELECT * FROM film ORDER BY film_id DESC LIMIT 10;

SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-10' AND '2007-02-15' ORDER BY customer_id LIMIT 20;

-- IN keyword

SELECT * FROM payment WHERE amount IN(0.99, 1.98, 1.99) ORDER BY amount; --3301

SELECT * FROM payment WHERE amount NOT IN(0.99, 1.98, 1.99) ORDER BY amount; --11295

SELECT * FROM customer WHERE first_name IN('Lisa', 'Ruth');

-- LIKE, ILIKE keyword
SELECT * FROM customer WHERE first_name LIKE 'Ja%'; --15

SELECT * FROM customer WHERE first_name LIKE '%ar%'; --72 -- missing prefix, sufix

SELECT * FROM customer WHERE first_name LIKE 'M_r%'; --24 -- missing words

SELECT * FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%'; --5

SELECT * FROM customer WHERE first_name ILIKE 'J%' AND last_name ILIKE 'S%'; --5 -- case insensitive

SELECT * FROM customer WHERE first_name NOT LIKE '%ar%'; --527

--MIN keyword
SELECT MIN(replacement_cost) FROM film;

--MAX keyword
SELECT MAX(replacement_cost) FROM film;

SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;

--AVG keyword
SELECT AVG(replacement_cost) FROM film;

--ROUND keyword
SELECT ROUND(AVG(replacement_cost), 2) FROM film;

--SUM keyword
SELECT SUM(replacement_cost) FROM film;

--GROUP BY keyword
SELECT * FROM payment;

SELECT customer_id FROM payment GROUP BY customer_id;

--GROUP BY keyword with AGGRIGATION

SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;

SELECT customer_id, staff_id, SUM(amount) FROM payment GROUP BY customer_id, staff_id ORDER BY customer_id;

SELECT DATE(payment_date), SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount);

SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id ORDER BY COUNT(amount);

SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id;

--GROUP BY keyword with HAVING
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id HAVING SUM(amount) > 150;

SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id HAVING COUNT(customer_id) > 300;

--AS keyword (ALIAS)
SELECT COUNT(*) AS "Number of Transactions" FROM payment;

SELECT customer_id, SUM(amount) AS "Total Spent" FROM payment GROUP BY customer_id;

SELECT customer_id, SUM(amount) AS "Total Spent" FROM payment GROUP BY customer_id HAVING SUM(amount) < 100;


--Arithmetic Operator
--SELECT column_name1 + column_name2 FROM table_name;

SELECT amount * 12 AS "Annual Income" FROM payment;

SELECT * FROM employee WHERE salary + allowance <> 25000;
SELECT * FROM employee WHERE salary + allowance != 25000;

--SELECT column_name1 - column_name2 FROM table_name;
SELECT salary - tax FROM employee;

--SUB QUERY
SELECT * FROM Orders Where CustomerID in (SELECT CustomerID FROM Customers);

--ALL
SELECT * FROM Orders Where Price > ALL (SELECT Price FROM Products);
--ANY
SELECT * FROM Orders Where Price > ANY (SELECT Price FROM Products);
--EXISTS
SELECT * FROM Orders Where EXISTS (SELECT Price FROM Products);
--NOT EXISTS
SELECT * FROM Orders Where NOT EXISTS (SELECT Price FROM Products);
-- = 
SELECT OrderID FROM Orders Where Price =  (SELECT MAX(Price) FROM Orders);
