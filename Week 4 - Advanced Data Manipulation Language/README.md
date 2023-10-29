# University Database Documentation

This repository contains SQL scripts for creating and manipulating a university's database system. These scripts handle various entities within the university, such as students and their associated data.

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
-- Insert data into the student table
INSERT INTO student (id, nameStudent, cityAddress, age, GPA, department)
VALUES
(1, "Adi", "Jakarta", 17, 2.5, "Math"),
-- ... [additional records] ...
(20, "Fandi", "Surabaya", 19, 3.4, NULL);
```
This command adds new records of students into the 'student' table.

## queries.sql

The `queries.sql` script contains various SQL commands used for inserting, updating, and querying data in the database. Below are the contents and explanations.

```sql
-- Unique city addresses from student table
SELECT DISTINCT cityAddress FROM student;
```
This query retrieves unique city addresses from the 'student' table, avoiding duplicates.

```sql
-- Student names from the Computer department
SELECT nameStudent from student WHERE department = 'Computer';
```
This command is used to fetch names of students from the 'Computer' department.

```sql
-- Student details sorted by age
SELECT NIM, nameStudent, cityAddress FROM student ORDER BY age DESC;
```
This query is for retrieving student details, sorted by their age in descending order.

```sql
-- Youngest students from Jakarta
SELECT nameStudent, age FROM student WHERE cityAddress = 'Jakarta' ORDER BY age ASC LIMIT 3;
```
This statement fetches the names and ages of the three youngest students based in 'Jakarta'.

```sql
-- Students with low GPAs from Jakarta
SELECT nameStudent, GPA from student WHERE cityAddress = 'Jakarta' AND GPA < 2.5;
```
This command changes the name and city of the customer with the number 'C-009'.

```sql
-- Students from Yogyakarta or older than 20
SELECT nameStudent FROM student WHERE cityAddress = 'Yogyakarta' OR age > 20;
```
Here, we're adding new transaction records with the current date as the transaction date.

```sql
-- Students not from Jakarta or Surabaya
SELECT nameStudent, cityAddress FROM student WHERE cityAddress NOT IN ('Jakarta', 'Surabaya');
```
This command deletes the first two records in the 'Transactions' table.

```sql
-- Students with GPAs between certain values
SELECT nameStudent, age, GPA FROM student WHERE GPA BETWEEN 2.5 AND 3.5;
```
This statement removes the last two records from the 'Transactions' table.

```sql
-- Students with 'a' in their names
SELECT nameStudent FROM student WHERE nameStudent LIKE '%a%';
```
This query retrieves names of students who have the letter 'a' in their names.

```sql
-- Students with unspecified departments
SELECT NIM FROM student WHERE department IS NULL;
```
This command fetches the NIMs of students who haven't specified their departments.

## Usage

To use these scripts, execute the `createTable.sql` script in your MySQL environment to set up the database structure. After that, you can run commands from `queries.sql` to perform various data manipulations and queries as needed.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.