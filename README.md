Project Overview
This SQL project demonstrates solutions to a set of commonly asked SQL questions using
PostgreSQL syntax. It includes:
- Employee and Employee Details table creation
- Data insertion
- A series of queries covering data retrieval, aggregation, filtering, string operations, CTEs, window
functions, and more.
Database Schema
1. EMPLOYEE
- Emp_id (INT, Primary Key): Employee ID (unique)
- Emp_Name (VARCHAR): Name of the employee
- Gender (CHAR): Gender (Male/Female)
- Salary (INT): Salary of the employee
- City (CHAR): Employee's city
2. EMPLOYEE_DETAILS
- Emp_id (INT, Primary Key): Foreign key to EMPLOYEE
- Project (VARCHAR): Project name
- Emp_Position (CHAR): Job position
- DOJ (DATE): Date of joining
List of SQL Queries Included
Basic Queries
- Filter salary within a range
- Identify employees from the same city
- Find NULL values
- Retrieve 50% of records
Aggregation & Analysis
- Cumulative sum of salary
- Gender ratio calculation
- Count of employees by joining year
- Salary categorization (Low, Medium, High)
String Functions
- Replace last 2 digits of salary with 'XX'
- Pattern-based name filtering (e.g., starts/ends with vowels)
Row-Based Queries
- Odd/even row selection using ROW_NUMBER()
- Nth highest salary (with and without LIMIT)
- Highest salary per project
- Employees in the same project
Data Cleaning
- Detect and remove duplicate entries
Highlights
- Use of CTEs and Window Functions (e.g., ROW_NUMBER(), SUM() OVER)
- Demonstrates advanced filtering (SIMILAR TO, pattern matching)
- Multi-table joins and subqueries
- Well-structured real-world data scenarios
How to Run
1. Create the database using:
 CREATE DATABASE COMPANY1;
2. Use an SQL client (like pgAdmin, DBeaver, or psql).
3. Execute each section of the script in order:
 - Table creation
 - Data insertion
 - Query execution
File Info
- Filename: 10 SQL Questions solve.sql
- Total Questions Covered: 15+ (including sub-queries and variations)
- Database: PostgreSQL (may require minor changes for other RDBMS)
