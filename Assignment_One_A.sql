-- Create a Table called Department
CREATE TABLE Department (
    DeptCode varchar(4) Primary Key,
    DeptName varchar(15) not null,
    StudentsAlloted number(4) not null
    );

-- Display the Structure of the Table
DESC Department;

-- Drop the table if it exists
DROP TABLE Department;

-- Recreate the table if Dropped
CREATE TABLE Department (
    DeptCode varchar(4) Primary Key,
    DeptName varchar(50) not null,
    StudentsAlloted number(4) not null
    );

-- Insert Values into the table
INSERT INTO Department VALUES ('CSE', 'Computer Science and Engineering',          120);
INSERT INTO Department VALUES ('ECE', 'Electronics and Communication Engineering', 120);
INSERT INTO Department VALUES ('IT',  'Information Technology',                    60);
INSERT INTO Department VALUES ('EE',  'Electrical Engineering',                    60);

-- Print the table
SELECT * FROM Department;


-- Extra Command "ALTER"
-- Say that the DeptName is too long and we want to change it to a varchar(50)
ALTER TABLE Department MODIFY (DeptName varchar(50));

-- Extra Technique to insert multiple values at once in the Table
INSERT INTO Department
    VALUES
    ('CSE', 'Computer Science and Engineering', 120),
    ('ECE', 'Electronics and Communication Engineering', 120),
    ('IT', 'Information Technology', 60),
    ('EE', 'Electrical Engineering', 60);
-- Note that the column sequence is maintained. If you want to insert in a different order, then you would have to provide the column names in the INSERT statement.
