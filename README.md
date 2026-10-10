# CLI Grade Calculator

A beginner-friendly Python CLI Grade Calculator that calculates student grades using functions, loops, dictionaries, lists, tuples, sets, file handling, and exception handling.

## Features

- Enter student details
- Enter marks for multiple subjects
- Calculate total marks
- Calculate average marks
- Calculate grades automatically
- Display overall performance
- Display PASS or FAIL result
- Save results to a text file
- Save results to a CSV file
- View previously saved results
- View students calculated during the current session
- Display the grade scale
- Handle invalid user input

## Subjects

The calculator uses the following subjects:

- Python
- Data Structures
- Database
- Computer Networks
- Communication Skills

## Grade Scale

| Marks | Grade |
|---|---|
| 90 - 100 | A+ |
| 80 - 89 | A |
| 70 - 79 | B |
| 60 - 69 | C |
| 50 - 59 | D |
| Below 50 | F |

A student must score at least 50 marks in every subject to PASS.

## Concepts Covered

This project covers the following Week 1 Python fundamentals:

- Data types
- Variables
- Operators
- Type conversion
- Lists
- Tuples
- Sets
- Dictionaries
- `if`, `elif`, `else`
- `for` loops
- `while` loops
- Functions
- Function arguments
- Return values
- String operations
- Text file handling
- CSV file handling
- `try`, `except`, `finally`
- User input
- Basic error handling

## Project Structure

```text
CLI-Grade-Calculator/
│
├── grade_calculator.py
├── grades.txt
├── grades.csv
└── README.md
```

`grades.txt` and `grades.csv` are created automatically when results are saved.

## Requirements

- Python 3.x
- No external Python libraries are required.

## How to Run

Open the project folder in the terminal and run:

```bash
python grade_calculator.py
```

On some systems, you may need:

```bash
python3 grade_calculator.py
```

## How It Works

When the program starts, it displays a menu:

```text
1. Calculate Student Grade
2. Display Grade Scale
3. View Saved Results
4. View Students in Current Session
5. Exit
```

Choose option `1` to enter student information and marks.

The program calculates:

```text
Total Marks
Average Marks
Grade for Each Subject
Overall Performance
PASS / FAIL Result
```

The result can then be saved to:

```text
grades.txt
grades.csv
```

## Example

```text
CLI GRADE CALCULATOR

1. Calculate Student Grade
2. Display Grade Scale
3. View Saved Results
4. View Students in Current Session
5. Exit

Enter your choice: 1

Enter Student Details
Enter student name: Rahul
Enter student ID: 101

Enter marks for Python (0-100): 85
Enter marks for Data Structures (0-100): 78
Enter marks for Database (0-100): 91
Enter marks for Computer Networks (0-100): 67
Enter marks for Communication Skills (0-100): 88

GRADE REPORT
Student Name: Rahul
Student ID: 101

Python: 85.00 - A
Data Structures: 78.00 - B
Database: 91.00 - A+
Computer Networks: 67.00 - C
Communication Skills: 88.00 - A

Total Marks: 409.00
Average: 81.80
Performance: Very Good
Result: PASS
```

## File Handling

The project demonstrates both text and CSV file handling.

### Text File

Results are stored in:

```text
grades.txt
```

### CSV File

Results are stored in:

```text
grades.csv
```

The CSV file can be opened using Excel, Google Sheets, or other spreadsheet applications.

## Exception Handling

The program handles:

- Invalid mark input
- Marks outside the `0-100` range
- Missing files
- File input/output errors
- Keyboard interruption

# DataGrokr – Week 2: OOP Bank Account

A beginner-friendly Python banking application built using **Object-Oriented Programming (OOP)**. This project supports deposits, withdrawals, balance checking, transaction history, CSV file handling, and transaction dataset analysis using Pandas.

## Project Overview

The OOP Bank Account project simulates basic banking operations through a menu-driven command-line interface. It stores transaction details and uses Pandas to analyze the saved CSV dataset.

## Features

- Create and manage a bank account
- Deposit money into an account
- Withdraw money from an account
- Check the current account balance
- View transaction history
- Save transaction details to a CSV file
- Analyze transaction data using Pandas
- Calculate total transactions
- Calculate total deposits and withdrawals
- Calculate average transaction amount
- Identify maximum and minimum transactions
- Handle invalid amounts and insufficient balance

## Technologies Used

- Python
- Object-Oriented Programming (OOP)
- Pandas
- CSV file handling

## Project Structure

```text
DataGrokr-Week-2/
│
├── bank_account.py
├── transactions.csv
├── requirements.txt
└── README.md
```

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/DataGrokr-Week-2.git
```

### 2. Navigate to the Project Directory

```bash
cd DataGrokr-Week-2
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

## Requirements

Create a `requirements.txt` file containing:

```text
pandas
```

## How to Run

Execute the Python program using:

```bash
python bank_account.py
```

## Menu Options

```text
===== OOP BANK ACCOUNT =====
1. Deposit
2. Withdraw
3. Check Balance
4. Transaction History
5. Save Transactions
6. Analyze CSV
7. Exit
```

## Example Execution

### Deposit

```text
Enter your choice: 1
Enter deposit amount: 2000
₹2000.00 deposited successfully
```

### Withdraw

```text
Enter your choice: 2
Enter withdrawal amount: 566
₹566.00 withdrawn successfully
```

### Check Balance

```text
Enter your choice: 3
Current Balance: ₹6434.00
```

### Transaction History

```text
Enter your choice: 4

Transaction History

Date                  Type          Amount    Balance
2026-09-17 10:03:58   Deposit       2000.0    7000.0
2026-09-17 10:04:04   Withdrawal     566.0    6434.0
```

### Save Transactions

```text
Enter your choice: 5
Transactions saved to transactions.csv
```

### Analyze CSV Dataset

```text
Enter your choice: 6

Total Transactions: 2
Total Deposits: 2000.0
Total Withdrawals: 566.0
Average Transaction: 1283.0
Maximum Transaction: 2000.0
Minimum Transaction: 566.0
```

**Note:** Save the transaction history using option 5 before selecting option 6. The CSV file must exist for the analysis to work.

## CSV Dataset

The `transactions.csv` file stores the transaction date, type, amount, and account balance.

Example:

```csv
Date,Type,Amount,Balance
2026-09-17 10:03:58,Deposit,2000.0,7000.0
2026-09-17 10:04:04,Withdrawal,566.0,6434.0
```

## Concepts Covered

### 1. Classes and Objects

The `BankAccount` class represents a bank account, and its objects maintain account details and transaction records.

### 2. Constructor

The `__init__()` method initializes the account number, account holder name, initial balance, and transaction history.

### 3. Methods

The project uses methods to perform banking operations:

- `deposit()` – deposits money
- `withdraw()` – withdraws money
- `check_balance()` – displays the current balance
- `show_transactions()` – displays transaction history
- `save_transactions()` – saves transactions to CSV

### 4. Conditional Statements

Conditional statements validate transaction amounts and check whether sufficient balance is available for withdrawals.

### 5. Loops

A `while` loop repeatedly displays the menu until the user exits the application.

### 6. File Handling

CSV file handling stores transaction records for future analysis.

### 7. Pandas Data Analysis

Pandas reads the CSV dataset and calculates transaction statistics using DataFrames and aggregation functions.

## Learning Outcomes

By completing this project, I practiced:

- Implementing Object-Oriented Programming in Python
- Creating classes, objects, constructors, and methods
- Building a menu-driven application
- Performing deposit and withdrawal operations
- Validating user input and transaction amounts
- Reading and writing CSV files
- Using Pandas DataFrames
- Performing basic data analysis
- Organizing Python projects for GitHub

## Future Enhancements

- Support multiple bank accounts
- Add PIN-based authentication
- Implement money transfers between accounts
- Store account information in SQLite or MySQL
- Add transaction search and filtering
- Generate transaction summary charts
- Develop a graphical user interface

# Week 3 - ETL Pipeline + Tests

A Python-based **ETL (Extract, Transform, Load) Pipeline** that extracts data from a REST API, transforms the data using Pandas, and loads the processed data into a CSV file. The project also includes automated unit testing using Pytest.

## Features

- Extract data from a REST API
- Process JSON responses using Python Requests
- Convert JSON data into a Pandas DataFrame
- Select required columns
- Clean and format text data
- Remove duplicate records
- Calculate title length and body length
- Save transformed data to a CSV file
- Perform automated testing using Pytest
- Validate data transformation and CSV file creation

## Technologies Used

- Python
- Pandas
- Requests
- Pytest
- REST API
- CSV
- Google Colab

## API Used

The project uses the JSONPlaceholder REST API to retrieve sample post data.

API URL: https://jsonplaceholder.typicode.com/posts

## ETL Process

The pipeline follows three main stages:

```text
REST API
   |
   v
EXTRACT
   |
   v
JSON Data
   |
   v
TRANSFORM
   |
   v
Pandas DataFrame
   |
   v
LOAD
   |
   v
etl_output.csv
```

### 1. Extract

The Extract stage retrieves JSON data from the REST API using the Python Requests library.

```python
response = requests.get(API_URL)
response.raise_for_status()
data = response.json()
```

### 2. Transform

The Transform stage converts the extracted data into a Pandas DataFrame and performs data cleaning.

The operations include:

- Selecting required columns
- Removing extra spaces from text
- Formatting titles
- Cleaning body text
- Calculating title length
- Calculating body length
- Removing duplicate records

The original dataset contains the following columns:

- `userId`
- `id`
- `title`
- `body`

The transformed dataset also includes:

- `title_length`
- `body_length`

### 3. Load

The Load stage saves the transformed data into a CSV file named `etl_output.csv`.

The output file can be opened using Microsoft Excel, Google Sheets, or Pandas.

## Project Structure

```text
Week-3-ETL-Pipeline/
│
├── ETL_Pipeline.ipynb
├── etl.py
├── test_etl.py
├── etl_output.csv
└── README.md
```

## File Description

| File | Description |
|---|---|
| `ETL_Pipeline.ipynb` | Google Colab notebook containing the ETL implementation and execution results |
| `etl.py` | Contains the Extract, Transform, and Load functions |
| `test_etl.py` | Contains automated unit tests using Pytest |
| `etl_output.csv` | Stores the transformed dataset |
| `README.md` | Project documentation |

## Requirements

Install the required Python libraries using:

```bash
pip install pandas requests pytest
```

In Google Colab, run:

```python
!pip install pandas requests pytest -q
```

## How to Run

### Step 1: Run the ETL Pipeline

Run the following command in your terminal from the project directory:

```bash
python etl.py
```

The pipeline extracts data from the API, transforms it using Pandas, and saves the output to `etl_output.csv`.

### Step 2: Run Unit Tests

Execute the following command:

```bash
pytest -v test_etl.py
```

Pytest runs the test cases and displays whether each test passes or fails.

## ETL Functions

The project contains four main functions.

### `extract_data()`

Fetches data from the REST API and returns the extracted JSON data.

### `transform_data()`

Converts the extracted data into a Pandas DataFrame and performs data cleaning and transformation.

### `load_data()`

Saves the transformed DataFrame into a CSV file.

### `run_etl()`

Executes the complete ETL process by calling the Extract, Transform, and Load functions.

## Data Transformation

The final dataset contains the following columns:

| Column | Description |
|---|---|
| `userId` | Identifier of the user who created the post |
| `id` | Unique post identifier |
| `title` | Cleaned and formatted post title |
| `body` | Cleaned post body |
| `title_length` | Number of characters in the title |
| `body_length` | Number of characters in the body |

## Testing with Pytest

Pytest is used to verify the correctness of the ETL pipeline.

The tests check:

- Whether the transformation function returns a DataFrame
- Whether the expected columns exist
- Whether title formatting works correctly
- Whether body text is cleaned correctly
- Whether duplicate records are removed
- Whether title and body lengths are calculated correctly
- Whether the CSV output file is created successfully

Run the tests using:

```bash
pytest -v test_etl.py
```

A successful run should report that all seven tests passed, assuming the test file contains the seven test cases and the implementation is correct.

## Sample Output

An example of the pipeline output is shown below. The exact messages depend on the implementation.

```text
Starting ETL Pipeline...

1. Extracting data from REST API...
Records fetched: 100

2. Transforming data...
Transformation completed.

3. Loading data into CSV...
CSV saved: etl_output.csv

ETL Pipeline completed successfully.
```

## Running in Google Colab

The project can also be executed in Google Colab.

The notebook should include:

1. Installing the required libraries
2. Creating the ETL implementation
3. Extracting data from the REST API
4. Transforming the data using Pandas
5. Saving the output to CSV
6. Creating the Pytest test file
7. Running the automated tests
8. Displaying the transformed data

Save the notebook as `ETL_Pipeline.ipynb`.

For GitHub, include the notebook, Python source files, test file, and generated CSV output.

## Learning Objectives

Through this project, I learned how to:

- Work with REST APIs
- Extract JSON data using Requests
- Process datasets using Pandas
- Clean and transform data
- Save processed data to CSV
- Organize Python code into reusable functions and modules
- Write automated unit tests using Pytest
- Validate data processing and file output
- Execute Python projects using Google Colab

## Skills Covered

- Python Programming
- REST API Integration
- JSON Data Processing
- Pandas DataFrames
- Data Cleaning
- ETL Pipeline Development
- CSV File Handling
- Unit Testing
- Pytest
- Google Colab
- Debugging and Error Handling

## Week 3 Summary

This project demonstrates a complete ETL workflow using Python. Data is extracted from a REST API, transformed using Pandas, and loaded into a CSV file. Pytest is used to validate the data transformation and file-loading functionality.

The project builds practical skills in data processing, API integration, modular programming, and automated testing.

# DataGrokr – Week 4: SQL Fundamentals

A beginner-friendly SQL practice project covering data retrieval, filtering, sorting, NULL handling, aggregate functions, grouping, joins, conditional statements, string and date functions, and table creation and modification.

## Topics Covered

- SELECT, WHERE, ORDER BY, LIMIT and column aliases
- NULL handling using COALESCE, NULLIF, IS NULL and IS NOT NULL
- Aggregate functions: COUNT, SUM, AVG, MIN and MAX
- GROUP BY and HAVING
- SQL JOINs: INNER JOIN, LEFT JOIN, RIGHT JOIN and FULL OUTER JOIN
- CASE WHEN statements
- String functions and date/time functions
- DDL commands: CREATE TABLE, ALTER TABLE and DROP TABLE
- SQL constraints: PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE and CHECK
- Predict-the-output questions
- Query-writing practice

## Project Structure

```text
Week_4_SQL/
├── README.md
└── Week_4_SQL_Queries.sql
```

## Technologies Used

- SQL
- MySQL 8.0+
- MySQL Workbench
- Git and GitHub

## Database Tables

This project uses two main tables.

### 1. Employees

| Column | Description |
|---|---|
| emp_id | Employee ID and primary key |
| emp_name | Employee name |
| salary | Employee salary |
| dept_id | Department ID |
| city | Employee's city |
| manager_id | Employee's manager ID |
| join_date | Date the employee joined |
| bonus | Employee bonus |

### 2. Departments

| Column | Description |
|---|---|
| dept_id | Department ID and primary key |
| dept_name | Department name |

The `Employees` table uses a foreign key to reference the `Departments` table.

## SQL Concepts and Examples

### 1. SELECT and WHERE

Used to retrieve records and filter data based on conditions.

```sql
SELECT * FROM Employees;

SELECT emp_name, salary
FROM Employees
WHERE salary > 50000;
```

### 2. ORDER BY, LIMIT and Aliases

Used to sort query results, restrict the number of rows, and rename output columns.

```sql
SELECT emp_name AS Name, salary AS Monthly_Salary
FROM Employees
ORDER BY salary DESC
LIMIT 3;
```

### 3. NULL Handling

Used to check missing values and provide alternative values.

```sql
SELECT *
FROM Employees
WHERE bonus IS NULL;

SELECT emp_name, COALESCE(bonus, 0) AS Bonus
FROM Employees;

SELECT NULLIF(100, 100) AS Result;
```

### 4. Aggregate Functions

Used to calculate summaries from table data.

```sql
SELECT COUNT(*) AS Total_Employees
FROM Employees;

SELECT SUM(salary) AS Total_Salary
FROM Employees;

SELECT AVG(salary) AS Average_Salary
FROM Employees;

SELECT MAX(salary) AS Highest_Salary,
       MIN(salary) AS Lowest_Salary
FROM Employees;
```

### 5. GROUP BY and HAVING

Used to group records and filter groups based on aggregate conditions.

```sql
SELECT dept_id, COUNT(*) AS Employee_Count
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 1;
```

### 6. SQL JOINs

Used to retrieve related information from multiple tables.

```sql
SELECT e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;
```

The project includes examples of INNER JOIN, LEFT JOIN, RIGHT JOIN, a FULL OUTER JOIN equivalent for MySQL, and SELF JOIN.

### 7. CASE WHEN

Used to apply conditional logic in query results.

```sql
SELECT emp_name, salary,
       CASE
           WHEN salary >= 60000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS Salary_Category
FROM Employees;
```

### 8. String and Date Functions

Used to manipulate text and extract date information.

```sql
SELECT UPPER(emp_name) AS Employee_Name
FROM Employees;

SELECT CONCAT(emp_name, ' - ', city) AS Details
FROM Employees;

SELECT emp_name, YEAR(join_date) AS Joining_Year
FROM Employees;
```

### 9. DDL Commands

Used to create, modify and remove database objects.

```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(100) UNIQUE
);

ALTER TABLE Students
ADD COLUMN city VARCHAR(50);
```

## Important Practice Queries

The SQL file contains 52 numbered practice queries covering:

1. Retrieving and filtering employee records
2. Sorting salaries and selecting the top three employees
3. Handling NULL values
4. Calculating total and average salaries
5. Grouping employees by department
6. Filtering departments using HAVING
7. Joining employees with departments
8. Displaying employee and manager names
9. Categorizing salaries using CASE WHEN
10. Working with string and date functions
11. Creating and modifying database tables
12. Finding the second-highest salary
13. Finding the highest-paid employee
14. Counting employees by city
15. Finding employees who joined during 2024

## Key Differences to Remember

| Concept | Purpose |
|---|---|
| WHERE | Filters rows before grouping |
| HAVING | Filters groups after grouping |
| COUNT(*) | Counts rows |
| COUNT(column) | Counts non-NULL values in a column |
| INNER JOIN | Returns matching rows |
| LEFT JOIN | Returns all left-table rows and matching right-table rows |
| COALESCE() | Returns the first non-NULL value |
| NULLIF() | Returns NULL when two expressions are equal |
| PRIMARY KEY | Uniquely identifies each row |
| FOREIGN KEY | Establishes a relationship between tables |

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open `Week_4_SQL_Queries.sql` in MySQL Workbench.
3. Connect to your MySQL database server.
4. Execute the script to create the sample tables and insert data.
5. Run individual queries to practise each concept.
6. Attempt the output-prediction questions before executing them.

**Note:** The script uses MySQL syntax. The initial setup drops existing `Employees` and `Departments` tables with those names, so back up important data before running it. The `Students` table is created later in the script, and the final DROP TABLE example is commented out.

## Learning Outcomes

After completing Week 4, I can:

- Retrieve, filter and sort database records.
- Handle NULL values correctly.
- Use aggregate functions to summarize data.
- Group records and filter aggregated results.
- Join related tables to retrieve combined information.
- Apply conditional logic using CASE WHEN.
- Use common string and date functions.
- Create and modify tables using DDL commands.
- Write SQL queries for practical problems.
- Predict SQL query outputs.

## Repository File

- `Week_4_SQL_Queries.sql` – Contains sample table creation, sample data, SQL examples, output-prediction practice and query-writing exercises.

