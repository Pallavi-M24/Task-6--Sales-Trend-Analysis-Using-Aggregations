-- Task 6: Sales Trend Analysis Using Aggregations

-- Create Database
CREATE DATABASE online_sales;
USE online_sales;

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- Insert Sample Data
INSERT INTO orders VALUES
(1,'2025-01-05',1200,101),
(2,'2025-01-15',1500,102),
(3,'2025-02-10',1800,103),
(4,'2025-02-18',2200,104),
(5,'2025-03-05',2500,101),
(6,'2025-03-12',2700,102),
(7,'2025-04-08',3000,103),
(8,'2025-04-20',3200,104),
(9,'2025-05-11',3500,101),
(10,'2025-05-25',4000,102),
(11,'2025-06-03',4200,103),
(12,'2025-06-15',4500,104);

-- Query A: Monthly Revenue
SELECT
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- Query B: Monthly Order Volume
SELECT
    MONTH(order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;

-- Query C: Monthly Revenue and Order Volume
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Query D: Product-wise Revenue
SELECT
    product_id,
    SUM(amount) AS revenue
FROM orders
GROUP BY product_id
ORDER BY revenue DESC;

-- Query E: Revenue and Volume for Specific Time Period
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM orders
WHERE order_date >= '2025-04-01'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Query F: Top Revenue Month
SELECT
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_revenue DESC
LIMIT 1;