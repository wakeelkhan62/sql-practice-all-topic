create database views;
use views;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department VARCHAR(30)
);
INSERT INTO employees VALUES
(1, 'Ali', 60000, 'IT'),
(2, 'Sara', 45000, 'HR'),
(3, 'Ahmed', 70000, 'IT'),
(4, 'Ayesha', 50000, 'Finance');
-- Create View
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM employees
WHERE salary > 50000;
SELECT * FROM high_salary_employees;
-- alter view
ALTER VIEW high_salary_employees AS
SELECT name, salary, department
FROM employees
WHERE salary > 50000;
-- drop view
DROP VIEW high_salary_employees;
-- create index on salary
CREATE INDEX idx_salary
ON employees(salary);
-- drop index
DROP INDEX idx_salary ON employees;





