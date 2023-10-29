-- Show city address column without any duplicate
SELECT DISTINCT cityAddress FROM Student;

-- Show student name data from computer department
SELECT nameStudent from student WHERE department = 'Computer';

-- Show NIM, name, age, and address data sorted from the oldest student
SELECT NIM, nameStudent, cityAddress FROM student ORDER BY age DESC;

-- Show name and age of the 3 youngest student from jakarta
SELECT nameStudent, age FROM student WHERE cityAddress = 'Jakarta' ORDER BY age ASC LIMIT 3;

-- Show name and IPK student from jakarta with IPK under 2.5
SELECT nameStudent, IPK from student WHERE cityAddress = 'Jakarta' AND IPK < 2.5;

-- Show any student name from yogyakarta or have age older than 20
SELECT nameStudent FROM student WHERE cityAddress = 'Yogyakarta' OR age > 20;

-- Show any student name and address not from jakarta and surabaya
SELECT nameStudent, cityAddress FROM student WHERE cityAddress NOT IN ('Jakarta', 'Surabaya');

-- Show name, age, and IPK student with IPK from 2.5 to 3.5
SELECT nameStudent, age, IPK FROM student WHERE IPK BETWEEN 2.5 AND 3.5;

-- Show student name that have letter a in the name
SELECT nameStudent FROM student WHERE nameStudent LIKE '%a%';

-- Show studnet NIM with null data
SELECT NIM FROM student WHERE department IS NULL;