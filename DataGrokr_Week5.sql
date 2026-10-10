-- DataGrokr Week 5: Intermediate + Advanced SQL
-- Main dialect: MySQL 8.0+
-- Run the script from top to bottom.
-- EXCEPT / INTERSECT and materialized views are database-specific; see notes near the end.

CREATE DATABASE IF NOT EXISTS datagrokr_week5;
USE datagrokr_week5;

-- =========================================================
-- 0. RESET TABLES (safe to rerun; deletes previous sample data)
-- =========================================================
DROP VIEW IF EXISTS employee_salary_view;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    manager_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO departments VALUES
(1, 'IT'), (2, 'HR'), (3, 'Finance'), (4, 'Sales');

INSERT INTO employees VALUES
(101, 'Amit', 1, NULL, 90000, '2022-01-10'),
(102, 'Priya', 1, 101, 75000, '2023-03-15'),
(103, 'Rahul', 2, NULL, 60000, '2021-06-20'),
(104, 'Sneha', 2, 103, 65000, '2024-02-12'),
(105, 'Kiran', 3, NULL, 80000, '2022-08-05'),
(106, 'Neha', 3, 105, 70000, '2023-11-25'),
(107, 'Arjun', 4, NULL, 55000, '2024-01-10'),
(108, 'Divya', 4, 107, 60000, '2025-04-18');

INSERT INTO customers VALUES
(1, 'Customer A', 'Bengaluru'),
(2, 'Customer B', 'Mysuru'),
(3, 'Customer C', 'Hubballi'),
(4, 'Customer D', 'Bengaluru'),
(5, 'Customer E', 'Mangaluru');

INSERT INTO orders VALUES
(1001, 1, '2025-01-10', 5000),
(1002, 2, '2025-01-15', 3000),
(1003, 1, '2025-02-05', 7000),
(1004, 3, '2025-02-20', 2000),
(1005, 4, '2025-03-10', 9000),
(1006, 2, '2025-03-15', 4000);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Mouse', 'Electronics', 800),
(3, 'Keyboard', 'Electronics', 1500),
(4, 'Chair', 'Furniture', 5000),
(5, 'Desk', 'Furniture', 12000),
(6, 'Notebook', 'Stationery', 100);

-- Verify sample data
SHOW TABLES;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

-- =========================================================
-- 1. SUBQUERIES: SCALAR
-- =========================================================

-- Employees earning more than the overall average salary
SELECT employee_id, employee_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Product(s) with the highest price
SELECT product_name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- Employees earning the maximum salary
SELECT employee_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- =========================================================
-- 2. CORRELATED SUBQUERIES
-- =========================================================

-- Employees earning more than their department's average salary
SELECT e.employee_id, e.employee_name, e.department_id, e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- Departments that have at least one employee earning above 70000
SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND e.salary > 70000
);

-- =========================================================
-- 3. EXISTS / NOT EXISTS
-- =========================================================

-- Customers who have placed at least one order
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Customers who have never placed an order
SELECT c.customer_id, c.customer_name
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Departments with no employees
SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);

-- =========================================================
-- 4. NORMALIZATION: 1NF TO 3NF
-- =========================================================

-- Example of a 1NF table: one value per column, one subject per row.
CREATE TABLE student_courses_1nf (
    student_id INT,
    student_name VARCHAR(100),
    course_id INT,
    course_name VARCHAR(100),
    instructor_id INT,
    instructor_name VARCHAR(100),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO student_courses_1nf VALUES
(1, 'Anu', 101, 'SQL', 501, 'Meera'),
(1, 'Anu', 102, 'Python', 502, 'Ravi'),
(2, 'Ravi', 101, 'SQL', 501, 'Meera');

SELECT * FROM student_courses_1nf;

-- 2NF: separate student data, course data, and student-course enrollment.
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students VALUES (1, 'Anu'), (2, 'Ravi');
INSERT INTO courses VALUES (101, 'SQL', 501), (102, 'Python', 502);
INSERT INTO enrollments VALUES (1, 101), (1, 102), (2, 101);

SELECT s.student_name, c.course_name
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN courses c ON c.course_id = e.course_id;

-- 3NF: instructor details are kept in a separate table.
CREATE TABLE instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100) NOT NULL
);

ALTER TABLE courses
ADD CONSTRAINT fk_courses_instructor
FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id);

INSERT INTO instructors VALUES (501, 'Meera'), (502, 'Ravi');

SELECT c.course_name, i.instructor_name
FROM courses c
JOIN instructors i ON i.instructor_id = c.instructor_id;

-- =========================================================
-- 5. WINDOW FUNCTIONS: RANK, DENSE_RANK, ROW_NUMBER
-- =========================================================

SELECT employee_name, department_id, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_salary_rank
FROM employees;

-- Rank employees inside each department
SELECT employee_name, department_id, salary,
       RANK() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC
       ) AS department_rank
FROM employees;

-- Top 2 paid employees per department
WITH ranked_employees AS (
    SELECT employee_id, employee_name, department_id, salary,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE rn <= 2;

-- =========================================================
-- 6. WINDOW FUNCTIONS: LAG AND LEAD
-- =========================================================

-- Compare each employee's salary with the previous salary in salary order
SELECT employee_name, salary,
       LAG(salary) OVER (ORDER BY salary) AS previous_salary,
       LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM employees;

-- Compare each customer's order amount with their previous order
SELECT customer_id, order_date, amount,
       LAG(amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS previous_order_amount,
       LEAD(amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS next_order_amount
FROM orders;

-- =========================================================
-- 7. WINDOW FRAMES
-- =========================================================

-- Running total of order amounts
SELECT order_id, order_date, amount,
       SUM(amount) OVER (
           ORDER BY order_date, order_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM orders;

-- Moving average of the current and previous two orders
SELECT order_id, order_date, amount,
       AVG(amount) OVER (
           ORDER BY order_date, order_id
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_average
FROM orders;

-- Total order amount per customer, repeated on each order row
SELECT order_id, customer_id, amount,
       SUM(amount) OVER (PARTITION BY customer_id) AS customer_total
FROM orders;

-- =========================================================
-- 8. RECURSIVE CTEs
-- =========================================================

-- Generate numbers from 1 to 10
WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT n FROM numbers;

-- Employee reporting hierarchy; manager_id links to employee_id
WITH RECURSIVE employee_hierarchy AS (
    SELECT employee_id, employee_name, manager_id, 1 AS hierarchy_level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id, e.employee_name, e.manager_id,
           eh.hierarchy_level + 1
    FROM employees e
    JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT * FROM employee_hierarchy
ORDER BY hierarchy_level, employee_id;

-- =========================================================
-- 9. UNION / INTERSECT / EXCEPT
-- =========================================================

-- UNION: combines results and removes duplicates
SELECT city FROM customers WHERE city = 'Bengaluru'
UNION
SELECT city FROM customers WHERE city = 'Mysuru';

-- UNION ALL: combines results and keeps duplicates
SELECT city FROM customers WHERE city = 'Bengaluru'
UNION ALL
SELECT city FROM customers WHERE city = 'Mysuru';

-- INTERSECT equivalent in MySQL: customers who have placed orders
SELECT customer_id FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- EXCEPT equivalent in MySQL: customers who have never placed orders
SELECT customer_id FROM customers c
WHERE NOT EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id
);

-- Native INTERSECT and EXCEPT are supported by PostgreSQL and several other
-- database systems, but not by MySQL 8.0. Use these in PostgreSQL:
-- SELECT customer_id FROM customers
-- INTERSECT
-- SELECT customer_id FROM orders;
--
-- SELECT customer_id FROM customers
-- EXCEPT
-- SELECT customer_id FROM orders;

-- =========================================================
-- 10. ROLLUP
-- =========================================================

-- Subtotals by category plus a grand total (MySQL syntax)
SELECT category, SUM(price) AS total_price
FROM products
GROUP BY category WITH ROLLUP;

-- =========================================================
-- 11. CUBE AND GROUPING SETS
-- =========================================================

-- MySQL does not support GROUP BY CUBE or GROUPING SETS.
-- PostgreSQL examples (run only in PostgreSQL):
-- SELECT category, SUM(price) AS total_price
-- FROM products
-- GROUP BY CUBE(category);
--
-- SELECT category, SUM(price) AS total_price
-- FROM products
-- GROUP BY GROUPING SETS ((category), ());
--
-- MySQL alternative for category totals plus grand total:
SELECT category, SUM(price) AS total_price
FROM products
GROUP BY category
UNION ALL
SELECT 'GRAND TOTAL' AS category, SUM(price) AS total_price
FROM products;

-- =========================================================
-- 12. STANDARD VIEWS
-- =========================================================

CREATE OR REPLACE VIEW employee_salary_view AS
SELECT e.employee_id, e.employee_name, d.department_name, e.salary
FROM employees e
JOIN departments d ON d.department_id = e.department_id;

SELECT * FROM employee_salary_view;

SELECT employee_name, salary
FROM employee_salary_view
WHERE salary > 70000;

-- Inspect view definition
SHOW CREATE VIEW employee_salary_view;

-- =========================================================
-- 13. MATERIALIZED VIEWS
-- =========================================================

-- MySQL does not provide native CREATE MATERIALIZED VIEW syntax.
-- A common MySQL alternative is a summary table that you refresh manually.
CREATE TABLE department_salary_summary AS
SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS employee_count,
       COALESCE(SUM(e.salary), 0) AS total_salary,
       COALESCE(AVG(e.salary), 0) AS average_salary
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

SELECT * FROM department_salary_summary;

-- Refresh the stored summary by rebuilding it
TRUNCATE TABLE department_salary_summary;

INSERT INTO department_salary_summary
SELECT d.department_id, d.department_name,
       COUNT(e.employee_id) AS employee_count,
       COALESCE(SUM(e.salary), 0) AS total_salary,
       COALESCE(AVG(e.salary), 0) AS average_salary
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

SELECT * FROM department_salary_summary;

-- PostgreSQL native materialized view examples (run only in PostgreSQL):
-- CREATE MATERIALIZED VIEW department_salary_mv AS
-- SELECT d.department_id, d.department_name,
--        COUNT(e.employee_id) AS employee_count,
--        COALESCE(SUM(e.salary), 0) AS total_salary,
--        COALESCE(AVG(e.salary), 0) AS average_salary
-- FROM departments d
-- LEFT JOIN employees e ON e.department_id = d.department_id
-- GROUP BY d.department_id, d.department_name;
--
-- REFRESH MATERIALIZED VIEW department_salary_mv;

-- =========================================================
-- 14. EXTRA PRACTICE QUERIES
-- =========================================================

-- Total salary per department
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Number of orders and total spending per customer
SELECT c.customer_id, c.customer_name,
       COUNT(o.order_id) AS order_count,
       COALESCE(SUM(o.amount), 0) AS total_spent
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Products priced above their category average
SELECT p.product_name, p.category, p.price
FROM products p
WHERE p.price > (
    SELECT AVG(p2.price)
    FROM products p2
    WHERE p2.category = p.category
);

-- Latest order per customer using ROW_NUMBER
WITH latest_orders AS (
    SELECT o.*,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id
               ORDER BY order_date DESC, order_id DESC
           ) AS rn
    FROM orders o
)
SELECT * FROM latest_orders WHERE rn = 1;

-- Clean up objects manually if needed:
-- DROP VIEW IF EXISTS employee_salary_view;
-- DROP TABLE IF EXISTS department_salary_summary;
