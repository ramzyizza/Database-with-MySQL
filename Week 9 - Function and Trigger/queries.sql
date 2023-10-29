-- This function provides a discount on the item price based on the quantity of items purchased. The more items you buy, the bigger the discount you receive.
DELIMITER //
-- Create a new function named 'wholesaleDiscount'
CREATE FUNCTION wholesaleDiscount(totalItem int, itemPrice int) RETURNS FLOAT DETERMINISTIC
BEGIN
    -- Declare a variable to store the discounted price
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

    -- Return the calculated discounted price
    RETURN(priceEachDiscounted);
END //


DELIMITER $$
-- Create a new trigger named 'history'
CREATE TRIGGER history
BEFORE UPDATE ON products                       
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
