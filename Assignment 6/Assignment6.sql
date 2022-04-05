-- i. Display name, phone number of students with ‘a’ as the second letter in their names who read subject CS301.
SELECT name, phoneno FROM Student, Results WHERE Student.name LIKE '_a%' AND Results.sub_code='CS301' AND Student.rollno = Results.rollno;

-- ii. Display the marks for all available subjects for the students who born in JUNE.
SELECT sub_code, marks From Student, Results WHERE TO_CHAR(Student.birthdate, 'MON') = 'JUN' AND Student.rollno = Results.rollno;

-- iii. Show the student details of 5th semester Computer science and engineering Department.
SELECT * FROM Student WHERE DeptCode='CSE' AND Semester='SEM5';

-- iv. Show the subject details of 3rd semester Computer science and engineering Department.
SELECT * FROM Subject WHERE DeptCode='CSE' AND Semester='SEM3';

-- v. Display the department name for which some student get more than 90.
SELECT deptname FROM Department, Student, Results WHERE Student.rollno = Results.rollno AND Department.deptcode = Student.deptcode AND Results.marks > 90;

-- vi. Display the student name who reads in 5th semester and get more than 80 in any subject.
-- the result will have two instance of the same student so we can use DISTINCT
SELECT DISTINCT name FROM Student, Results WHERE Student.rollno = Results.rollno AND Student.semester = 'SEM5' AND Results.marks > 80;

-- vii. Display the name of CSE student who born in 2000 and get more than 80 in CS301.
SELECT name FROM Student, Results WHERE TO_CHAR(Student.birthdate, 'YYYY') = '2000' AND Student.rollno = Results.rollno AND Results.sub_code = 'CS301' AND Results.marks > 80;

-- viii. Display the department details with less than 80 students which has subject name Data Communication.
SELECT Department.* FROM Department, Subject WHERE Department.DeptCode = Subject.DeptCode AND Subject.SubjectName = 'Data Communication' AND Department.StudentsAlloted < 80;

-- ix. Display subject name, subject code of the department with allotted student less than 100.
SELECT Subject.SubjectName, Subject.SubjectCode FROM Subject, Department WHERE Subject.DeptCode = Department.DeptCode AND Department.StudentsAlloted < 100;

-- x. Show Roll number, subject code and marks for CSE 3rd year students where subject name starts with D.
-- ! not sure if this works or not
SELECT Results.RollNo, Subject.SubjectName, Results.Marks FROM Results, Subject WHERE Subject.SubjectCode = Results.Sub_Code AND Semester = 'SEM5' AND Subject.DeptCode = 'CSE' AND SubjectName LIKE 'D%';

-- xi. Display roll number, subject and marks of students who took admission in the year 2017 and read subject CS505.
SELECT Results.rollno, SubjectName, Results.marks FROM Results, Subject, Student WHERE Student.RollNo=Results.RollNo AND Subject.SubjectCode=Results.Sub_Code AND Student.YearofADM = 2017 AND Results.sub_code = 'CS501';

-- xii. Find the student details of CSE students whose marks are not available in result.
SELECT * FROM Student WHERE DeptCode = 'CSE' and RollNo NOT IN (SELECT RollNo FROM Results);

-- xiii. Find the subject name, subject code which is not included in result.
SELECT SubjectName, SubjectCode FROM Subject WHERE SubjectCode NOT IN (SELECT Sub_Code FROM Results);