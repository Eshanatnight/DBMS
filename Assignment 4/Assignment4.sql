-- Find Name of the Subject For Students of CSE 5th Semester
SELECT SubjectName FROM Subject WHERE Semester='SEM5';

-- Find the Roll Numbers who got marks between 61 and 70 in CS501
SELECT RollNo FROM Results WHERE Sub_Code='CS501' AND Marks BETWEEN 61 AND 70;

-- Change the address of the student whose roll number is given
UPDATE Student SET Address='New Address' WHERE RollNo='2001';

-- Increase the total number of student allocation of IT to 75
UPDATE Department SET StudentAlloted=75 WHERE DeptCode='IT';

-- Increase the total number of student allocation of CSE by 15
UPDATE Department SET StudentAlloted=StudentAlloted+15 WHERE DeptCode='CSE';

-- Increase the marks of all students of subject CS302 by 5
UPDATE Results SET Marks=Marks+5 WHERE Sub_Code='CS302';

-- Add a default phone number to all CSE 5th semester students who do not have phone number
UPDATE Student SET PhoneNo='1234567890' WHERE PhoneNo IS NULL AND Semester='SEM5';

-- Display the rows from RESULT where a student failed to obtain pass marks
SELECT * FROM Results WHERE Marks<PassMarks;

-- Add 2 marks to the students who failed for maximum 2 marks to any the subjects with CS code
UPDATE Results SET Marks=Marks+2 WHERE (PassMarks-Marks) <= 2 AND Sub_Code LIKE 'CS%';

-- Delete the student with given roll number from student table. (added a row and then deleted)
-- Hopefully this is the Correct format Fingers Crossed
INSERT INTO Student VALUES (2003, 'Sachin', 'Mumbai', '1234567890', 2019, 'CSE', 'SEM5', '10-FEB-1999');
DELETE FROM Student WHERE RollNo=2003;

-- Display the Students Name, DeptCode, Semaster who admitted before 2017 in alphabetical order of name
-- The ASC Keyword is used to sort in ascending order
SELECT Name, DeptCode, Semester FROM Student WHERE YearOfAdm<2017 ORDER BY Name ASC;

-- Display the roll number, subject code who got more than 90 in either CS301 or CS302
SELECT RollNo, Sub_Code FROM Results WHERE (Sub_Code='CS301' AND Marks>90) OR (Sub_Code='CS302' AND Marks>90);

-- Insert two students in students table
INSERT INTO Student VALUES (2003, 'Sachin', 'Mumbai', '1234567890', 2019, 'CSE', 'SEM5', '10-FEB-1999');
INSERT INTO Student VALUES (2005, 'Don', 'Mumbai', '1234564390', 2019, 'CSE', 'SEM5', '10-FEB-1999');

-- Delete phone number of a given student
-- No one can know Don's phone number
UPDATE Student SET PhoneNo=NULL WHERE RollNo=2004;

-- Display the roll number, subject code who got more than 40 from pass marks in either CS501 or CS502
SELECT RollNo, Sub_Code FROM Results WHERE (Sub_Code='CS501' AND Marks>40) OR (Sub_Code='CS502' AND Marks>40);

-- Display All the Tables and their Structures
DESC Student;
DESC Department;
DESC Subject;
DESC Results;

SELECT * FROM Student;
SELECT * FROM Department;
SELECT * FROM Subject;
SELECT * FROM Results;