--Create Database for University
CREATE DATABASE IF NOT EXIST university;

--CREATE table with attributes
USE university;

CREATE TABLE IF NOT EXIST student(
    id INT NOT NULL,
    NIM INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nameStudent VARCHAR(255) NOT NULL,
    cityAddress VARCHAR(100),
    age INT(25),
    GPA DECIMAL(2,1) NOT NULL,
    DEPARTMENT VARCHAR(100) NULL
) AUTO_INCREMENT = 12345, ENGINE=InnoDB;


--Insert data into the table
INSERT INTO student (id, nameStudent, cityAddress, age, IPK, department)
VALUES
(1, "Adi", "Jakarta", 17, 2.5, "Math"),
(2, "Ani", "Yogyakarta", 20, 2.1, "Math"),
(3, "Ari", "Surabaya", 18, 2.5, "Computer"),
(4, "Ali", "Banjarmasin", 20, 3.5, "Computer"),
(5, "Abi", "Medan", 17, 3.7, "Math"),
(6, "Budi", "Jakarta", 19, 3.8, "Computer"),
(7, "Boni", "Yogyakarta", 20, 3.2, "Computer"),
(8, "Bobi", "Surabaya", 17, 2.7, "Computer"),
(9, "Beni", "Banjarmasin", 18, 2.3, "Computer"),
(10, "Cepi", "Jakarta", 20, 2.2, NULL),
(11, "Coni", "Yogyakarta", 22, 2.6, NULL),
(12, "Ceki", "Surabaya", 21, 2.5, "Math"),
(13, "Dodi", "Jakarta", 20, 3.1, "Math"),
(14, "Didi", "Yogyakarta", 19, 3.2, "Physics"),
(15, "Deri", "Surabaya", 19, 3.3, "Physics"),
(16, "Eli", "Jakarta", 20, 2.9, "Physics"),
(17, "Endah", "Yogyakarta", 18, 2.8, "Physics"),
(18, "Feni", "Jakarta", 17, 2.7, NULL),
(19, "Farah", "Yogyakarta", 18, 3.5, NULL),
(20, "Fandi", "Surabaya", 19, 3.4, NULL);

