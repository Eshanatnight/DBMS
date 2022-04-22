-- i. FINd the number of Student IN CSE second year.
SELECT COUNT(RollNo) AS StudentInSecondYear FROM Student
WHERE DeptCode = 'CSE' AND Semester IN ('SEM3','SEM4');

-- ii. FINd the number of students whose Marks of any Subject is available.
SELECT COUNT(DISTINCT RollNo) AS COUNT FROM Results;

-- iii. FINd total number of faculty.
SELECT COUNT(DISTINCT FID) AS NoOfFaculty FROM Faculty;

-- iv. FINd the 5th Semester Student(s) who got MAXimum Marks IN a Subject.
SELECT Name FROM Student s JOIN Results r USING(RollNo)
WHERE Semester='SEM5' AND Marks
IN (SELECT MAX(Marks) AS Marks FROM Results
    GROUP BY Sub_Code);

-- v. FINd the roll number  of a Student who got MAXimum Marks IN CS501.
SELECT RollNo FROM Results
WHERE Sub_Code='CS501' AND Marks
IN (SELECT MAX(Marks) FROM Results
    GROUP BY Sub_Code);

-- vi. Display average Marks of CS502.
SELECT AVG(Marks) FROM Results
GROUP BY Sub_Code HAVING Sub_Code='CS502';

-- vii. FINd the number of students IN each Department with their Department code.
SELECT DeptCode, COUNT(RollNo) AS NoOfStudent
FROM Student GROUP BY DeptCode;

-- viii. FINd the number of students IN each Department with their Department Name.
SELECT DeptName, NoOfStudents
FROM (SELECT DeptCode, COUNT(RollNo) AS NoOfStudents FROM Student GROUP BY DeptCode)
JOIN Department USING(DeptCode);

-- ix.  FINd the Department with more than three faculty.
SELECT DeptCode FROM Subject GROUP BY DeptCode HAVING COUNT(Teacher) > 3;

-- x.  FINd the Student Name AND roll no who get more than 80 IN at leASt two Subject.
SELECT Name, RollNo FROM Student
WHERE RollNo IN
(SELECT RollNo FROM
    (SELECT * FROM Results WHERE Marks > 80)
GROUP BY RollNo HAVING COUNT(*) >= 2);

-- xi. FINd the Student Name AND roll no who get more than 70 IN average.
SELECT Name, RollNo FROM Student WHERE RollNo IN
(SELECT RollNo FROM Results GROUP BY RollNo HAVING AVG(Marks) > 70);

-- xii. Display number of Subject Semester wise IN dept CSE.
SELECT Semester, COUNT(SubjectCode) AS NoOfSubject FROM Subject
WHERE DeptCode='CSE'
GROUP BY Semester;

/*
I Dont know why this is bugging out? Seems Fine to me?
SELECT Semester, NoOfSubject FROM
(SELECT Semester, count(SubjectCode) AS NoOfSubject, DeptCode FROM
    Subject GROUP BY Semester)
WHERE DeptCode='CSE';
*/

-- xiii. FINd the Department Name with MAXimum number of Student.
SELECT DISTINCT DeptName FROM Department JOIN Student USING (DeptCode)
WHERE DeptCode =
    (SELECT DeptCode FROM Student GROUP BY DeptCode
    HAVING COUNT(RollNo) =
        (SELECT MAX(COUNT(RollNo)) FROM Student GROUP BY DeptCode)
    );

-- xiv. FINd the second highest Marks of the Results table.
SELECT MAX(Marks) FROM Results
WHERE Marks
NOT IN
    (SELECT MAX(Marks) FROM Results);

-- xv. FINd the students Name who got highest Marks, subjectwise.
SELECT Name, Marks, Sub_Code FROM Student JOIN Results USING (RollNo)
WHERE Marks IN (SELECT MAX(Marks) FROM Results GROUP BY Sub_Code);