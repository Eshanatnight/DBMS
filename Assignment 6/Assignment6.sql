-- i. Display name, phone number of students with ‘a’ as the second letter in their names who read subject CS301.
SELECT name, phoneno FROM Student WHERE Student.name LIKE '_a%' AND ROLLNO IN (SELECT ROLLNO FROM Results WHERE SUB_CODE = 'CS301');

-- ii. Display the marks for all available subjects for the students who born in JUNE.
SELECT marks From Results WHERE ROLLNO IN(SELECT ROLLNO FROM Student WHERE TO_CHAR(Student.birthdate,'MON')='JUN');

-- iii. Show the student details of 5th semester Computer science and engineering Department.
SELECT * FROM Student WHERE DeptCode IN (SELECT DEPTCODE FROM Department WHERE DEPTNAME='Computer Science and Engineering') AND Semester='SEM5' OR Semester='SEM6';

-- iv. Show the subject details of 3rd semester Computer science and engineering Department.
SELECT * FROM Subject WHERE DeptCode IN (SELECT DEPTCODE FROM Department WHERE DEPTNAME='Computer Science and Engineering') AND Semester='SEM5' OR Semester='SEM6';

-- v. Display the department name for which some student get more than 90.
SELECT deptname FROM Department WHERE DEPTCODE IN (SELECT DEPTCODE FROM STUDENT WHERE ROLLNO IN (SELECT ROLLNO FROM RESULTS WHERE Results.marks > 90));

-- vi. Display the student name who reads in 5th semester and get more than 80 in any subject.
-- the result will have two instance of the same student so we can use DISTINCT
SELECT DISTINCT name FROM Student WHERE Student.rollno IN ( SELECT ROLLNO froM Results WHERE Marks > 80) AND Student.semester = 'SEM5';

-- vii. Display the name of CSE student who born in 2000 and get more than 80 in CS301.
SELECT name FROM Student WHERE TO_CHAR(Student.birthdate, 'YYYY') = '2000' AND Student.rollno in (SELECT ROLLNO FROM Results where Results.sub_code = 'CS301' AND Results.marks > 80);

-- viii. Display the department details with less than 80 students which has subject name Data Communication.
SELECT Department.* FROM Department WHERE Department.DeptCode IN (SELECT DeptCode FROM Subject WHERE Subject.SubjectName = 'Data Communication') AND Department.StudentsAlloted < 80;

-- ix. Display subject name, subject code of the department with allotted student less than 100.
SELECT Subject.SubjectName, Subject.SubjectCode FROM Subject WHERE Subject.DeptCode IN (SELECT DEPTCODE FROM Department where Department.StudentsAlloted < 100);

-- x. Show Roll number, subject code and marks for CSE 3rd year students where subject name starts with D.
-- ! not sure if this works or not

-- SELECT Results.RollNo, Subject.SubjectName, Results.Marks FROM Results, Subject WHERE Subject.SubjectCode = Results.Sub_Code AND Semester = 'SEM5' AND Subject.DeptCode = 'CSE' AND SubjectName LIKE 'D%';

SELECT * FROM Results WHERE SUB_CODE IN (SELECT SUBJECTCODE FROM Subject WHERE Semester='SEM5' OR Semester='SEM6' AND SubjectName LIKE 'D%');

-- xi. Display roll number, subject and marks of students who took admission in the year 2017 and read subject CS505.
SELECT Results.rollno, Results.Sub_Code, Results.marks FROM Results WHERE Results.RollNo in (SELECT ROLLNO FROM Student where Student.YearofADM = 2017) AND Results.sub_code = 'CS501';

-- xii. Find the student details of CSE students whose marks are not available in result.
SELECT * FROM Student WHERE DeptCode = 'CSE' and RollNo NOT IN (SELECT RollNo FROM Results);

-- xiii. Find the subject name, subject code which is not included in result.
SELECT SubjectName, SubjectCode FROM Subject WHERE SubjectCode NOT IN (SELECT Sub_Code FROM Results);
