
# Library Database Manipulation with Join

This repository contains advanced SQL scripts for creating and manipulating a library's database system, focusing on complex data retrieval and aggregation functions related to books, borrowing flows, and users.

## Structure

The SQL scripts are divided into several files:

1. `createTable.sql` - Contains commands for initializing the database and creating tables with the necessary attributes.
2. `insertData.sql` - Scripts for populating the tables with initial data.
3. `queries.sql` - Consists of various SQL queries used for advanced data manipulation and retrieval within the database.

## createTable.sql

This script sets up the initial tables in our database. Below is the content of the script along with explanations for each command.

```sql
-- Create table for books
CREATE TABLE bookTable(
    bookID INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bookTitle VARCHAR(255) NOT NULL,
    authorName VARCHAR(255) NOT NULL,
    borrowedStatus VARCHAR(100) NOT NULL
);

-- Create table for borrowing flow
CREATE TABLE flowTable(
    flowID INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userIDBorrowing INT(100) NOT NULL,
    bookIDBorrowed INT(100) NOT NULL,
    borrowDate DATE,
    returnDate DATE
);

-- Create table for users
CREATE TABLE userTable(
    userID INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    numberOfBorrowing INT(50),
    numberOfReturning INT(50)
);

-- Add foreign keys to establish relationships between tables
ALTER TABLE flowTable
ADD FOREIGN KEY (userIDBorrowing) REFERENCES userTable(userID),
ADD FOREIGN KEY (bookIDBorrowed) REFERENCES bookTable(bookID);

-- Set the initial value for AUTO_INCREMENT
ALTER TABLE bookTable AUTO_INCREMENT = 111;
ALTER TABLE flowTable AUTO_INCREMENT = 222;
ALTER TABLE userTable AUTO_INCREMENT = 333;
```

The commands above create three tables: 'bookTable' for storing book information, 'flowTable' for tracking borrowing activities, and 'userTable' for user data. It also establishes foreign key relationships and sets initial values for the AUTO_INCREMENT attribute.

## insertData.sql

This script populates the tables with initial data. Below are the contents and explanations.

```sql
INSERT INTO booktable(bookTitle, authorName, borrowedStatus)
VALUES
("Computer Networking: A Top-down Approach", "Jim Kurose", "Not Borrowed"),
("Cisco Networking All-in-one for Dummies", "Edward Tetz", "Not Borrowed"),
("Artificial Intelligence: A Modern Approach", "Peter Norvig", "Borrowed"),
("Deep Learning", "Aaron Courville", "Borrowed"),
("Database Systems: The Complete Book", "Jeffrey Ullman", "Borrowed"),
("Database System Concepts", "Avi Silberschatz", "Borrowed"),
("Python 3 Object Oriented Programming", "Dusty Phillips", "Not Borrowed"),
("Clean Code", "Robert Cecil Martin", "Borrowed"),
("Time Complexity Analysis", "Aditya Chatterjee", "Not Borrowed"),
("The Algorithm Design Manual", "Steven Skiena", "Not Borrowed");

INSERT INTO usertable(userName, numberOfBorrowing, numberOfReturning)
VALUES
("ramzy-izza", 0, 0),
("thor-odinson", 1, 1),
("tony-stark", 0, 0),
("peter-parker", 0, 0),
("steve-rogers", 4, 0),
("jane-foster", 0, 0),
("nick-fury", 0, 0),
("steven-strange", 0, 0);

INSERT INTO flowtable(userIDBorrowed, bookIDBorrowed, borrowDate, returnDate)
VALUES
(337, 113, "2021-12-12", "2021-12-15"),
(337, 114, "2022-05-15", "2022-05-25"),
(337, 115, "2022-01-07", "2022-01-11"),
(337, 116, "2022-10-21", "2022-10-25"),
(337, 118, "2022-01-20", "2022-02-02");
```

These commands add new records of books, users, and borrowing flows into their respective tables.

## queries.sql

The `queries.sql` script contains various SQL commands used for querying data in the database. Below are the contents and explanations.

```sql
-- Query books borrowed yesterday
SELECT bookTable.bookTitle, bookTable.borrowedStatus 
FROM bookTable
INNER JOIN flowTable 
ON bookTable.bookID = flowTable.bookIDBorrowed
WHERE flowTable.borrowDate = DATE_SUB(CURDATE(), INTERVAL 1 DAY);
```
This query retrieves all books that were borrowed yesterday.

```sql
-- Query all books and their borrower's userID if borrowed
SELECT bookTable.bookTitle, bookTable.borrowedStatus, flowTable.userIDBorrowing 
FROM bookTable
LEFT JOIN flowTable 
ON bookTable.bookID = flowTable.bookIDBorrowed;
```
This command fetches all books and, if applicable, the userID of the borrower.

```sql
-- Query all books borrowed and all user IDs regardless of borrowing status
SELECT bookTable.bookTitle, bookTable.borrowedStatus, userTable.userID 
FROM bookTable
LEFT JOIN flowTable 
ON flowTable.bookIDBorrowed = bookTable.bookID
RIGHT JOIN userTable 
ON userTable.userID = flowTable.userIDBorrowing;
```
This query retrieves all books and user IDs, indicating whether or not a book has been borrowed.

```sql
-- Query books borrowed by users who have borrowed more than 3 books
SELECT bookTable.bookTitle, userTable.userName 
FROM bookTable
INNER JOIN flowTable 
ON flowTable.bookIDBorrowed = bookTable.bookID
INNER JOIN userTable 
ON userTable.userID = flowTable.userIDBorrowing
WHERE userTable.numberOfBorrowing > 3;
```
This command fetches the titles of books and user names of borrowers who have borrowed more than three books.

## Usage

To use these scripts, execute the `createTable.sql` script in your MySQL environment to set up the database structure. Then, you can run commands from `insertData.sql` to populate the database and use `queries.sql` for various data manipulations and queries as needed.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.
