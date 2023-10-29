# SQL Stored Procedures: Enhancing Database Functionality

This repository demonstrates the use of SQL stored procedures to encapsulate complex queries for routine database operations. These procedures perform tasks such as updating product prices, generating reports, and modifying customer credit limits based on specific input parameters.

## Structure

The SQL script is contained in the following file:

1. `queries.sql` - Contains the SQL commands for creating various stored procedures.

## queries.sql

This script sets up several stored procedures in our database. Below is the content of the script along with explanations for each procedure.

### Procedure 1: Increase Product Prices by Percentage

```sql
-- Procedure that increases the price of products in a specified category by a given percentage.
DELIMITER //
CREATE PROCEDURE increaseByPercent(
    IN percent FLOAT(50),
    IN productCategory VARCHAR(100)
)
BEGIN
    UPDATE products
    SET buyPrice = (buyPrice * percent)/100 + buyPrice
    WHERE productLine = productCategory;
END //
DELIMITER ;
```

This stored procedure, `increaseByPercent`, takes in a percentage and a product category. It increases the `buyPrice` of all products in the specified category by the given percentage.

### Procedure 2: Report Amount Ordered in a Specific Month and Year

```sql
-- Procedure that reports the amount ordered in a specific month and year for customers with a specified name.
DELIMITER //
CREATE PROCEDURE reportAmount(
    IN monthData INT(50),
    IN yearData INT(50),
    IN nameCustomer VARCHAR(100)
)
BEGIN
    SELECT amount, customerName, orderdate
    FROM customers
    INNER JOIN payments ON customers.customerNumber = payments.customerNumber
    INNER JOIN orders ON orders.customerNumber = payments.customerNumber
    WHERE 
        YEAR(orderDate) = yearData AND
        MONTH(orderDate) = monthData AND
        customerName = nameCustomer;
END //
DELIMITER ;
```

The `reportAmount` procedure generates a report for the total amount ordered by a specific customer in a particular month and year. It retrieves the `amount`, `customerName`, and `orderdate` from the database based on the input parameters.

### Procedure 3: Change Credit Limit by Country

```sql
-- Procedures that changes the credit limit of all customers in a specified country by a given percentage.
DELIMITER //
CREATE PROCEDURE changeCreditLimitByCountry(
    IN countryName VARCHAR(100),
    IN percent INT(50)
)
BEGIN
    UPDATE customers
    SET creditLimit = (creditLimit*percent)/100 + creditLimit
    WHERE country = countryName;
END //
DELIMITER ;
```

This procedure, `changeCreditLimitByCountry`, adjusts the credit limits for all customers in a specified country. It increases the `creditLimit` by a certain percentage based on the current credit limit of each customer in that country.

## Usage

To use these procedures, execute the `queries.sql` script in your MySQL environment to create the procedures. Once created, you can call these procedures with the necessary parameters to perform the database operations they were designed for.

Example of calling a procedure:

```sql
CALL increaseByPercent(10, 'Electronics');
```

This command will invoke the `increaseByPercent` procedure to increase the prices of all products in the 'Electronics' category by 10%.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.