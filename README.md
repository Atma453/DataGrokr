# DataGrokr
# CLI Grade Calculator

A beginner-friendly Python CLI Grade Calculator that calculates student grades using functions, loops, dictionaries, lists, tuples, sets, file handling, and exception handling.

## Features

* Enter student details
* Enter marks for multiple subjects
* Calculate total marks
* Calculate average marks
* Calculate grades automatically
* Display overall performance
* Display PASS or FAIL result
* Save results to a text file
* Save results to a CSV file
* View previously saved results
* View students calculated during the current session
* Display the grade scale
* Handle invalid user input

## Subjects

The calculator uses the following subjects:

* Python
* Data Structures
* Database
* Computer Networks
* Communication Skills

## Grade Scale

| Marks    | Grade |
| -------- | ----- |
| 90 - 100 | A+    |
| 80 - 89  | A     |
| 70 - 79  | B     |
| 60 - 69  | C     |
| 50 - 59  | D     |
| Below 50 | F     |

A student must score at least 50 marks in every subject to PASS.

## Concepts Covered

This project covers the following Week 1 Python fundamentals:

* Data types
* Variables
* Operators
* Type conversion
* Lists
* Tuples
* Sets
* Dictionaries
* `if`, `elif`, `else`
* `for` loops
* `while` loops
* Functions
* Function arguments
* Return values
* String operations
* Text file handling
* CSV file handling
* `try`, `except`, `finally`
* User input
* Basic error handling

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

* Python 3.x
* No external Python libraries are required.

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

* Invalid mark input
* Marks outside the `0-100` range
* Missing files
* File input/output errors
* Keyboard interruption

## Learning Objective

The main objective of this project is to practice Python fundamentals by building a simple command-line application without using external frameworks or advanced concepts.
