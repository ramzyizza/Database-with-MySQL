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
