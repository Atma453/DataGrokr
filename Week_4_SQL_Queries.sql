-- DataGrokr - Week 4: SQL Queries for Beginners
-- Dialect: MySQL 8.0+
-- Topics: SELECT, WHERE, ORDER BY, LIMIT, aliases, NULL handling, aggregates,
-- GROUP BY, HAVING, JOINs, CASE WHEN, string/date functions, DDL, constraints,
-- output practice, and query-writing practice.

-- ============================================================
-- 1. CREATE SAMPLE TABLES AND INSERT DATA
-- ============================================================

DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Finance');

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    city VARCHAR(50),
    manager_id INT,
    join_date DATE,
    bonus DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees
    (emp_id, emp_name, salary, dept_id, city, manager_id, join_date, bonus)
VALUES
(101, 'Rahul', 50000, 1, 'Bangalore', NULL, '2024-01-15', 5000),
(102, 'Priya', 60000, 1, 'Mysore', 101, '2023-05-20', NULL),
(103, 'Amit', 40000, 2, 'Bangalore', 101, '2024-03-10', 3000),
(104, 'Sneha', 70000, 3, 'Mumbai', NULL, '2022-11-05', 7000),
(105, 'Kiran', 45000, 2, 'Mysore', 103, '2023-08-12', NULL),
(106, 'Anu', 55000, 1, 'Chennai', 101, '2025-02-01', 4000);

-- ============================================================
-- 2. SELECT, WHERE, ORDER BY, LIMIT, ALIASES
-- ============================================================

-- Query 1: Display all employees
SELECT * FROM Employees;

-- Query 2: Display employee names and salaries
SELECT emp_name, salary FROM Employees;

-- Query 3: Find employees earning more than 50000
SELECT * FROM Employees WHERE salary > 50000;

-- Query 4: Find employees living in Bangalore
SELECT * FROM Employees WHERE city = 'Bangalore';

-- Query 5: Find employees earning between 40000 and 60000
SELECT * FROM Employees WHERE salary BETWEEN 40000 AND 60000;

-- Query 6: Sort employees by salary in descending order
SELECT * FROM Employees ORDER BY salary DESC;

-- Query 7: Display the top three highest-paid employees
SELECT * FROM Employees ORDER BY salary DESC LIMIT 3;

-- Query 8: Use column aliases
SELECT emp_name AS Name, salary AS Monthly_Salary FROM Employees;

-- Query 9: Find employees from Bangalore or Mysore
SELECT * FROM Employees WHERE city IN ('Bangalore', 'Mysore');

-- Query 10: Find employee names starting with A
SELECT * FROM Employees WHERE emp_name LIKE 'A%';

-- ============================================================
-- 3. NULL HANDLING: IS NULL, IS NOT NULL, COALESCE, NULLIF
-- ============================================================

-- Query 11: Find employees without a bonus
SELECT * FROM Employees WHERE bonus IS NULL;

-- Query 12: Find employees who have a bonus
SELECT * FROM Employees WHERE bonus IS NOT NULL;

-- Query 13: Replace NULL bonuses with zero
SELECT emp_name, COALESCE(bonus, 0) AS Bonus FROM Employees;

-- Query 14: Return NULL if salary is zero
SELECT emp_name, NULLIF(salary, 0) AS Salary FROM Employees;

-- Query 15: Replace NULL bonuses with 1000
SELECT emp_name, COALESCE(bonus, 1000) AS Final_Bonus FROM Employees;

-- Example: COALESCE returns the first non-NULL argument
SELECT COALESCE(NULL, 100) AS Example_COALESCE;

-- ============================================================
-- 4. AGGREGATE FUNCTIONS, GROUP BY, HAVING
-- ============================================================

-- Query 16: Count total employees
SELECT COUNT(*) AS Total_Employees FROM Employees;

-- Query 17: Calculate total salary
SELECT SUM(salary) AS Total_Salary FROM Employees;

-- Query 18: Calculate average salary
SELECT AVG(salary) AS Average_Salary FROM Employees;

-- Query 19: Find highest and lowest salaries
SELECT MAX(salary) AS Highest_Salary, MIN(salary) AS Lowest_Salary
FROM Employees;

-- Query 20: Count employees in each department
SELECT dept_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY dept_id
ORDER BY dept_id;

-- Query 21: Find average salary in each department
SELECT dept_id, AVG(salary) AS Average_Salary
FROM Employees
GROUP BY dept_id
ORDER BY dept_id;

-- Query 22: Find departments with more than one employee
SELECT dept_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 1;

-- Query 23: Find departments whose average salary exceeds 50000
SELECT dept_id, AVG(salary) AS Average_Salary
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 50000;

-- ============================================================
-- 5. JOIN QUERIES
-- ============================================================

-- Query 24: INNER JOIN - employees with matching departments
SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d ON e.dept_id = d.dept_id;

-- Query 25: LEFT JOIN - all employees and matching departments
SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id;

-- Query 26: RIGHT JOIN - all departments and matching employees
SELECT e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;

-- Query 27: FULL OUTER JOIN equivalent for MySQL using LEFT JOIN + UNION
SELECT e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d ON e.dept_id = d.dept_id;

-- Query 28: Find employees earning more than their department average
SELECT e.emp_name, e.salary, e.dept_id
FROM Employees e
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM Employees
    GROUP BY dept_id
) AS d ON e.dept_id = d.dept_id
WHERE e.salary > d.avg_salary;

-- Query 29: SELF JOIN - employee and manager names
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;

-- ============================================================
-- 6. CASE WHEN, STRING FUNCTIONS, DATE FUNCTIONS
-- ============================================================

-- Query 30: Categorize salaries
SELECT emp_name, salary,
       CASE
           WHEN salary >= 60000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Category
FROM Employees;

-- Query 31: Convert names to uppercase
SELECT UPPER(emp_name) AS Employee_Name FROM Employees;

-- Query 32: Find the length of each employee name
SELECT emp_name, LENGTH(emp_name) AS Name_Length FROM Employees;

-- Query 33: Combine employee names and cities
SELECT CONCAT(emp_name, ' - ', city) AS Details FROM Employees;

-- Query 34: Extract joining year (MySQL)
SELECT emp_name, YEAR(join_date) AS Joining_Year FROM Employees;

-- Query 35: Find employees who joined after January 1, 2024
SELECT * FROM Employees WHERE join_date > '2024-01-01';

-- Query 36: Calculate annual salary
SELECT emp_name, salary * 12 AS Annual_Salary FROM Employees;

-- Additional string/date examples
SELECT LOWER(emp_name) AS Lowercase_Name FROM Employees;
SELECT SUBSTRING(emp_name, 1, 3) AS First_Three_Characters FROM Employees;
SELECT MONTH(join_date) AS Joining_Month FROM Employees;
SELECT NOW() AS Current_Date_Time;
SELECT CURRENT_DATE AS Current_Date;

-- ============================================================
-- 7. DDL: CREATE TABLE, ALTER TABLE, CONSTRAINTS
-- ============================================================

-- Query 37: Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(100) UNIQUE
);

-- Query 38: Add a new column
ALTER TABLE Students ADD COLUMN city VARCHAR(50);

-- Query 39: Modify a column (MySQL syntax)
ALTER TABLE Students MODIFY COLUMN student_name VARCHAR(100);

-- Query 40: Rename a column (MySQL syntax)
ALTER TABLE Students RENAME COLUMN city TO student_city;

-- Query 41: Remove a column
ALTER TABLE Students DROP COLUMN student_city;

-- Query 42: Drop the Students table
-- Uncomment the next line only if you want to delete the table.
-- DROP TABLE Students;

-- ============================================================
-- 8. PREDICT-THE-OUTPUT PRACTICE
-- ============================================================

-- Question 1:
-- Predict the result before running:
SELECT emp_name, salary
FROM Employees
WHERE salary >= 50000
ORDER BY salary DESC;
-- Expected order: Sneha (70000), Priya (60000), Anu (55000), Rahul (50000).

-- Question 2:
SELECT dept_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY dept_id
ORDER BY dept_id;
-- Expected: dept_id 1 = 3, dept_id 2 = 2, dept_id 3 = 1.

-- Question 3:
SELECT COUNT(bonus) AS Employees_With_Bonus
FROM Employees;
-- Expected: 4, because COUNT(column) ignores NULL values.

-- Question 4:
SELECT dept_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) >= 2;
-- Expected: dept_id 1 and dept_id 2.

-- ============================================================
-- 9. QUERY-WRITING PRACTICE
-- ============================================================

-- Query 43: Find the second-highest distinct salary
SELECT MAX(salary) AS Second_Highest_Salary
FROM Employees
WHERE salary < (SELECT MAX(salary) FROM Employees);

-- Query 44: Department names with average salary greater than 50000
SELECT d.dept_name, AVG(e.salary) AS Average_Salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING AVG(e.salary) > 50000;

-- Query 45: Find the highest-paid employee
SELECT *
FROM Employees
WHERE salary = (SELECT MAX(salary) FROM Employees);

-- Query 46: Find employees whose names contain 'a'
SELECT *
FROM Employees
WHERE emp_name LIKE '%a%';

-- Query 47: Employees earning more than 50000 and living in Bangalore
SELECT *
FROM Employees
WHERE salary > 50000 AND city = 'Bangalore';

-- Query 48: Find employees without a manager
SELECT *
FROM Employees
WHERE manager_id IS NULL;

-- Query 49: Count employees in each city
SELECT city, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY city;

-- Query 50: Display salary increased by 10% without updating stored values
SELECT emp_name, salary * 1.10 AS Updated_Salary
FROM Employees;

-- Query 51: Calculate total bonus, ignoring NULL values
SELECT SUM(bonus) AS Total_Bonus
FROM Employees;

-- Query 52: Find employees who joined during 2024
SELECT *
FROM Employees
WHERE join_date >= '2024-01-01'
  AND join_date < '2025-01-01';

-- ============================================================
-- 10. QUICK REVISION EXAMPLES
-- ============================================================

-- SELECT: display data
SELECT * FROM Employees;

-- WHERE: filter rows
SELECT * FROM Employees WHERE salary > 50000;

-- ORDER BY: sort results
SELECT * FROM Employees ORDER BY salary DESC;

-- LIMIT: restrict result count
SELECT * FROM Employees LIMIT 3;

-- GROUP BY: group records
SELECT dept_id, COUNT(*) FROM Employees GROUP BY dept_id;

-- HAVING: filter groups
SELECT dept_id, COUNT(*)
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 1;

-- INNER JOIN: matching rows
SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d ON e.dept_id = d.dept_id;

-- CASE WHEN: conditional output
SELECT emp_name,
       CASE WHEN salary >= 50000 THEN 'At least 50000'
            ELSE 'Below 50000'
       END AS Salary_Status
FROM Employees;

-- ============================================================
-- END OF DATAGROKR WEEK 4 SQL PRACTICE
-- ============================================================
