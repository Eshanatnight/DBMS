-- Create a Table called Student
CREATE TABLE Student (
    RollNo number(6) Primary Key,
    Name varchar2(25) not null,
    Address varchar2(50) not null,
    PhoneNo number(10),
    YearOfAdm number(4) not null,
    DeptCode varchar2(4) not null,
    Semester varchar2(4) not null,
    BirthDate date not null
    );

-- Display the Structure of the Table
DESC Student;

-- Instert Values into the table
INSERT INTO Student VALUES (1001, 'Ankit Das',        'VIP Road, Kolkata',   9830675221, 2017, 'CSE', 'SEM5', '10-FEB-1999');
INSERT INTO Student VALUES (1002, 'Moinak Ghosh',     'MG Road, Kolkata',    7988822201, 2015, 'CSE', 'SEM5', '01-MAY-1998');
INSERT INTO Student VALUES (1003, 'Parimal Kumar',    'NSB Road, Birati',    8099922211, 2016, 'CSE', 'SEM5', '17-MAR-2001');
INSERT INTO Student VALUES (2001, 'Sanchita Singh',   'Tegharia, Kolkata',   9999110011, 2017, 'ECE', 'SEM5', '05-NOV-2001');
INSERT INTO Student VALUES (2002, 'Ananya Biswas',    'MG Road, Howrah',     7667880010, 2017, 'ECE', 'SEM5', '17-SEP-2001');
INSERT INTO Student VALUES (2101, 'Ashish Kumar',     'Baguihati, Kolkata',  6544332121, 2018, 'ECE', 'SEM5', '17-SEP-2001');
INSERT INTO Student VALUES (1029, 'Naitik Prasad',    'KGR Path, Belgharia', NULL ,      2018, 'CSE', 'SEM3', '08-OCT-2003');
INSERT INTO Student VALUES (4011, 'Satnam Jyoti',     'Garia, Kolkata',      8933322125, 2018, 'IT',  'SEM3', '21-SEP-2003');
INSERT INTO Student VALUES (3002, 'Saurav Roy',       'Chandannagar',        NULL,       2017, 'EE',  'SEM5', '23-AUG-2000');
INSERT INTO Student VALUES (3005, 'Mohammad Azib',    'Saltlake',            7910000666, 2017, 'EE',  'SEM5', '20-JUN-1999');
INSERT INTO Student VALUES (2004, 'Nikhil Singh',     'Central Howrah',      NULL,       2016, 'ECE', 'SEM5', '21-JUL-1999');
INSERT INTO Student VALUES (1023, 'Samprikta Biswas', 'Barrackpore',         8877565643, 2018, 'CSE', 'SEM3', '13-DEC-2003');
INSERT INTO Student VALUES (1011, 'Rahul Khan',       'Jadavpur, Kolkata',   NULL,       2017, 'CSE', 'SEM5', '07-JUL-2001');
INSERT INTO Student VALUES (1060, 'Shubham',          'Sealdah, Kolkata',    9833221098, 2017, 'CSE', 'SEM3', '09-AUG-2003');
INSERT INTO Student VALUES (2009, 'Gaurav Prakash',   'Saltlake',            NULL,       2018, 'ECE', 'SEM3', '10-APR-2004');
INSERT INTO Student VALUES (3008, 'Rahul Joshi',      'AB Block, Saltlake',  9980765123, 2018, 'EE',  'SEM3', '20-JUL-2003');
INSERT INTO Student VALUES (4200, 'Mrigendra',        'Belur, Howrah',       NULL,       2019, 'IT',  'SEM1', '01-AUG-2004');
INSERT INTO Student VALUES (1500, 'Subarna Mitra',    'Gariahat, Kolkata',   9876654322, 2017, 'CSE', 'SEM3', '02-JAN-2003');
INSERT INTO Student VALUES (1101, 'Amrita Dev',       'CG Block, Saltlake',  NULL,       2019, 'CSE', 'SEM1', '06-JAN-2004');

-- Print the table
SELECT * FROM STUDENT;