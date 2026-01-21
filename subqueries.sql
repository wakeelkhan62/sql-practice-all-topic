CREATE DATABASE company_db;
USE company_db;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT
);
INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');
INSERT INTO employees VALUES
(101, 'Ali', 60000, 1),
(102, 'Sara', 45000, 2),
(103, 'Ahmed', 70000, 1),
(104, 'Ayesha', 50000, 3);
select * from employees;
-- Employees earning more than average salary
SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
-- Employees working in IT department
SELECT emp_name
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'IT'
);
-- Departments that have employees
SELECT dept_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);



