# Write a PL/SQL program for inverting a number. Take user input. (e.g.  5639 to 9365)
declare
    num number;
    rm number;
    rev number;
begin
    num:= &num;
    rm:= num;
    rev:= 0;
    while num>0
    loop
        rev:=(rev*10) + mod(num,10);
        num:=floor(num/10);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Reverse is: ' || rev);
end;

# Write a PL/SQL program to take Subject name from user and print faculty name
# who teach the subject also print the student name who got maximum marks in that subject.
declare
    sn varchar2(50) ;
    fa varchar2(100);
    st varchar2(100);
    nos number;

begin
    sn:= '&subject_name';
    select Count(s.name) into nos from student s
    join subject sub using (deptcode)
    join faculty f on f.fid=sub.teacher
    where (s.rollno, sub.subjectcode) in
        (select rollno,sub_code from Results
            where sub_code in
                (select subjectcode from subject where subjectname=sn)
            and Marks in (select max(Marks) from Results
            where sub_code in
            (select subjectcode from subject where subjectname=sn))
        );

    IF nos != 0 then
    select f.name into fa from student s join subject sub using (deptcode)
    join faculty f on f.fid=sub.teacher
    where (s.rollno, sub.subjectcode) in
        (select rollno,sub_code from Results
            where sub_code in (select subjectcode from subject where subjectname=sn)
        and Marks in (select max(Marks) from Results
        where sub_code in
        (select subjectcode from subject where subjectname=sn))
        );

    select s.name into st from student s join subject sub using (deptcode)
    join faculty f on f.fid=sub.teacher
    where (s.rollno, sub.subjectcode) in
        (select rollno,sub_code from Results
            where sub_code in (select subjectcode from subject where subjectname=sn)
        and Marks in
        (select max(Marks) from Results where sub_code in
            (select subjectcode from subject where subjectname=sn))
        );

    DBMS_OUTPUT.PUT_LINE('No. Faculty : ' || nos);
    DBMS_OUTPUT.PUT_LINE('Faculty name: ' || fa);
    DBMS_OUTPUT.PUT_LINE('Student name: ' || st);

    else
        dbms_output.put_line( sn || ' does not exist.');
    end if;
end;

# Write a PL/SQL program to take student name from user and print the
# department and age of the student. Give appropriate message for non existence of
#the student name and/or more than one student with same name.

declare
    sn varchar2(25) ;
    dn varchar2(100) ;
    age number;
    n number;
begin
    sn := '&student_name';
    select count(name) into n
    from student s join department d using (deptcode)
    where name=sn;

        if (n=1) then
            select name into sn
            from student s join department d using (deptcode)
            where name=sn;

            select deptname into dn
            from student s join department d using (deptcode)
            where name=sn;

            select floor(months_between(trunc(sysdate),birthdate)/12) into age
            from student s join department d using (deptcode)
            where name=sn;

            dbms_output.put_line('Name of Department '|| dn );
            dbms_output.put_line('Age '|| age );

        elsif (n>1) then
            dbms_output.put_line('More than one '|| sn ||' .');

        elsif (n<1) then
            dbms_output.put_line('No '|| sn );
        end if;
end;