-- Show city address column without any duplicate using GROUP BY
SELECT cityAddress FROM Student GROUP BY cityAddress;

-- Show the highest IPK (GPA) from the student table who came from Jakarta
SELECT MAX(IPK) 'Highest GPA', cityAddess 'City Address'
FROM student GROUP BY cityAddess HAVING cityAddess = 'Jakarta';

-- Show the lowest IPK (GPA) from the student table who came from Computer Department
SELECT MIN(IPK) 'Lowest GPA', department 'Department' 
FROM student GROUP BY department HAVING department = 'Computer';

-- Show number of students in Computer Department
SELECT COUNT(*) 'Total Student', department 'Department'
FROM student GROUP BY department HAVING department = 'Computer';

-- Show average IPK (GPA) from the math department student
SELECT AVG(IPK) 'Average GPA', department 'Department'
FROM student GROUP BY department HAVING department = 'Math';

-- Show data number of student on each department
SELECT COUNT(NIM) 'Total Student', department 'Department'
FROM student GROUP BY department HAVING department IS NOT NULL;
--We want to omit null value since there is no such department named NULL

-- Show data number of student from different city
SELECT COUNT(NIM) 'Total Student', cityAddress 'City Address'
FROM student GROUP BY cityAddress;

-- Show data number of student group by city address with age under 20 years
SELECT COUNT(*) 'Total Student', cityAddress 'City Address'
FROM student WHERE age < 20 GROUP BY cityAddress;