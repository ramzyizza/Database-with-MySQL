# Advanced University Database Manipulation

This repository contains advanced SQL scripts for creating and manipulating a university's database system, focusing on more complex data retrieval and aggregation functions.

## Structure

The SQL scripts are divided into two main files:

1. `createTable.sql` - Contains commands for initializing the database and creating tables with the necessary attributes.
2. `queries.sql` - Consists of various SQL queries used for advanced data manipulation and retrieval within the database.

## createTable.sql

This script is responsible for creating the initial tables in our database. Below is the content of the script along with explanations for each command.

```sql
-- Create database for the university
CREATE DATABASE IF NOT EXISTS university;

-- Use the university database
USE university;

-- Student Table
CREATE TABLE IF NOT EXISTS student(
    id INT NOT NULL,
    NIM INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameStudent VARCHAR(255) NOT NULL,
    cityAddress VARCHAR(100),
    age INT(25),
    GPA DECIMAL(2,1) NOT NULL,
    DEPARTMENT VARCHAR(100) NULL
) AUTO_INCREMENT = 12345, ENGINE=InnoDB;
```
The command above creates a table for students, with attributes including student ID, name, city of residence, age, GPA, and department.

```sql
--Insert data into the table
INSERT INTO student (id, nameStudent, cityAddress, age, IPK, department)
VALUES
(1, "Adi", "Jakarta", 17, 2.5, "Math"),
(2, "Ani", "Yogyakarta", 20, 2.1, "Math"),
(3, "Ari", "Surabaya", 18, 2.5, "Computer"),
(4, "Ali", "Banjarmasin", 20, 3.5, "Computer"),
(5, "Abi", "Medan", 17, 3.7, "Math"),
(6, "Budi", "Jakarta", 19, 3.8, "Computer"),
(7, "Boni", "Yogyakarta", 20, 3.2, "Computer"),
(8, "Bobi", "Surabaya", 17, 2.7, "Computer"),
(9, "Beni", "Banjarmasin", 18, 2.3, "Computer"),
(10, "Cepi", "Jakarta", 20, 2.2, NULL),
(11, "Coni", "Yogyakarta", 22, 2.6, NULL),
(12, "Ceki", "Surabaya", 21, 2.5, "Math"),
(13, "Dodi", "Jakarta", 20, 3.1, "Math"),
(14, "Didi", "Yogyakarta", 19, 3.2, "Physics"),
(15, "Deri", "Surabaya", 19, 3.3, "Physics"),
(16, "Eli", "Jakarta", 20, 2.9, "Physics"),
(17, "Endah", "Yogyakarta", 18, 2.8, "Physics"),
(18, "Feni", "Jakarta", 17, 2.7, NULL),
(19, "Farah", "Yogyakarta", 18, 3.5, NULL),
(20, "Fandi", "Surabaya", 19, 3.4, NULL);
```
This command adds new records of students into the 'student' table.

## queries.sql

The `queries.sql` script contains various SQL commands used for inserting, updating, and querying data in the database. Below are the contents and explanations.

```sql
-- Unique city addresses from student table
SELECT cityAddress FROM Student GROUP BY cityAddress;
```
This query retrieves unique city addresses from the 'student' table, avoiding duplicates by using GROUP BY.

```sql
-- Highest GPA from students in Jakarta
SELECT MAX(GPA) 'Highest GPA', cityAddress 'City Address'
FROM student GROUP BY cityAddress HAVING cityAddress = 'Jakarta';
```
This command is used to fetch the highest GPA among students from 'Jakarta'.

```sql
-- Lowest GPA from students in the Computer department
SELECT MIN(GPA) 'Lowest GPA', department 'Department' 
FROM student GROUP BY department HAVING department = 'Computer';
```
This query is for retrieving the lowest GPA among students from the 'Computer' department.

```sql
-- Total number of students in the Computer department
SELECT COUNT(*) 'Total Student', department 'Department'
FROM student GROUP BY department HAVING department = 'Computer';
```
This statement fetches the total number of students in the 'Computer' department.

```sql
-- Average GPA in the Math department
SELECT AVG(GPA) 'Average GPA', department 'Department'
FROM student GROUP BY department HAVING department = 'Math';
```
This command calculates the average GPA for students in the 'Math' department.

```sql
-- Number of students in each department, excluding NULL
SELECT COUNT(NIM) 'Total Student', department 'Department'
FROM student GROUP BY department HAVING department IS NOT NULL;
```
This query shows the number of students in each department, specifically omitting departments that are NULL.

```sql
-- Number of students from each city
SELECT COUNT(NIM) 'Total Student', cityAddress 'City Address'
FROM student GROUP BY cityAddress;
```
This command counts the number of students in each city.

```sql
-- Number of students under 20 by city
SELECT COUNT(*) 'Total Student', cityAddress 'City Address'
FROM student WHERE age < 20 GROUP BY cityAddress;
```
This query retrieves the number of students younger than 20 in each city.

## Usage

To use these scripts, execute the `createTable.sql` script in your MySQL environment to set up the database structure. After that, you can run commands from `queries.sql` to perform various data manipulations and queries as needed.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.