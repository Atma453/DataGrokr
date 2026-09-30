# DataGrokr

This repository contains my weekly Python projects completed as part of the DataGrokr training program.

---

# Week - 1 CLI Grade Calculator

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

grades.txt and grades.csv are created automatically when results are saved.

Requirements
Python 3.x
No external Python libraries are required.
How to Run

Open the project folder in the terminal and run:

python grade_calculator.py

On some systems, you may need:

python3 grade_calculator.py
How It Works

When the program starts, it displays a menu:

1. Calculate Student Grade
2. Display Grade Scale
3. View Saved Results
4. View Students in Current Session
5. Exit

Choose option 1 to enter student information and marks.

The program calculates:

Total Marks
Average Marks
Grade for Each Subject
Overall Performance
PASS / FAIL Result

The result can then be saved to:

grades.txt
grades.csv
Example
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
File Handling

The project demonstrates both text and CSV file handling.

Text File

Results are stored in:

grades.txt
CSV File

Results are stored in:

grades.csv

The CSV file can be opened using Excel, Google Sheets, or other spreadsheet applications.

Exception Handling

The program handles:

Invalid mark input
Marks outside the 0-100 range
Missing files
File input/output errors
Keyboard interruption
Learning Objective

The main objective of this project is to practice Python fundamentals by building a simple command-line application without using external frameworks or advanced concepts.

Week - 2 OOP Bank Account

A simple Object-Oriented Programming (OOP) Banking System built using Python.

The project allows users to perform basic banking operations such as deposits, withdrawals, balance checking, and transaction history management.

It also uses Pandas to save and analyze transaction data stored in a CSV file.

Features
Create and manage a bank account
Deposit money
Withdraw money
Check current balance
View transaction history
Save transactions to a CSV file
Analyze transaction data using Pandas
Calculate total transactions
Calculate total deposits
Calculate total withdrawals
Calculate average transaction amount
Find maximum and minimum transactions
Handle insufficient balance
Handle invalid transaction amounts
Technologies Used
Python
Pandas
CSV
Object-Oriented Programming
Project Structure
OOP-Bank-Account/
│
├── bank_account.py
├── transactions.csv
├── README.md
└── requirements.txt
Requirements

Install the required library using:

pip install pandas
How to Run
python bank_account.py
Banking Operations

The application provides the following operations:

===== OOP BANK ACCOUNT =====
1. Deposit
2. Withdraw
3. Check Balance
4. Transaction History
5. Save Transactions
6. Analyze CSV
7. Exit
Transaction Analysis

The project uses Pandas to analyze transaction data and calculate:

Total number of transactions
Total deposits
Total withdrawals
Average transaction amount
Maximum transaction
Minimum transaction
Example
===== OOP BANK ACCOUNT =====
1. Deposit
2. Withdraw
3. Check Balance
4. Transaction History
5. Save Transactions
6. Analyze CSV
7. Exit

Enter your choice: 1

Enter deposit amount: 2000

₹2000.00 deposited successfully
Learning Objective

The main objective of this project is to understand Object-Oriented Programming concepts in Python and apply them to a practical banking application.

The project also introduces Pandas-based transaction analysis and CSV file handling.

Week - 3 ETL Pipeline + Tests

A Python-based ETL (Extract, Transform, Load) Pipeline that fetches data from a REST API, transforms the data using Pandas, and saves the processed data into a CSV file.

The project also includes pytest unit tests to verify that the ETL functions work correctly.

Features
Fetch data from a REST API
Extract JSON data using Python Requests
Convert API data into a Pandas DataFrame
Select required columns
Clean and transform text data
Remove duplicate records
Calculate title length
Calculate body length
Save transformed data to CSV
Perform automated unit testing using pytest
Verify CSV file creation
Validate data transformation
Technologies Used
Python
Requests
Pandas
Pytest
REST API
CSV
API Used

The project uses the JSONPlaceholder REST API:

https://jsonplaceholder.typicode.com/posts

The API provides sample JSON data that is used as the input for the ETL pipeline.

ETL Process

The project follows three main stages:

REST API
    ↓
EXTRACT
    ↓
JSON Data
    ↓
TRANSFORM
    ↓
Pandas DataFrame
    ↓
LOAD
    ↓
CSV File
Extract

The requests library is used to fetch data from the REST API.

response = requests.get(API_URL)
response.raise_for_status()
data = response.json()

The API response contains JSON data that is passed to the transformation stage.

Transform

The extracted JSON data is converted into a Pandas DataFrame.

The transformation process includes:

Selecting required columns
Cleaning title text
Removing extra spaces
Formatting titles
Cleaning body text
Calculating title length
Calculating body length
Removing duplicate records

The original API data contains:

userId
id
title
body

Additional columns are generated during transformation:

title_length
body_length
Load

The transformed DataFrame is saved as:

etl_output.csv

The CSV file can be opened using:

Microsoft Excel
Google Sheets
Pandas
Other spreadsheet applications
Project Structure
ETL-Pipeline/
│
├── ETL_Pipeline.ipynb
├── etl.py
├── test_etl.py
├── etl_output.csv
└── README.md
File Description
File	Description
ETL_Pipeline.ipynb	Google Colab notebook containing the complete ETL implementation
etl.py	Python ETL pipeline containing Extract, Transform, and Load functions
test_etl.py	Pytest unit tests for the ETL functions
etl_output.csv	Final transformed dataset generated by the pipeline
README.md	Project documentation
Requirements

Install the required libraries using:

pip install pandas requests pytest

For Google Colab:

!pip install pandas requests pytest -q
How to Run
Run the ETL Pipeline
python etl.py

The pipeline will:

Extract data from REST API
        ↓
Transform data using Pandas
        ↓
Save data to etl_output.csv
Run Unit Tests
pytest -v test_etl.py
ETL Functions

The project contains the following main functions.

extract_data()

Fetches JSON data from the REST API.

transform_data()

Converts the API response into a Pandas DataFrame and performs data cleaning and transformation.

load_data()

Saves the transformed DataFrame into a CSV file.

run_etl()

Runs the complete Extract, Transform, and Load process.

Data Transformation

The final dataset contains the following columns:

Column	Description
userId	User identifier
id	Post identifier
title	Cleaned and formatted title
body	Cleaned body text
title_length	Number of characters in the title
body_length	Number of characters in the body
Testing

The project uses pytest for automated unit testing.

The tests verify:

DataFrame creation
Correct column names
Title transformation
Body text cleaning
Duplicate removal
Title length calculation
Body length calculation
CSV file creation

Run the tests using:

pytest -v test_etl.py
Test Results

The project contains 7 unit tests.

Expected result:

============================= test session starts =============================

collected 7 items

test_etl.py::test_transform_data_returns_dataframe PASSED
test_etl.py::test_transform_data_columns PASSED
test_etl.py::test_title_transformation PASSED
test_etl.py::test_body_transformation PASSED
test_etl.py::test_duplicate_removal PASSED
test_etl.py::test_length_columns PASSED
test_etl.py::test_load_data PASSED

============================== 7 passed ==============================
Sample ETL Output
Starting ETL Pipeline...

1. Extracting data from REST API...
Records fetched: 100

2. Transforming data...
Records after transformation: 100

3. Loading data into CSV...
CSV saved: etl_output.csv
Google Colab

The complete ETL pipeline can be executed in Google Colab.

The notebook contains:

Library installation
ETL implementation
REST API extraction
Pandas transformation
CSV generation
Pytest test creation
Pytest execution
Output preview

The Google Colab notebook is:

ETL_Pipeline.ipynb

The generated output is:

etl_output.csv
Google Colab Files

For the Week 3 submission, the following files should be included:

Week-3-ETL-Pipeline/
│
├── ETL_Pipeline.ipynb
├── etl.py
├── test_etl.py
├── etl_output.csv
└── README.md
ETL_Pipeline.ipynb

Contains the complete Google Colab implementation and execution results.

etl.py

Contains the main ETL pipeline functions.

test_etl.py

Contains the pytest unit tests.

etl_output.csv

Contains the transformed output generated by the ETL pipeline.

README.md

Contains the complete documentation for the project.

DataGrokr Weekly Progress
Week	Project	Main Concepts
Week 1	CLI Grade Calculator	Python Fundamentals, Functions, Collections, File Handling
Week 2	OOP Bank Account	OOP, Classes, Pandas, CSV, Data Analysis
Week 3	ETL Pipeline + Tests	REST API, Requests, Pandas, CSV, Pytest
Skills Covered So Far
Python
│
├── Fundamentals
├── Variables and Data Types
├── Operators
├── Conditional Statements
├── Loops
├── Functions
├── Lists
├── Tuples
├── Sets
├── Dictionaries
├── File Handling
├── Exception Handling
├── Object-Oriented Programming
├── Pandas
├── CSV Processing
├── REST APIs
├── ETL
└── Unit Testing with Pytest
Learning Progress

Through the first three weeks of DataGrokr training, the projects progress from basic Python programming to Object-Oriented Programming, data analysis, REST API integration, ETL processing, and automated testing.

Week 1

Focused on Python fundamentals and building a command-line application.

Week 2

Focused on Object-Oriented Programming, classes, banking operations, CSV handling, and Pandas-based data analysis.

Week 3

Focused on REST API integration, data extraction, data transformation using Pandas, CSV loading, and automated testing using pytest.

Technologies Covered
Technology	Usage
Python	Core programming language
Pandas	Data processing and analysis
Requests	REST API data extraction
Pytest	Automated unit testing
CSV	Data storage and processing
REST API	External data source
Google Colab	Development and execution environment
GitHub	Project version control and documentation
