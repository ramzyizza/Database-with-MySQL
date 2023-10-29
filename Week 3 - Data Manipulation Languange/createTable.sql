-- Create table for the store database
CREATE DATABASE IF NOT EXIST STORE;

--Create table for Customer, Product, Transaction
CREATE TABLE IF NOT EXISTS Customer(
    customerNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    customerName VARCHAR(255) NOT NULL,
    city VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Product(
    productNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    productName VARCHAR(255) NOT NULL,
    stock INT(3) DEFAULT 15
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS Transactions(
    transactionNumber VARCHAR(5) NOT NULL PRIMARY KEY,
    transactionDate DATE,
    customerNUmber VARCHAR(5),
    FOREIGN KEY (customerNumber) REFERENCES Customer(customerNumber)
) ENGINE=InnoDB;
