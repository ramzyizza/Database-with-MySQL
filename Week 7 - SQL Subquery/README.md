# Subqueries in SQL: Advanced Data Queries

This repository contains SQL scripts demonstrating the use of subqueries for advanced data retrieval and manipulation in a simulated inventory management system for a university's departments, specifically focusing on various locations and types of products or equipment.

## Structure

The SQL scripts are divided into several files:

1. `insertData.sql` - Contains commands for initializing the database, creating tables, and inserting initial data.
2. `queries.sql` - Consists of various SQL queries using subqueries for data manipulation and retrieval within the database.

## insertData.sql

This script sets up the initial tables in our database and populates them with data. Below is the content of the script along with explanations for each command.

```sql
-- Setting up the environment and creating the database
CREATE DATABASE IF NOT EXISTS `homework7` DEFAULT CHARACTER SET utf8mb4;
USE `homework7`;

-- Creating the table for locations
CREATE TABLE `tb_location` (
  `location_code` varchar(6) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`location_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data into the location table
INSERT INTO `tb_location`(`location_code`,`location_name`) VALUES 
('INFO01','Laboratorium 1 M Informatika'),
('INFO02','Laboratorium 2 M Informatika'),
('INFO03','Ruang Dosen M Informatika');

-- Creating the table for products
CREATE TABLE `tb_product` (
  `type_code` varchar(6) NOT NULL,
  `location_code` varchar(6) NOT NULL,
  `product_code` varchar(6) NOT NULL,
  `product_name` varbinary(100) DEFAULT NULL,
  `total` int(5) DEFAULT NULL,
  PRIMARY KEY (`type_code`,`location_code`,`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data into the product table
INSERT INTO `tb_product`(`type_code`,`location_code`,`product_code`,`product_name`,`total`) VALUES 
('A001','INFO02','AP004','Papan Tulis',11),
('E001','INFO01','EK0014','Komputer',2),
('E001','INFO01','EK0015','Printer',3),
('E001','INFO01','EK0016','LCD Projector',1),
('E001','INFO02','EK0014','Komputer',8),
('E001','INFO02','EK0015','Printer',6),
('E001','INFO02','EK0016','LCD Projector',2),
('M001','INFO01','MM011','Meja Komputer',35),
('M001','INFO01','MM012','Kursi Hidrolik',30),
('M001','INFO02','MM011','Meja Komputer',45),
('M001','INFO03','MM012','Kursi Hidrolik',10);

-- Creating the table for types
CREATE TABLE `tb_type` (
  `type_code` varchar(6) NOT NULL,
  `type_name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Inserting data into the type table
INSERT INTO `tb_type`(`type_code`,`type_name`,`description`) VALUES 
('A001','ATK','alat tulis kantor'),
('E001','Alat-alat elektronik','alat elektronik'),
('M001','Mebeler','alat mebel');
```

The commands above create three tables: 'tb_location' for storing location information, 'tb_product' for product data, and 'tb_type' for types of products. It also populates these tables with initial data.

## queries.sql

The `queries.sql` script contains various SQL commands used for querying data in the database using subqueries. Below are the contents and explanations.

```sql
-- 1. Retrieving items based on specific location criteria
SELECT product_code AS Code, product_name AS Name, total AS Quantity
FROM tb_product
WHERE location_code = ANY 
    (SELECT location_code
     FROM tb_location
     WHERE location_name = "Laboratorium 2 M Informatika");
```
This query retrieves all items from "Laboratorium 2 M Informatika" by matching the location codes.

```sql
-- 2. Retrieving items based on type and location
SELECT product_code AS Code, product_name AS Name
FROM tb_product
WHERE type_code IN 
    (SELECT type_code
     FROM tb_type
     WHERE type_name = "Alat-alat elektronik")
    OR location_code IN 
    (SELECT location_code
     FROM tb_location
     WHERE location_name = "Ruang Dosen M Informatika");
```
This query fetches all items of type "Alat-alat elektronik" or located in "Ruang Dosen M Informatika".

```sql
-- 3. Retrieving specific items from a specific location
SELECT product_code AS Code, product_name AS Name, total
FROM tb_product
WHERE type_code IN 
    (SELECT type_code
     FROM tb_type
     WHERE type_name = "Meubeler" OR type_name = "Alat-alat Elektronik")
    AND location_code IN 
    (SELECT location_code
     FROM tb_location
     WHERE location_name = "Laboratorium 2 M Informatika");
```
This query shows items of type "Meubeler" or "Alat-alat Elektronik" in "Laboratorium 2 M Informatika".

```sql
-- 4. Excluding certain items from the query results
SELECT *
FROM tb_product
WHERE type_code NOT IN 
    (SELECT type_code
     FROM tb_type
     WHERE type_name = "Meubeler")
    AND location_code NOT IN 
    (SELECT location_code
     FROM tb_location
     WHERE location_name = "Laboratorium 2 M Informatika");
```
This query retrieves all items except those of type "Meubeler" or those in "Laboratorium 2 M Informatika".

```sql
-- 5. Adding a new item based on the characteristics of an existing item
INSERT INTO tb_product
SELECT
    tb_product.type_code,
    tb_product.location_code,
    "AP005",
    "Spidol",
    total*2 AS total
FROM tb_product
WHERE product_name = "Papan Tulis";
```
This command adds a new product "Spidol" with double the quantity of "Papan Tulis".

```sql
-- 6. Adding a new item with quantity based on the total of another item
INSERT INTO tb_product
SELECT
    "E001",
    (SELECT location_code
     FROM tb_location
     WHERE location_name = "Ruang Dosen M Informatika"),
    "EK0017",
    "Kabel",
    (SELECT SUM(total)
     FROM tb_product
     WHERE product_name = "LCD Projector");
``

`
This command adds a new product "Kabel" in "Ruang Dosen M Informatika" with the quantity equal to the total number of "LCD Projectors".

```sql
-- 7. Updating item quantities based on the quantity of another item
UPDATE tb_product 
SET total = 
    (SELECT total
     FROM tb_product
     WHERE product_name = "Meja Komputer" AND
           location_code = (SELECT location_code
                            FROM tb_location
                            WHERE location_name = "Laboratorium 1 M Informatika")) 
WHERE product_name = "Komputer" AND location_code = "INF001";
```
This command updates the quantity of "Komputer" in "Laboratorium 1 M Informatika" based on the number of "Meja Komputer" in the same location.

## Usage

To use these scripts, execute the `insertData.sql` script in your MySQL environment to set up the database structure and populate it with data. Then, you can run commands from `queries.sql` to practice various data manipulations and queries using subqueries.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.
