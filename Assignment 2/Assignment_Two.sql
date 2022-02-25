-- Recap the Deparmtment table
PRINT "Department Table Structure";
DESC Department;

-- Recap the Student Table
PRINT "Student Table Structure";
DESC Student;

-- By Recapping the tables we can remind ourselves of the Column Names and Their Types
-- Now we solve our Problem

-- Qi. Display Entire Department Information
PRINT "Department Information";
SELECT * FROM Department;

-- Qii. Display the department with allotted student number more than 100
PRINT "Departments with more than 100 students";
SELECT DeptName FROM Department WHERE StudentAlloted > 100;

-- Qiii. Display all students’ detail of CSE
-- Note: the space character before and after '=' might cause an error [Not Sure]
PRINT "Students of CSE Department";
SELECT * FROM Student WHERE DeptName = 'CSE';

-- Qiv. Display students name along with department code and semester who admitted in 2018.
-- Note: The Column Name of the table might not exactly be the same as the column name in the table
-- Note: alter the code if needed
PRINT "Students of CSE Department who admitted in 2018";
SELECT Name, DeptCode, Semester FROM Student WHERE Year = 2018;

-- Qv. Show the name and semester of the CSE students who do not have phone numbers
PRINT "Students of CSE Department who do not have Phone Numbers";
SELECT Name, Semester FROM Student WHERE DeptCode = 'CSE' AND PhoneNo IS NULL;
-- SELECT Name, Semester FROM Student WHERE DeptCode = 'CSE' AND PhoneNo = '';
-- Note: The = '' is a NULL value, but it might not br null in the Database
-- Note: So alternate syntax would be?

-- Qvi. Show name and phone numbers of students whose name starts with ‘R’
PRINT "Students whose name starts with R";
SELECT Name, PhoneNo FROM Student WHERE Name LIKE 'R%';

-- Qvii. Show name and phone numbers students with Surname ‘Kumar’.
-- Note: In the Like Clause, the space character after the '%'
-- Note: is for getting the Substring From the name
PRINT "Students with Surname Kumar";
SELECT Name, PhoneNo FROM Student WHERE Name LIKE '% Kumar';

-- Qviii. Show name, year of admission, deptcode of the student with second alphabet of name is ‘A’.
-- Note: The Pattern Matching is Means any Name that has the second alphabet as 'A'
PRINT "Students with Second Alphabet of their Name is A";
SELECT Name, YearOfAdm, DeptCode FROM Student WHERE Name LIKE '_A%';

-- Qix. Show student details of CSE resident of KOLKATA, who born before 2000
-- Note: the space character before and after '=' might cause an error [Not Sure]
PRINT "Students of CSE Department who are residents of KOLKATA and were born before 2000";
SELECT * FROM Student WHERE DeptCode = 'CSE' AND Address LIKE '%_Kolkata%' AND to_char(BirthDate, 'YYYY') < 2000;

-- Qx. Show student details of 2nd year who born in first day of a month.
-- Note: This is a tricky one. I think We need to use the DATEPART function
-- The DATEPART function returns a parsed value from a Date Data Type.
-- Takes two parameters: Identifier and Date, Depending on the Identidier,
-- the day, month, year or any combination of the same is returened.
-- Note: And also the space character before and after '=' might cause an error [Not Sure]
PRINT "Students of 2nd year who were born in first day of a month";
SELECT * From Student WHERE Semester = 'SEM3' and (DATEPART(dd, BirthDate) = 1);
SELECT * From Student WHERE Semester = 'SEM3' and to_char(BirthDate, 'DD') = 01;

-- Qxi. Display the students list of IT department who resides in ‘KOLKATA’ and admitted in 2017.
-- Note: And also the space character before and after '=' might cause an error [Not Sure]
PRINT "Students of IT Department who are residents of KOLKATA and admitted in 2017";
SELECT * FROM Student WHERE DeptCode = 'IT' AND Address LIKE '%Kolkata%' AND YearOfAdm = 2017;

-- Qxii. Show the phone no, year of admission and birth date of CSE students born in ‘JUNE’.
-- Note: DATEPART function is used to extract the month from the date.
-- Same issuse as Qx. There might be an easier way to do this?
-- Note: And also the space character before and after '=' might cause an error [Not Sure]
PRINT "Students of CSE Department who were born in JUNE";
SELECT PhoneNo, YearOfAdm, BirthDate FROM Student WHERE DeptCode = 'CSE' AND to_char(BirthDate, 'mm') = 06;
-- SELECT PhoneNo, YearOfAdm, BirthDate FROM Student WHERE DeptCode = 'CSE' AND (DATEPART(mm, BirthDate) = 6);

-- Qxiii. Display the list of ECE 3rd year students whose birthday is 20th October.
-- Note: Same Thing with DATEPART function there just might be an easier way to do this.
-- Note: And also the space character before and after '=' might cause an error [Not Sure]
PRINT "Students of ECE Department who were born on 20th of October";
-- SELECT * FROM Student WHERE DeptCode = 'ECE' AND ((DATEPART(dd, BirthDate) = 20) AND (DATEPART(mm, BirthDate) = 10));
SELECT * FROM Student WHERE DeptCode = 'ECE' AND to_char(BirthDate, 'DD') = 20 AND to_char(BirthDate, 'MM') = 10;

-- Qxiv. Show student details who born in either May, June, September or December.
PRINT "Students who were born in either May, June, September or December";
SELECT * FROM Student WHERE to_char(BirthDate, 'MM') = 05 OR to_char(BirthDate,'MM') = 6 OR to_char(BirthDate, 'MM') = 9 OR to_char(BirthDate, 'MM') = 12;
-- SELECT * FROM Student WHERE (DATEPART(mm, BirthDate) = 5) OR (DATEPART(mm, BirthDate) = 6) OR (DATEPART(mm, BirthDate) = 9) OR (DATEPART(mm, BirthDate) = 12);

-- Qxv. Display the students name, department, semester whose age is more than 20 year.
-- Note: We are using the DATEDIFF function to find the difference between two dates.
-- this function takes three arguments, an interval, a start date and an end date
-- And returns the difference between two dates in terms of the interval given as argument.
-- i.e. if interval is 'yyyy'/ year then the difference is in years.
/*
    -- Possible Intervals
        year, yyyy, yy = Year
        quarter, qq, q = Quarter
        month, mm, m = Month
        dayofyear = Day of the Year
        day, dy, y = Day
        week, ww, wk = Week
        weekday, dw, w = Weekday
        hour, hh = Hour
        minute, mi, n = Minute
        second, ss, s = Second
        millisecond, ms = Millisecond
*/
PRINT "Students whose age is more than 20 years";
SELECT Name, DeptCode, Semester FROM Student WHERE TO_NUMBER(TO_CHAR(SYSDATE(), 'yyyy')) - TO_NUMBER(TO_CHAR(BirthDate, 'yyyy')) > 20;
SELECT Name, DeptCode, Semester FROM Student WHERE to_char(BirthDate, 'YYYY') < 2000;
SELECT Name, DeptCode, Semester FROM Student WHERE to_char(BirthDate, 'YYYY') > 2000;
-- SELECT Name, DeptCode, Semester FROM Student WHERE (DATEDIFF(year, BirthDate, GETDATE()) > 20);