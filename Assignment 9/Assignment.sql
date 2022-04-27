-- i. Create view V_MARKS with roll no, student name, subject code, marks of all CSE students.
CREATE VIEW V_MARKS AS SELECT RollNo, Name, Sub_Code, Marks FROM Student JOIN Results USING(RollNo) WHERE DeptCode = 'CSE';

SELECT * FROM V_MARKS;

-- ii.Create view V_CLASSTAKEN with subject code, subject name, Faculty code, faculty name where the subject is taught by that faculty.
CREATE VIEW V_CLASSTAKEN AS SELECT SubjectCode, SubjectName, Faculty.FID, Faculty.Name FROM Subject JOIN Faculty ON Subject.Teacher = Faculty.FID;

SELECT * FROM V_CLASSTAKEN;

-- iii. Create view V_SUBJECT with subject_code, subject_name, teacher name where number of student in the subject is more than 1.
CREATE VIEW V_SUBJECT AS SELECT SubjectCode, SubjectName, Faculty.Name FROM Subject JOIN Faculty ON Subject.Teacher = Faculty.FID WHERE SubjectCode IN (SELECT Sub_Code FROM Results GROUP BY Sub_Code HAVING COUNT(RollNo) > 1);

SELECT * FROM V_SUBJECT;

-- iv. Create view V_STUDENT with student name, roll number, department who appeared in at least one examination.
CREATE VIEW V_STUDENT AS SELECT DISTINCT Name, RollNo, DeptCode FROM Student INNER JOIN Results USING(RollNo);

SELECT * FROM V_STUDENT;

-- v. Create view V_DEPT with dept code, semester, number of student with more than 75 marks in at least one subject.
CREATE VIEW V_DEPT AS SELECT DeptCode, Semester, COUNT(DISTINCT Marks) AS CountStudents FROM Subject JOIN Results ON Subject.SubjectCode = Results.Sub_Code WHERE Marks > 75 GROUP BY DeptCode, Semester;

SELECT * FROM V_DEPT;