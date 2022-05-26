# 1. Write a PL/SQL program which will take a student name
# from user then show roll number(may be more than one). Take care about non existence.
declare
    sn varchar(100) := '&Student_Name';
    cursor c2 is select rollno from student where name =sn;
    rn number;
    qn varchar2(100);
    cnt number := 0;
BEGIN
    Open c2;
    loop
        fetch c2 into rn;
        if c2%found then
            cnt := cnt+1;
        elsif (cnt=0) then
            dbms_output.put_line(' Not found ');
        end if;
        dbms_output.put_line(rn);
    end loop;
end;

# 2. Create and populate the table STUD(roll,secondary,hs,year_1st, year_2nd, year_3rd ).
# Write a PL/SQL program which will consider STUD table and insert roll no in
# another table STUD_STATUS(roll,status). If a student have 70% throughout have status Allowed,
# Otherwise if B.tech average percentage is more than 80 and  avg of secondary and hs is more than 60
# is Allowed otherwise Not Allowed.

/* Create Table STUD */
Create table STUD (
    roll number,
    secondary number,
    hs number,
    year_1st number,
    year_2nd number,
    year_3rd number
    );

/* Create Table STUD_STATUS  */
Create table STUD_STATUS (
    roll number,
    status varchar2(50)
    );

/* Populate Table STUD */
Insert into STUD Values ( 9001, 94, 87, 76, 92 , 95 );
Insert into STUD Values ( 9002, 67, 35, 71, 78 , 65 );
Insert into STUD Values ( 9003, 59, 46, 62, 58 , 67 );
Insert into STUD Values ( 9004, 62, 59, 77, 86 , 82 );

/* See data of STUD Table */
Select * from STUD;

/* Query to populate Table STUD_STATUS */
DECLARE
    rn stud.roll%type;
    sec stud.secondary%type;
    hsn stud.hs%type;
    yr_1 stud.year_1st%type;
    yr_2 stud.year_2nd%type;
    yr_3 stud.year_3rd%type;
    cdn1 number;
    cdn2 number;
    st varchar2(50);
    cursor c3 is select roll, secondary, hs, year_1st, year_2nd, year_3rd from STUD;
BEGIN
    Open c3;
    loop
        fetch c3 into rn, sec, hsn, yr_1, yr_2, yr_3;
        exit when c3%notfound;
        cdn1 := ( ( sec + hsn )/2 );
        cdn2 := ( ( yr_1 + yr_2 + yr_3 )/3 );

        if sec>=70 and hsn>=70 and yr_1>=70 and yr_2>=70 and yr_3>=70 then
            Insert into STUD_STATUS ( ROLL, Status) values ( rn , 'Allowed' );
            dbms_output.put_line(' Data Added - Allowed Rule 1 ');

        elsif cdn1>=60 and cdn2>=80 then
            Insert into STUD_STATUS ( ROLL, Status) values ( rn , 'Allowed' );
            dbms_output.put_line(' Data Added - Allowed Rule 2 ');
        else
            Insert into STUD_STATUS values ( rn , 'Not Allowed' );
            dbms_output.put_line(' Data Added - Not Allowed ');
        end if;
    end loop;
    close c3;
    COMMIT;
END;

/* See data of STUD_STATUS Table */
SELECT * FROM stud_status;
