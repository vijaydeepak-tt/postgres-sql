
-- Default selects - Using where
EXPLAIN SELECT EmployeeName FROM employees WHERE EmployeeName = 'Simon Tolo';

CREATE INDEX IdxEmployeeName On employees(EmployeeName);

-- Selects through Index
EXPLAIN SELECT EmployeeName FROM employees WHERE EmployeeName = 'Simon Tolo';

-- DROP INDEX
ALTER TABLE employees
DROP INDEX IdxEmployeeName;
