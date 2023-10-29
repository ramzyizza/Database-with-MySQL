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


