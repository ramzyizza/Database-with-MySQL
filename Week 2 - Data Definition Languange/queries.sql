-- Show all existing tables in the database
SHOW TABLES;

-- Show the structure of each table in the database.
DESCRIBE student;
DESCRIBE lecturer;
DESCRIBE subject;
DESCRIBE KRS;

--Change the table name "lecturer" to "professor"
RENAME TABLE lecturer TO professor;

--Change the name of the attribute "lecturer_name" with "prof_name"
ALTER TABLE professor CHANGE lecturer_name prof_name VARCHAR(255); 

--Add a new column "mother_name" after birth_date attribute in the student table
ALTER TABLE student ADD COLUMN mother_name VARCHAR(255) AFTER birth_date;

--Change the data type "gender" in student table became enum with value "Male" and "Female"
ALTER TABLE student MODIFY COLUMN gender ENUM('Male', 'Female');

--Change the data type 'phone' in the student table into int
ALTER TABLE student MODIFY COLUMN phone INT;

--Remove the primary key in the "ID_KRS" attribute
ALTER TABLE KRS MODIFY COLUMNS KRS_id INT NOT NULL;
ALTER TABLE KRS DROP PRIMARY KEY;

--Re-add the primary key to the "ID_KRS" attribute
ALTER TABLE KRS MODIFY COLUMNS KRS_id INT AUTO_INCREMENT;
ALTER TABLE KRS ADD PRIMARY KEY (KRS_id);

--Delete attribute "description" in the subject table
ALTER TABLE subject DROP COLUMN description;