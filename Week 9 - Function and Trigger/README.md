# SQL Functions and Triggers: Advanced Database Operations

This repository demonstrates the use of SQL functions and triggers to automate database operations and maintain data integrity. These advanced features perform tasks such as calculating discounts based on purchase quantity and tracking changes to database records.

## Structure

The SQL script is contained in the following sections:

1. Function to calculate wholesale discounts.
2. Trigger for recording product change history.

## 1. Wholesale Discount Function

This function calculates the wholesale price of items based on the quantity purchased, applying various discount rates.

### Creating the Function

```sql
DELIMITER //

-- Create a new function named 'wholesaleDiscount'
CREATE FUNCTION wholesaleDiscount(totalItem INT, itemPrice INT) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE priceEachDiscounted FLOAT;
    -- Apply a 5% discount if the total number of items is between 10 and 50
    IF totalItem >= 10 AND totalItem < 50 THEN
        SET priceEachDiscounted = itemPrice * 0.95;
    -- Apply a 10% discount if the total number of items is between 50 and 100
    ELSEIF totalItem >= 50 AND totalItem < 100 THEN
        SET priceEachDiscounted = itemPrice * 0.90;
    -- Apply a 25% discount if the total number of items is greater than 100
    ELSEIF totalItem >= 100 THEN
        SET priceEachDiscounted = itemPrice * 0.75;
    END IF;
    
    RETURN(priceEachDiscounted);
END //

DELIMITER ;
```

The `wholesaleDiscount` function takes in the number of items purchased (`totalItem`) and the original price per item (`itemPrice`). It then applies a discount based on the quantity, with higher discounts for larger quantities.

## 2. Product Change History Trigger

This section involves creating a trigger that automatically records any changes made to the products' details, ensuring that a history of modifications is maintained.

### Creating the History Table

```sql
-- Create a new table named 'historyofproduct'
CREATE TABLE historyofproduct (
    id INT AUTO_INCREMENT PRIMARY KEY,             
    productCode VARCHAR(100) NOT NULL,             
    productName VARCHAR(100) NOT NULL,             
    productLine VARCHAR(100) NOT NULL,             
    productScale VARCHAR(100) NOT NULL,            
    productVendor VARCHAR(100) NOT NULL,           
    productDescription TEXT NOT NULL,              
    quantityInStock SMALLINT NOT NULL,             
    buyPrice DECIMAL(10, 4) NOT NULL,              
    MSRP DECIMAL(10, 4) NOT NULL,                
    changes DATETIME DEFAULT NULL,                
    action VARCHAR(100) DEFAULT NULL               
);
```

The `historyofproduct` table is designed to store historical data of product changes. It includes details about the product and the nature of the change.

### Creating the Trigger

```sql
DELIMITER $$
-- Create a new trigger named 'history'
CREATE TRIGGER history
BEFORE UPDATE ON products                       
FOR EACH ROW
BEGIN
    -- Insert the old product details into the 'historyofproduct' table before they are updated
    INSERT INTO historyofproduct
    SET action = 'update',
        productCode = OLD.productCode,
        productName = OLD.productName,
        productLine = OLD.productLine,
        productScale = OLD.productScale,
        productVendor = OLD.productVendor,
        productDescription = OLD.productDescription,
        quantityInStock = OLD.quantityInStock,
        buyPrice = OLD.buyPrice,
        MSRP = OLD.MSRP,
        changes = NOW();
END $$

DELIMITER ;
```

The `history` trigger is activated before any update operation on the `products` table. It takes the old product records and inserts them into the `historyofproduct` table, recording what was changed and when.

## Usage

To use these functions and triggers, execute the SQL commands in your MySQL environment. Once created, they will automatically work based on the operations performed on the relevant tables.

Example of calling a function:

```sql
SELECT wholesaleDiscount(20, 100) AS 'DiscountedPrice';
```

This command will invoke the `wholesaleDiscount` function to calculate the discounted price for 20 items with an original price of 100 each.

## Contributions

Contributions to this project are welcome. You can contribute by submitting pull requests or opening issues for any bugs or suggestions.

