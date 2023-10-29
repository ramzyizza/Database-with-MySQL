-- Insert data into the Customer table
INSERT INTO Customer(customerName, customerNumber)
VALUES
    ('C-003', 'Geneva Electronics', 'Bandung'),
    ('C-007', 'Gama Store', 'Yogyakarta'),
    ('C-009', 'Family Mart', 'Medan'),
    ('C-011', 'Star Store', 'Bandung');

-- Insert data into the Product table
INSERT INTO Product(productNumber, productName, stock)
VALUES 
    ('P-100', 'Monitor 17', 15),
    ('P-120', 'Keyboard Ps2', 20),
    ('P-123', 'Mouse Ps2', 15),
    ('P-123', 'Memory 512', 10);


-- Insert data into the Transaction table
INSERT INTO Transactions(transactionNumber, transactionDate, customerNumber)
VALUES
    ('T-001', '2019-10-19', 'C-011'),
    ('T-002', '2020-01-10', 'C-003'),
    ('T-003', '2020-08-07', 'C-009'),
    ('T-004', '2020-09-09', 'C-007');

-- Show the name of the city from the customer uniquely
SELECT DISTINCT city from Customer;

--Show all customer data
SELECT * from customer;

-- Show productName and Stock of all product data
SELECT productName, stock from Product;

-- Show the customerName who lives in the Bandung city
SELECT customerName from Customer WHERE city = 'Bandung';

-- Show the transactionDate from the customer who has customerNumber C-007
SELECT transactionDate from Transactions WHERE customerNumber = 'C-007';

-- Show all Product data has stock 15
SELECT * FROM Product WHERE stock = 15;

-- Change the transactionDate of customer who has customerNumber C-007 to today's date
UPDATE Transactions SET transactionDate = '2020-10-10' WHERE customerNumber = 'C-007';

-- Change customerName to HappyFamily Mart and city to Jakarta for customer who have customerNumber C-009
UPDATE Customer SET customerName = 'HappyFamily Mart', city = 'Jakarta' WHERE customerNumber = 'C-009';

-- Add the following product data using DEFAULT value
INSERT INTO Product(productNumber, productName, stock) VALUES ('P-130', 'NIC D-Link', DEFAULT);

-- Add the following transaction data using today's date in transactionDate
INSERT INTO Transactions(transactionNumber, transactionDate, customerNumber) 
VALUES 
    ('T-005', CURRENT_DATE, 'C-003'), 
    ('T-006', CURRENT_DATE, 'C-011');

-- Delete the first two transaction that sorted by treansactionNumber
DELETE FROM Transactions ORDER BY transactionNumber LIMIT 2;

-- Delete the last 2 transaction data sorted by transactionNumber
DELETE FROM Transactions ORDER BY transactionNumber DESC LIMIT 2;