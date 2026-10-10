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
