-- Create table for book
CREATE TABLE bookTable(
    bookID INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bookTitle VARCHAR(255) NOT NULL,
    authorName VARCHAR(255) NOT NULL,
    borrowedStatus VARCHAR(100) NOT NULL
);

-- Create table for flow
CREATE TABLE flowTable(
    flowID INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userIDBorrowing INT(100) NOT NULL,
    bookIDBorrowed INT(100) NOT NULL,
    borrowDate DATE,
    returnDate DATE
);

-- Create table for user
CREATE TABLE userTable(
    userID INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    numberOfBorrowing INT(50),
    numberOfReturning INT(50)
);

-- Alter the table to add foreign key
ALTER TABLE flowTable
ADD FOREIGN KEY (userIDBorrowing) REFERENCES userTable(userID)
ADD FOREIGN KEY (bookIDBorrowed) REFERENCES bookTable(bookID);

-- Altering the table to set the initial value of ID (AUTO_INCREMENT)
ALTER TABLE bookTable AUTO_INCREMENT = 111;
ALTER TABLE flowTable AUTO_INCREMENT = 222;
ALTER TABLE userTable AUTO_INCREMENT = 333;
