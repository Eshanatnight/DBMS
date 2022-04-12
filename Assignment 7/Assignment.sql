-- i. Display student names along with the department Name.
SELECT Name, DeptName FROM Student JOIN Department USING (DeptCode);

-- ii. Display student names, subject code and marks of students who took admission in the year 2017 and read subject CS502.
SELECT Name, Sub_Code, marks FROM Student JOIN Results USING (RollNo) WHERE YearOfADM=2017 AND Sub_Code='CS502';

-- iii. Find the Name of the students who got marks between 70 to 89 in CS501.
SELECT Name FROM Student JOIN Results USING (RollNo) WHERE marks BETWEEN 70 AND 89 AND Sub_Code='CS501';

-- iv. Find the student Name, roll no who appeared in the examination for paper DBMS.
SELECT St.Name, St.RollNo FROM Student St JOIN Results Re ON St.rollno = Re.rollno JOIN Subject Sb ON Sb.SubjectCode = Re.Sub_Code WHERE Sb.SubjectName = 'Data Base Systems';

-- v. Show student names, subject code and marks for CSE 3rd year students.
SELECT Name, Sub_Code, marks FROM Student S JOIN Results Re ON S.rollno = Re.rollno WHERE Semester IN ('SEM5','SEM6') AND DeptCode='CSE';

-- vi. Show student names, department Name for 5th semester students who born in MAY.
SELECT Name, DeptName FROM Student JOIN Department USING (DeptCode) WHERE Semester='SEM5' AND TO_CHAR(BIRTHDATE,'MON')='MAY';

-- vii. Show student names, subject Name for 5th semester student where subject Name contains the word ‘DATA’.
SELECT Name, subjectname FROM Student St JOIN Subject Sb USING (DeptCode) WHERE St.semester = 'SEM5' AND UPPER(SubjectName) LIKE '%DATA%';

-- viii. Show student names, subject Name and marks for 5th semester students.
SELECT Name, subjectname, marks FROM Student St JOIN Results Re USING (RollNo) JOIN Subject Sb ON Sb.SubjectCode = Re.Sub_Code WHERE Sb.semester = 'SEM5';

-- ix. Find the roll number, student names and marks for CSE students who get more than 80 in Data Structure.
SELECT RollNo, Name, marks FROM Student ST JOIN Results Re USING (RollNo) JOIN Subject SB ON SB.SubjectCode=Re.Sub_Code WHERE UPPER(SubjectName) ='DATA STRUCTURES' AND Re.marks > 80 AND ST.DeptCode='CSE';

-- x. Show student names, department Name, subject Name and subject wise marks for which the student get more than 90.
SELECT Name, DeptName, SubjectName, marks FROM Student ST JOIN Department D USING (DeptCode) JOIN Results Re USING (RollNo) JOIN Subject SB ON SB.SubjectCode=Re.Sub_Code WHERE marks > 90;

-- xi. Add column HOD in Department. Insert faculty id in place of HOD.
ALTER TABLE Department ADD HOD VARCHAR2(6);

UPDATE Department SET HOD='F01' WHERE DeptCode='CSE';
UPDATE Department SET HOD='F02' WHERE DeptCode='ECE';
UPDATE Department SET HOD='F03' WHERE DeptCode='IT';
UPDATE Department SET HOD='F04' WHERE DeptCode='EE';

-- xii. Add column Teacher in table Subject. Insert faculty id in this column.
ALTER TABLE Subject ADD Teacher VARCHAR2(6);

UPDATE Subject SET Teacher='F01' WHERE SubjectCode='CS301';
UPDATE Subject SET Teacher='F05' WHERE SubjectCode='CS302';
UPDATE Subject SET Teacher='F06' WHERE SubjectCode='CS501';
UPDATE Subject SET Teacher='F07' WHERE SubjectCode='CS502';
UPDATE Subject SET Teacher='F08' WHERE SubjectCode='ECS501';
UPDATE Subject SET Teacher='F02' WHERE SubjectCode='EC501';
UPDATE Subject SET Teacher='F09' WHERE SubjectCode='CS503';

-- xiii. Show the department Name, semester, subject Name along with faculty Name.
SELECT DeptName, Semester, SubjectName, Name FROM Department D JOIN Subject S USING (DeptCode) JOIN Faculty F ON F.FID = S.TEACHER;

-- xiv. Find the names of all faculties whose HOD Name is given.
SELECT Name FROM Faculty F RIGHT JOIN Department D ON F.FID=D.HOD;

-- xv. Display subject Name, subject code, marks including all subjects. [Outer join]
SELECT SubjectName, SubjectCode, Marks FROM Subject S FULL JOIN Results R ON S.SubjectCode=R.Sub_Code;

-- xvi. Display students Name, subject code, marks. Include all students. [Outer join]
SELECT Name, Sub_Code, Marks FROM Student S FULL JOIN Results R USING (ROLLNO);
