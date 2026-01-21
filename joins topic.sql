CREATE DATABASE joins_practice;
USE joins_practice;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    customer_id INT
);
INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Ali', 'Lahore'),
(2, 'Ahmed', 'Karachi'),
(3, 'Sara', 'Islamabad'),
(4, 'Zain', 'Multan');
INSERT INTO orders (order_id, order_date, amount, customer_id) VALUES
(101, '2025-01-10', 5000, 1),
(102, '2025-01-11', 3000, 2),
(103, '2025-01-12', 7000, 1),
(104, '2025-01-13', 2000, 5);
SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id

UNION

SELECT 
    customers.customer_name,
    orders.order_id,
    orders.amount
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;
-- 10. Customers Without Orders
SELECT 
    customers.customer_name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;
-- 11. Orders Without Valid Customers
SELECT 
    orders.*
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.customer_id IS NULL;
 -- Total Order Amount per Customer
SELECT 
    customers.customer_name,
    SUM(orders.amount) AS total_amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name;
