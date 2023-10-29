# Store Database Documentation

This repository contains SQL scripts for creating and manipulating a basic store's database system. These scripts handle various entities within the store, such as customers, products, and transactions.

## Structure

The SQL scripts are divided into two main files:

1. `createTable.sql` - Contains commands for initializing the database and creating tables with the necessary attributes.
2. `queries.sql` - Consists of various SQL queries used for data manipulation and retrieval within the database.

## createTable.sql

This script is responsible for creating the initial tables in our database. Below is the content of the script along with explanations for each command.

```sql
-- Create database for the store
CREATE DATABASE IF NOT EXISTS STORE;

-- Customer Table
CREATE TABLE IF NOT EXISTS Customer(
    customerNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    customerName VARCHAR(255) NOT NULL,
    city VARCHAR(100)
) ENGINE=InnoDB;
```
The command above creates a table for customers, with attributes including customer number, name, and city.

```sql
-- Product Table
CREATE TABLE IF NOT EXISTS Product(
    productNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    stock INT(3) DEFAULT 15
) ENGINE=InnoDB;
```
This command sets up a table for products, containing details such as product number, name, and stock.

```sql
-- Transactions Table
CREATE TABLE IF NOT EXISTS Transactions(
    transactionNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    transactionDate DATE,
    customerNumber VARCHAR(5),
    FOREIGN KEY (customerNumber) REFERENCES Customer(customerNumber)
) ENGINE=InnoDB;
```
Here, we create a table for transactions, which includes comprehensive details about each transaction, including a reference to the customer involved.

## queries.sql

The `queries.sql` script contains various SQL commands used for inserting, updating, and querying data in the database. Below are the contents and explanations.

```sql
-- Insert data into the Customer table
INSERT INTO Customer(customerNumber, customerName, city)
VALUES
    ('C-003', 'Geneva Electronics', 'Bandung'),
    ('C-007', 'Gama Store', 'Yogyakarta'),
    ('C-009', 'Family Mart', 'Medan'),
    ('C-011', 'Star Store', 'Bandung');
```
This command adds new records of customers into the 'Customer' table.

```sql
-- Insert data into the Product table
INSERT INTO Product(productNumber, productName, stock)
VALUES 
    ('P-100', 'Monitor 17', 15),
    ('P-120', 'Keyboard Ps2', 20),
    ('P-123', 'Mouse Ps2', 15),
    ('P-123', 'Memory 512', 10);
```
This statement inserts new products into the 'Product' table.

```sql
-- Insert data into the Transaction table
INSERT INTO Transactions(transactionNumber, transactionDate, customerNumber)
VALUES
    ('T-001', '2019-10-19', 'C-011'),
    ('T-002', '2020-01-10', 'C-003'),
    ('T-003', '2020-08-07', 'C-009'),
    ('T-004', '2020-09-09', 'C-007');
```
Here, we're adding new transaction records into the 'Transactions' table.

```sql
-- Unique city names from Customer table
SELECT DISTINCT city from Customer;
```
This query retrieves unique city names from the 'Customer' table, avoiding duplicates.

```sql
-- All customer data
SELECT * from Customer;
```
This command is used to fetch all data from the 'Customer' table.

```sql
-- Product names and stock quantities
SELECT productName, stock from Product;
```
This query is for retrieving the names and stock quantities of all products.

```sql
-- Customers from a specific city
SELECT customerName from Customer WHERE city = 'Bandung';
```
This statement fetches the names of customers based in 'Bandung'.

```sql
-- Transaction dates for a specific customer
SELECT transactionDate from Transactions WHERE customerNumber = 'C-007';
```
This query retrieves transaction dates for customer 'C-007'.

```sql
-- Products with a specific stock quantity
SELECT * FROM Product WHERE stock = 15;
```
This command fetches all products that have a stock quantity of 15.

```sql
-- Update a transaction date
UPDATE Transactions SET transactionDate = '2020-10-10' WHERE customerNumber = 'C-007';
```
This statement updates the transaction date for records where the customer number is 'C-007'.

```sql
-- Update customer details
UPDATE Customer SET customerName = 'HappyFamily Mart', city = 'Jakarta' WHERE customerNumber = 'C-009';
```
This command changes the name and city of the customer with the number 'C-009'.

```sql
-- Insert a new product with default stock value
INSERT INTO Product(productNumber, productName, stock) VALUES ('P-130', 'NIC D-Link', DEFAULT);
```
This statement adds a new product record with a default stock value.

```sql
-- Insert new transactions with the current date
INSERT INTO Transactions(transactionNumber, transactionDate, customerNumber) 
VALUES 
    ('T-005', CURRENT_DATE, 'C-003'), 
    ('T-006', CURRENT_DATE, 'C-011');
```
Here, we're adding new transaction records with the current date as the transaction date.

```sql
-- Delete the first two transactions
DELETE FROM Transactions ORDER BY transactionNumber LIMIT 2;
```
This command deletes the first two records in the 'Transactions' table.

```sql
-- Delete the last two transactions
DELETE FROM Transactions ORDER BY transactionNumber DESC LIMIT 2;
```
This statement removes the last two records from the 'Transactions' table.

## Usage

To use these scripts, execute the `createTable.sql` script in your MySQL environment to set up the database structure. After that, you can run commands from `queries.sql` to perform various data manipulations and queries as needed.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.
