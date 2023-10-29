-- Student Table with attributes: student_name, gender, birth_place, birth_date, address, phone
CREATE TABLE IF NOT EXISTS student(
    NIM INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255),
    gender ENUM('M', 'F'),
    birth_place TINYTEXT,
    birth_date DATE,
    address TEXT,
    phone INT
) ENGINE=InnoDB;

--Lecturer Table with attributes: NIP, lecturer_name, gender, laboratory, interests, address, phone
CREATE TABLE IF NOT EXISTS lecturer(
    NIP INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    lecturer_name VARCHAR(255),
    gender ENUM('M', 'F'),
    laboratory VARCHAR(255),
    interests VARCHAR(255),
    address TEXT,
    phone INT,
) ENGINE=InnoDB;

--Subject table with attributes: course_code, course_name, NIP, credits, day, hour, classroom, description
CREATE TABLE IF NOT EXISTS subject(
    course_code INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255),
    NIP INT NOT NULL,
    credits INT,
    FOREIGNH KEY (NIP) REFERENCES lecturer(NIP),
    credits TINYINT,
    day DATE,
    hour TINYINT,
    classroom VARCHAR(255),
    description TEXT,
) ENGINE=InnoDB;

--Course selection (KRS) with attributes: KRS_id, course_code, NIM, student, data_year, semester
CREATE TABLE IF NOT EXISTS KRS(
    KRS_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_code INT,
    FOREIGN KEY (course_code) REFERENCES subject(course_code),
    NIM INT NOT NULL,
    FOREIGN KEY(NIM) REFERENCES student(NIM),
    data_year YEAR,
    semester TINYINT
) ENGINE=InnoDB;

