--i) Display the students name, address, phone who got more than 150 in CS301 and CS302 in order of department code, followed by semester.
select name, address, phoneno from student
where rollno in (
Select rollno from marks
where sub_code in ('CS301','CS302')
group by rollno having sum(marksobtained) > 150
) order by deptcode,semester;

--ii) Show name, deptcode, phone number of the students who failed to obtain pass marks in any subject.
select name, deptcode, phoneno from student
where rollno in (
select rollno from marks m join subject s on m.sub_code=s.subjectcode
where marksobtained<passmarks
);

--iii) Find the students name and roll number who either got more than 80 in any subject or got more than 70 in average.
select name, rollno from student
where rollno in (
    select rollno from marks
    group by rollno having avg(marksobtained)>70)
    or rollno in (
        select rollno from marks
        where marksobtained>80);

--iv)  Find the students name and roll number who got more than 75 in average but not get less than 70 in any subject.
select name, rollno from student
where rollno in (
    select rollno from marks
    where rollno not in (
        select rollno from marks where marksobtained<70
        )
group by rollno having avg(marksobtained)>75);

--v)  Display first N marks from result table. N is given.
-- N = 5
select marksobtained from (
    select marksobtained from marks
    order by marksobtained desc
    )
where rownum<=5;

--vi) Find the students name who appeared in exactly same subjects as 'Ankit Das'.
select name from student
where rollno in (
    select rollno from marks
    where sub_code in(
        select sub_code from marks join student using (rollno)
        where name='ANKIT DAS')
);


