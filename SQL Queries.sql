select * from employees;                                                        --SELECT
select DISTINCT department_id from employees;                                   --DISTINCT
select * from employees where salary = 9000;                                    --WHERE
select * from employees where manager_id = 100 and department_id = 90;          --AND
select * from employees where manager_id = 100 or department_id = 90;           --OR
select * from employees where not manager_id = 100;                             --NOT
select * from employees order by salary desc;                                   --ORDER BY    
select commission_pct from employees where commission_pct is null;              --NULL
select commission_pct from employees where commission_pct is not null;          --NOT NULL     
--select salary from employees where not salary = 9000;                         --SINGLE LINE COMMENT
/*select * from employees where (manager_id = 100 and department_id = 90)
and manager_id = 100 or department_id = 90;
select salary from employees where salary is null;*/                            --MULTI LINE COMMENT 

-------------------------------------------------------------------------------------------------------------
insert into employees VALUES ('210','Dolly','Padam','DPADAM','981.254.2989',    --INSERT
'14-06-20','PR_REP','7500','','201','40');                                      
update employees set salary = 8000 where employee_id = 210;                     --UPDATE
delete from employees where first_name = 'Dolly';                               --DELETE
select COUNT(*) department_id from employees;                                   --COUNT (AGGREGATE FUNCTIONS)
select MAX(department_id) from employees;                                       --MAX (AF)
select MIN(department_id) from employees;                                       --MIN (AF)
select SUM(salary) as "TOTAL SALARY" from employees;                            --SUM (AF)
select AVG(salary) from employees;                                              --AVG (AF)
select salary from employees where salary in (24000,17000,8000,9000);           --IN 
select salary from employees where salary between 1000 and 5000;                --BETWEEN
select salary from employees where salary not between 1000 and 5000;            --NOT BETWEEN
select first_name as "FNMAE" from employees;                                    --ALIASE

select employee_id, first_name, last_name from employees where first_name like 'M%';    --start with M
select employee_id, first_name, last_name from employees where first_name like '%d';    --end with d
select employee_id, first_name, last_name from employees where first_name like '%m%';   --in between position m
select employee_id, first_name, last_name from employees where first_name like '_a%';   -- a in second position
select employee_id, first_name, last_name from employees where last_name like 'P%m';    --start with P and ends with m

----------------------------------------------------------------------------------------------------------------------------------
select region_id from countries union select region_id from regions;            ---UNION (Only unique values)
select region_id from countries union all select region_id from regions;        ---UNION ALL (All values)
select country_id, city, count(*) as "TOTAL" from locations group by country_id,---GROUP BY (Always with AGG. FUNC.)
city order by count(country_id) desc;                                           ---(Using order by)
select country_id, location_id, city, count(*) as TCI from locations group by   ---HAVING)
country_id, location_id, city having location_id > 2000; 
--select street_address from locations where exists (select region_id from countries = select region_id from regions);
select * from locations;
select * from departments;

----------------------------------------------------------------------------------------------------------------------------------
select * from employees;
select * from departments;
select * from job_history;
select department_id from employees UNION select department_id from departments;  --- Union Operator
select department_id, count (*) as "EMPID" from employees group by department_id;  --- Count Func
select department_id, sum(salary) as "TOTAL SALARY" from employees group by department_id;  --- Sum Func
select department_id, avg(salary) as "AVERAGE SALARY" from employees group by department_id;  --- Average Func
select first_name, department_id, min(salary) as "MINSAL" from employees group by department_id, first_name;
SELECT * FROM employees FETCH FIRST 2 ROWS ONLY;
/*select employees.department_id, employees.first_name, count(*) as "departments.department" from employees left join
departments on employees.department_id = departments.department_id group by employees_department_id;*/ 
select max (salary), manager_id from employees group by manager_id;
select employee_id, sum(salary) as total from employees group by employee_id order by employee_id asc;

---------------------------------------------------------------------------------------------------------------------
select employees.employee_id, employees.first_name, employees.salary,
departments.department_name, departments.location_id, job_history.job_id
from employees inner join departments on employees.department_id = departments.department_id
inner join job_history on departments.department_id = job_history.department_id;                 --- Multiple Inner Join

select employees.employee_id, employees.first_name, employees.salary,
departments.department_name, departments.location_id
from employees left join departments on employees.department_id = departments.department_id;     --- Left Join

select employees.employee_id, employees.first_name, employees.salary,
departments.department_name, departments.location_id
from employees right join departments on employees.department_id = departments.department_id;  --- Right Join

select employees.employee_id, employees.first_name, employees.salary,
departments.department_name, departments.location_id
from employees full outer join departments on employees.department_id = departments.department_id;  --- Full Join
