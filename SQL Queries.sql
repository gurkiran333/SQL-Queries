select * from jobs;

DECLARE
v_fname varchar(10);
v_sal number(8);
BEGIN
select FIRST_NAME, SALARY into v_fname, v_sal from employees where employee_id = &employee_id;
dbms_output.put_line(v_fname||' '||v_sal); 
END;

DECLARE
CURSOR c1 is select FIRST_NAME, SALARY from EMPLOYEES;  
v_fname employees.first_name%type;
v_sal employees.salary%type;
BEGIN
open c1;
LOOP
fetch c1 into v_fname, v_sal;
exit when c1%notfound;
dbms_output.put_line(v_fname||' '||v_sal);
end loop;
close c1;
end;

DECLARE
CURSOR c1 is select employee_id, job_id, department_id from employees;
v_empid employees.employee_id%type;
v_jobid employees.job_id%type;
v_deptid employees.department_id%type;
BEGIN
open c1;
loop
fetch c1 into v_empid, v_jobid, v_deptid;
exit when c1 %notfound;
dbms_output.put_line(v_empid||'  '||v_jobid||'  '||v_deptid);
end loop;
close c1;
END;

--------------------------------------------------------------------------

--DDL Statements-----

--CREATE TABLE

create table Padam (

REGID int,
NAME varchar(15) not null,
MOBILE int,
FLAT int,
TOWER char(3) default 'H',
CITY varchar(10)
);

TRUNCATE table padam;

select * from padam;
alter table padam modify tower default 'A';

insert into padam (REGID, NAME, mobile, flat, CITY) values ('231456', 'Gukki', '9811872932', '214', 'Delhi');
insert into padam (REGID, NAME, mobile, flat, CITY) values ('231466', 'Simran', '9815672932', '234', 'Mumabai');
insert into padam (REGID, NAME, mobile, flat, CITY) values ('231434', 'Harbans', '9811837332', '264', 'Pune');
insert into padam (REGID, NAME, mobile, flat, CITY) values ('231452', 'Dolly', '9811872222', '233', 'Delhi');
insert into padam (REGID, NAME, mobile, flat, tower, CITY) values ('231458', 'Gukki', '9811872932', '214', 'A', 'Delhi');
alter table padam modify tower char(3) default 'A'; 
insert into padam (REGID, NAME, mobile, flat, CITY) values ('341458', 'Sheena', '9811812342', '224', 'Delhi');
insert into padam (REGID, NAME, mobile, flat, CITY) values ('341458', 'Sheena', '9811812342', '643', 'Delhi');

alter table padam add Age int;
alter table padam drop column age;
alter table padam MODIFY flat not null;


create table GSP as select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES;
select * from gsp;
drop table felix;

alter table gsp add age number(6); 
alter table gsp drop column age; 

alter table students modify column gender varchar; 

select getdate();

//loops in java ?

-----------------------------------------------------------------------

select * from employees;
select distinct salary from EMPLOYEES;
select * from employees where salary = 17000;
select salary from employees order by salary desc;
select * from employees where salary = 17000 and DEPARTMENT_ID = 90; 
select * from employees where salary = 17000 or DEPARTMENT_ID = 90;
select * from employees where not salary = 17000;
select COMMISSION_PCT from EMPLOYEES where COMMISSION_PCT is not null;
select DEPARTMENT_ID from EMPLOYEES where DEPARTMENT_ID is null;
update EMPLOYEES set salary = null where EMPLOYEE_ID = 103; 
select salary from employees where EMPLOYEE_ID = 103;
select max(salary) from employees;
select min(salary) from employees;
select avg(salary) from employees;
select sum(salary) from employees;
select count(*) as TotalEmp from employees;
select EMPLOYEE_ID from EMPLOYEES where EMPLOYEE_ID in (100, 101, 102, 103, 104, 105);
select SALARY from EMPLOYEES where SALARY between 1000 and 10000;
select FIRST_NAME from EMPLOYEES where FIRST_NAME not like 'A%';
select FIRST_NAME from EMPLOYEES where FIRST_NAME like 'A%';
select FIRST_NAME from EMPLOYEES where FIRST_NAME like '%a';
select FIRST_NAME from EMPLOYEES where FIRST_NAME like '_a%';
select FIRST_NAME from EMPLOYEES where FIRST_NAME like '%h%';
select FIRST_NAME from EMPLOYEES where FIRST_NAME like 'G%n';
select DEPARTMENT_ID from DEPARTMENTS;
select DEPARTMENT_ID from EMPLOYEES;
---------JOINS-------------

select EMPLOYEES.FIRST_NAME, EMPLOYEES.SALARY, EMPLOYEES.EMAIL, DEPARTMENTS.DEPARTMENT_NAME
from EMPLOYEES INNER JOIN DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select EMPLOYEES.FIRST_NAME, EMPLOYEES.SALARY, EMPLOYEES.EMAIL, DEPARTMENTS.DEPARTMENT_NAME
from EMPLOYEES RIGHT JOIN DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select EMPLOYEES.FIRST_NAME, EMPLOYEES.SALARY, EMPLOYEES.EMAIL, DEPARTMENTS.DEPARTMENT_NAME
from EMPLOYEES LEFT JOIN DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

select EMPLOYEES.FIRST_NAME, EMPLOYEES.SALARY, EMPLOYEES.EMAIL, DEPARTMENTS.DEPARTMENT_NAME, LOCATIONS.CITY
from EMPLOYEES FULL OUTER JOIN DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID FULL OUTER JOIN
LOCATIONS on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

select DEPARTMENT_ID from DEPARTMENTS union select DEPARTMENT_ID from EMPLOYEES;
select DEPARTMENT_ID from DEPARTMENTS union all select DEPARTMENT_ID from EMPLOYEES;
select count(*) as "Total Employees", department_id from EMPLOYEES group by DEPARTMENT_ID;
select count(*) as "Total Employees", department_id from EMPLOYEES group by DEPARTMENT_ID
having DEPARTMENT_ID >= 80;
----Operators-----
select salary + 100 from employees where salary = 2800;
select salary - 200 from employees where salary = 2800; 
select salary / 2 from employees where salary = 2800; 
select (salary * 10) as "SALARY INCREMENT" from employees where salary = 2800; 
select salary from employees where salary = 2800; 
select salary from employees where salary > 2800;
select salary from employees where salary < 2800;
select salary from employees where salary >= 2800;
select salary from employees where salary <= 2800;
select salary from employees where salary <> 2800;
select salary from employees where salary += 2800;


