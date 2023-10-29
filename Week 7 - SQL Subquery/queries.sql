-- 1. Show the items code, items name, and its quantity where the location in "Laboratorium 2 M Informatika"
SELECT product_code AS Code, product_name AS Name, total AS Quantity
FROM tb_product
WHERE location_code = ANY 
    (SELECT location_code
FROM tb_location
WHERE location_name = "Laboratorium 2 M Informatika");

-- 2. Show the items code, the name of items which type is "Alat-alat elektronik" and all the items in the "Ruang Dosen M Informatika"
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

-- 3. Show the item code, item name and the number of items which type is "Alat-alat elektronik" and "Meubeler" located in the "Laboratorium 2 M Informatika"
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

-- 4. Show all information on items except the items which type is "Meubeler" located in the "Laboratorium 2 M Informatika"
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

-- 5. Add an item with the name is "Spidol" and item code "AP005" and the other information similar to "Papan Tulis" but the amount of item is 2 times the amount of "Papan Tulis"
INSERT INTO tb_product
SELECT
    tb_product.type_code,
    tb_product.location_code,
    "AP005",
    "Spidol",
    total*2 AS total
FROM tb_product
WHERE product_name = "Papan Tulis";

-- 6. Add an item with the name is "Kabel" which will be placed in the "Ruang Dosen M Informatika" with item code "EK0017", type 'E001', and the amount is similar to the amount of all "LCD projectors"
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

-- 7. Change the amount of "Komputer" in the "Laboratorium 1 M Informatika" according to the number of "Meja Komputer" in that room
UPDATE tb_product 
SET total = 
    (SELECT total
FROM tb_product
WHERE product_name = "Meja Komputer" AND
    location_code = (SELECT location_code
    FROM tb_location
    WHERE location_name = "Laboratorium 1 M Informatika")) 
WHERE product_name = "Komputer" AND location_code = "INF001";
