--i) Display the students name, address, phone who got more than 150 in CS301 and CS302 in order of department code, followed by semester.

select name, address, phoneno from student
where rollno in (
Select rollno from Results
where sub_code in ('CS301','CS302')
group by rollno having sum(Marks) > 150
) order by deptcode,semester;

--ii) Show name, deptcode, phone number of the students who failed to obtain pass marks in any subject.
select name, deptcode, phoneno from student
where rollno in (
select rollno from Results m join subject s on m.sub_code=s.subjectcode
where Marks<passmarks
);

--iii) Find the students name and roll number who either got more than 80 in any subject or got more than 70 in average.
select name, rollno from student
where rollno in (
    select rollno from Results
    group by rollno having avg(Marks)>70)
    or rollno in (
        select rollno from Results
        where Marks>80);

--iv)  Find the students name and roll number who got more than 75 in average but not get less than 70 in any subject.
select name, rollno from student
where rollno in (
    select rollno from Results
    where rollno not in (
        select rollno from Results where Marks<70
        )
group by rollno having avg(Marks)>75);

--v)  Display first N marks from result table. N is given.
-- N = 5
select Marks from (
    select Marks from Results
    order by Marks desc
    )
where rownum<=5;

--vi) Find the students name who appeared in exactly same subjects as 'Ankit Das'.
select name from Student
where rollno in (
    select rollno from Results
    where sub_code in(
        select sub_code from Results
        join student using (rollno)
        where name='Ankit Das')
);