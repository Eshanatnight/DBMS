-- Get the Description of the tables
DESC Student;
DESC Department;
DESC Subject;
DESC Results;

SELECT * FROM Student;
SELECT * FROM Department;
SELECT * FROM Subject;
SELECT * FROM Results;

-- i. Add constraint : DeptCode of Student is foreign key with reference to DeptCode in Department.
ALTER TABLE Student ADD CONSTRAINT fk_deptcode FOREIGN KEY(DeptCode) REFERENCES Department(DeptCode);

-- ii. Add an attribute Block to the department table (data type - Char)
ALTER TABLE Department ADD block char;

-- Check if the new block was added or not
DESC Department;

-- iii. Insert data to this attribute.
UPDATE Department SET block='C' WHERE DeptCode='CSE';
UPDATE Department SET block='C' WHERE DeptCode='IT';
UPDATE Department SET block='B' WHERE DeptCode='ECE';
UPDATE Department SET block='B' WHERE DeptCode='EE';

-- Check the Updates
SELECT * FROM Department;

-- iv. Increase the width of the column subject code of SUBJECT table to 8.
ALTER TABLE Subject MODIFY SubjectCode VARCHAR2(8);

-- v. Delete primary key of table of Subject.
ALTER TABLE Subject DROP PRIMARY KEY;

-- vi. Add primary key to the table subject.
ALTER TABLE Subject ADD PRIMARY KEY(SubjectCode);
-- ALTER TABLE Subject ADD CONSTRAINT sub_pk PRIMARY KEY(SubjectCode);

-- vii. Make Sub_code of Result table foreign key with respect to Subject code of SUBJECT table.
ALTER TABLE Results ADD CONSTRAINT res_pk_subcode FOREIGN KEY(Sub_Code) REFERENCES Subject(SubjectCode);

-- viii. Add constraint that marks cannot be negative.
ALTER TABLE Results ADD CONSTRAINT res_cannot_be_negative CHECK(Marks>=0);

-- ix. Alter the table SUBJECT and add check constraint such DeptCode is either CSE,IT, MCA, EE, ECE
ALTER TABLE Subject ADD CONSTRAINT dept_check CHECK(DeptCode IN ('CSE','IT','MCA','EE','ECE'));

-- x. Add column college phone number and add phone number 25739607 to each student.
ALTER TABLE Student ADD CollegePhoneNumber NUMBER(10) DEFAULT 25739607;

-- xi. Create a table FACULTY (FID VARCHAR2(4), Name VARCHAR2(20)); Faculty id should start with ‘F’.
CREATE TABLE Faculty(
    FID VARCHAR2(4),
    Name VARCHAR2(20),
    CONSTRAINT FID_START_WITH_F CHECK(FID LIKE 'F%')
);

-- Display the Structure of the table
DESC Faculty;

-- xii. Insert values to the table Faculty.
INSERT INTO Faculty VALUES('F01','Aloke Kumar Dutta');
INSERT INTO Faculty VALUES('F02','Abhijit Roy');
INSERT INTO Faculty VALUES('F03','Probal Kumar');
INSERT INTO Faculty VALUES('F04','Mousumi Dey');
INSERT INTO Faculty VALUES('F05','Sharmistha Nag');
INSERT INTO Faculty VALUES('F06','Dipty Bhattacharya');
INSERT INTO Faculty VALUES('F07','Sanjay Kumar Das');
INSERT INTO Faculty VALUES('F08','Partha Pratim Ba');
INSERT INTO Faculty VALUES('F09','Rakesh Chouhan');
INSERT INTO Faculty VALUES('F10','Srija Paul');

-- xiii. Insert column pass marks in subject table and add values to this column.
ALTER TABLE Subject ADD PASSMARKS NUMBER(3);

-- Update the pass marks of the subject.
UPDATE Subject
    SET PASSMARKS=40
WHERE SubjectCode in ('CS301', 'CS302', 'CS501', 'CS502', 'CS503', 'EC501');

-- Update rows in a Table
Update Subject
    SET PASSMARKS=30
WHERE SubjectCode = 'EC501';

-- Display the updated table.
SELECT * FROM Subject;

-- xiv. Delete the column pass marks from Result.
ALTER TABLE Results DROP COLUMN PassMarks;

-- Display the table.
SELECT * FROM Results;