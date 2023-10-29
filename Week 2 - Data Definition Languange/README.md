
# University Database Documentation

This repository contains SQL scripts for creating and manipulating a university's database system. These scripts handle various entities within the university, such as students, lecturers, subjects, and course selections (KRS).

## Structure

The SQL scripts are divided into two main files:

1. `createTables.sql` - Contains commands for initializing the database and creating tables with the necessary attributes.
2. `queries.sql` - Consists of various SQL queries used for database manipulation, including structural modifications, data type changes, and specific data queries.

## createTables.sql

This script is responsible for creating the initial tables in our database. Below is the content of the script along with explanations for each command.

```sql
-- Student Table
CREATE TABLE IF NOT EXISTS student(
    NIM INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255),
    gender ENUM('M', 'F'),
    birth_place TINYTEXT,
    birth_date DATE,
    address TEXT,
    phone INT
) ENGINE=InnoDB;
```
The command above creates a table for students, with various attributes including name, gender, place of birth, date of birth, address, and phone number.

```sql
-- Lecturer Table
CREATE TABLE IF NOT EXISTS lecturer(
    NIP INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lecturer_name VARCHAR(255),
    gender ENUM('M', 'F'),
    laboratory VARCHAR(255),
    interests VARCHAR(255),
    address TEXT,
    phone INT
) ENGINE=InnoDB;
```
This command sets up a table for lecturers, covering details such as name, gender, associated laboratory, academic interests, address, and phone number.

```sql
-- Subject Table
CREATE TABLE IF NOT EXISTS subject(
    course_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255),
    NIP INT NOT NULL,
    credits INT,
    FOREIGN KEY (NIP) REFERENCES lecturer(NIP),
    credits TINYINT,
    day DATE,
    hour TINYINT,
    classroom VARCHAR(255),
    description TEXT
) ENGINE=InnoDB;
```
Here, we create a table for academic subjects, which includes comprehensive details about each course, its associated lecturer, and scheduling.

```sql
-- Course Selection (KRS) Table
CREATE TABLE IF NOT EXISTS KRS(
    KRS_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_code INT,
    FOREIGN KEY (course_code) REFERENCES subject(course_code),
    NIM INT NOT NULL,
    FOREIGN KEY(NIM) REFERENCES student(NIM),
    data_year YEAR,
    semester TINYINT
) ENGINE=InnoDB;
```
This section of the script is for the KRS table, which keeps track of students' course selections, including the academic year and semester details.

## queries.sql

The `queries.sql` script contains various SQL commands used for modifying and querying the database. Below are the contents and explanations.

```sql
-- Show all tables
SHOW TABLES;
```
This command lists all the tables present in the database.

```sql
-- Describe table structures
DESCRIBE student;
DESCRIBE lecturer;
DESCRIBE subject;
DESCRIBE KRS;
```
These commands provide a detailed view of the structure for each specified table.

```sql
-- Rename 'lecturer' table to 'professor'
RENAME TABLE lecturer TO professor;
```
This command renames the 'lecturer' table to 'professor'.

```sql
-- Rename 'lecturer_name' to 'prof_name'
ALTER TABLE professor CHANGE lecturer_name prof_name VARCHAR(255);
```
This statement changes the column name from 'lecturer_name' to 'prof_name' in the 'professor' table.

```sql
-- Add 'mother_name' column
ALTER TABLE student ADD COLUMN mother_name VARCHAR(255) AFTER birth_date;
```
This command introduces a new column for the mother's name in the 'student' table.

```sql
-- Modify 'gender' column values
ALTER TABLE student MODIFY COLUMN gender ENUM('Male', 'Female');
```
This statement updates the 'gender' column in the 'student' table to contain more descriptive values.

```sql
-- Change 'phone' data type
ALTER TABLE student MODIFY COLUMN phone INT;
```
This command alters the data type for the 'phone' column in the 'student' table.

```sql
-- Remove primary key from 'KRS_id'
ALTER TABLE KRS DROP PRIMARY KEY;
```
This statement removes the primary key designation from the 'KRS_id' column.

```sql
-- Reassign primary key to 'KRS_id'
ALTER TABLE KRS ADD PRIMARY KEY (KRS_id);
```
This command reinstates the 'KRS_id' column as the primary key.

```sql
-- Delete 'description' column
ALTER TABLE subject DROP COLUMN description;
```
This statement eliminates the 'description' column from the 'subject' table.

## Usage

To use these scripts, execute the `createTables.sql` script in your MySQL environment to set up the database structure. After that, you can run commands from `queries.sql` to perform various operations and modifications as needed.

## Contributions

Feel free to contribute to this project by submitting pull requests or opening issues for any bugs or suggestions.
