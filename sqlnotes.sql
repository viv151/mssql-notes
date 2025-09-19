create database employeeDB

use employeeDB

create table employee_info
(
	empId INTEGER PRIMARY KEY,
	empName VARCHAR(50) NOT NULL,
	empSalary Decimal(10, 2) NOT NULL,
	job VARCHAR(50),
	phone VARCHAR(50),
	deptID INTEGER
)


insert into employee_info values
(01, 'ADAM', 250000, 'Jr. Dev', '9234976392', 10);

insert into employee_info(empId, empName, empSalary)
values(02, 'Smit', 38000)



select * from employee_info

select empName, empSalary from employee_info


update employee_info
set empSalary = empSalary + 1000

update employee_info
SET job = 'Tester'
WHERE empName = 'Smit'

update employee_info
SET phone = '1234567890', deptID = 20
WHERE empName = 'Smit'


select * from employee_info

delete from employee_info
where empId = 2
	 
delete from employee_info

insert into employee_info values
(03, 'ADAM', 550000, 'Sr. Dev', '1234976392', 10);

insert into employee_info(empId, empName, empSalary)
values(04, 'Roy', 48000)


update employee_info
SET job = 'Graphics'
WHERE empName = 'Roy'

update employee_info
SET phone = '7890123456', deptID = 30
WHERE empName = 'Roy'

select * from employee_info


select * from employee_info order by empSalary DESC

select empName from employee_info
order by empName desc


select empName, empSalary from employee_info
where deptID = 10

update employee_info
set empSalary = empSalary + 5000
where deptID= 20

delete from employee_info
where deptID = 30;

select avg(empSalary) from employee_info
	
select max(empSalary) from employee_info

select count(empName) from employee_info
select count(*) from employee_info

select * from employee_info

insert into employee_info(empId,empName,  empSalary)
values (5,'Rob', 15000)

select count(job) from employee_info

select abs(-10)

select ceiling(10.12)

select floor(10.12)

select sign(15)

select square(5), sqrt(81), PI(), cos(30), sin(90), tan(45)

select len('database')

select empName, len(empName) from employee_info

select upper('this is a statement')

select empName, lower(empName) from employee_info

select ltrim('    anystring'), rtrim('      anystring')

select substring('microsoft', 6, 9)

select replace('microsoft', 'micro', 'soft')

select replicate('dummy', 5)


create table tbl_user_login
(
	user_id INT PRIMARY KEY IDENTITY,
	username VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL

)

INSERT INTO tbl_user_login (username, email, password) VALUES
('ironman', 'tony@stark.com', 'tony123'),
('captain', 'steve@captain.com', 'steve123'),
('spidy', 'peter@parker.com', 'peter123'),
('wonder', 'wonder@woman.com', 'wonder123')

select * from tbl_user_login


select username from tbl_user_login
	where email = 'steve@captain.com' AND
	password= 'steve123'

select password from tbl_user_login
	where username = 'spidy' OR email = 'peter@peter.com'


select * from tbl_user_login
	where NOT username = 'wonder';

select * from tbl_user_login
	where  username != 'wonder';

-- Date & Time functions
-- 1. Getdate(), current_timestamp(works on ansi std), sysdatetime()
-- 2. datename(), find month or year of a particular date
-- 3. dateDiff()  - to calc age for example,timespan calc
-- 4. dateadd() - add some seconds, hour or days or years and then return date


select getdate() as TODAY_DATE;
select sysdatetime() as TODAY_DATE;
select current_timestamp as TODAY_DATE;

select datename(month, current_timestamp) as 'MONTH'
select datename(year, current_timestamp) as 'Year'
select datename(hour, current_timestamp) as 'Hour'

select datediff(year, 'February 26 2004', current_timestamp) as "age";
select datediff(month, 'February 26 2004', current_timestamp) as "ageInMonths";
select datediff(month, 'February 26 2004', 'December 31 2050') as "ageInMonths";

select dateadd(year, 100, current_timestamp) as "100yearsFromNow"
select dateadd(month, 10, current_timestamp) as "100monthsFromNow"

-- Lecture - 19. GROUP BY Clause

select deptID, sum(empSalary) as 'total salary' from employee_info group by deptID

select deptID, min(empSalary) as 'min salary' from employee_info 
group by deptID

select deptID, max(empSalary) as 'max salary' from employee_info 
group by deptID

select deptID, round(avg(empSalary), 2) as 'avg salary' from employee_info 
group by deptID


-- Lecture-20: HAVING Clause 
select * from employee_info

select deptID, sum(empSalary) from employee_info
group by deptID having deptID = 20

select deptID, sum(empSalary) from employee_info
group by deptID

select deptID, sum(empSalary) from employee_info
where deptID = 20 group by deptID

select deptID, sum(empSalary) from employee_info
group by deptID having sum(empSalary) > 80000


-- Lecture-21: TOP Clause

select * from employee_info

select empSalary from employee_info order by empSalary 

select top(3) empSalary from employee_info order by empSalary desc

select top(3) empSalary from employee_info order by empSalary 


--- Lecture-22: Copying data from one database to another

use employeeDB

create database sample_emp_db

--- copty data into new table from existing table

use sample_emp_db

select * into emp_details
from employeeDB.dbo.employee_info

select * from emp_details


--- Lecture - 23: ALTER STATEMENT (Part I - Add new columns in an existing table) 

use employeeDB

-- add without constraint

alter table employee_info
ADD age int

select * from  employee_info

-- add column with a constraint

alter table employee_info 
add project_completed int not null default 5

select * from  employee_info

-- add column with a constrainwt with a name


create table emp_details(
id int,
name varchar(10),
)

alter table emp_details add salary decimal

select * from emp_details

insert into emp_details values(1, 'Vivek', 45000)

alter table emp_details add phone varchar(10) null
select * from emp_details

alter table emp_details add project_completed int not null default 5

alter table emp_details
add projectId integer null 
constraint pID_unique_key unique

insert into emp_details 
values(2, 'simran', 50000,'923749324', 4, default)


create table company_info(id int)

alter table company_info
add revenue decimal(10,2) null,
projectId int 
constraint projId_pk PRIMARY KEY

select * from company_info


--Lecture - 24: ALTER STATEMENT (Part II - Drop column and constraint from table)

select * into company_info_backup from employeeDB.dbo.employee_info
select * into emp_detaills_backup from employeeDB.dbo.emp_details


select * from company_info_backup

alter table company_info_backup
drop column age

drop table company_info_backup

select * from emp_details


alter table emp_details
drop constraint pID_unique_key


alter table company_info
drop constraint projId_pk,
	column revenue, projectId


	select * from company_info


--Lecture - 25: ALTER STATEMENT (Part III - Altering an existing table)

use sample_emp_db

create table customer(acc_no int, cust_name char(100));

-- change datatype of cust_name column
alter table customer alter column cust_name varchar(10)

--change size of varchar from 10 to 50
alter table customer alter column cust_name varchar(50)

select * from customer

insert into customer values(123456, 'Vivek')

alter table customer alter column cust_name varchar(50)

--changing the dataype to char and size to 10

alter table customer alter column cust_name char(10)


-- Lecture - 26: Aliases 

use employeeDB

select * from employee_info

select empSalary from employee_info

select empSalary as 'Employee Salary' from employee_info

select empSalary as 'Employee Salary', 
empName as 'Name',
empId as 'Employee ID'
from employee_info

--- Lecture-27: Joins 

--- Lecture-28: Inner Joins 


create database company_db

use company_db

create table employee(
emp_id int,
emp_name varchar(50),
emp_salary int,
emp_deptid int
)

alter table employee
alter column emp_deptid varchar(50)

insert into employee
values(1111, 'STEVE', 35000, 'D1')

insert into employee
values(1112, 'ADAM', 328000, 'D2')

insert into employee
values(1113, 'JOHN', 50000, 'D3')

insert into employee
values(1114, 'MIKE', 45000, 'D2')

insert into employee
values(1115, 'PETER', 60000, 'D5')

select * from employee


create table department(
emp_deptid varchar(50),
dept_name varchar(50),
dept_location varchar(50)
)


insert into department
values('D1', 'DEVELOPMENT', 'CALIFORNIA')

insert into department
values('D2', 'MARKETING','MUMBAI')

insert into department
values('D3', 'ACCOUNTS', 'NEW YORK')

insert into department
values('D4', 'MANAGEMENT', 'SYDNEY')

update employee
set emp_salary = 32000
where emp_name = 'ADAM'

select * from employee
select * from department

select emp_id, emp_name, emp_salary, dept_name, dept_location
from employee inner join department 
on employee.emp_deptid = department.emp_deptid

select e.emp_id, e.emp_name, e.emp_salary, d.dept_name, d.dept_location
from employee e inner join department d
on e.emp_deptid = d.emp_deptid

--29. Left Outer Join

select * from employee
select * from department

select emp_id, emp_name, emp_salary, dept_name, dept_location
from employee left outer join department
on employee.emp_deptid = department.emp_deptid


--30. Right Outer Join

select * from employee
select * from department

select e.emp_id, e.emp_name, e.emp_salary, d.dept_name, d.dept_location
from employee e right outer join department d
on e.emp_deptid = d.emp_deptid


-- 31. Full Outer Join

select * from employee
select * from department

select e.emp_id, e.emp_name, e.emp_salary, d.dept_name, d.dept_location
from employee e full outer join department d
on e.emp_deptid = d.emp_deptid

select e.emp_id, e.emp_name, e.emp_salary, d.dept_name, d.dept_location
from  department d full outer join  employee e
on e.emp_deptid = d.emp_deptid


-- 32. Subquery 

select * from department
select * from employee



-- display name, salary of employee who salary is
-- greater than mike's salary



select emp_name, emp_salary from employee
where emp_salary >
(select emp_salary from employee where emp_name = 'MIKE')

-- display name, salary of empoyees whose salary is greater
-- than adam's salary and deptno same as adam's deptno

select emp_name, emp_salary from employee
where emp_deptid = 
(select emp_deptid from employee where emp_name = 'ADAM')
AND emp_salary >
(select emp_salary from employee where emp_name = 'ADAM')

-- display emp info who dept is located at newyork

select * from employee
where emp_deptid =  
(select emp_deptid from department where dept_location = 'NEW YORK')


--34. Working with Variables

declare @name varchar(50);
select @name

declare @name1 varchar(50);
set @name1 = 'VIVEK';
select @name1

select @name1 = 'Simmi'
select @name1

declare @name2 varchar(50), @age INT, @salary DECIMAL(7,2) =45000;
select @name2 = 'VIVEK', @age = 21;
select @name2 as 'NAME', @age as 'AGE', @salary as 'SALARY'

declare @number INT = 100;
set @number += 50;
select @number as 'NUMBER'

set @number = @number - 50;
select @number as 'NUMBER'

select * from employee

declare @name3 varchar(50), @salary3 decimal(7,2)
select @name3 = emp_name, @salary3 = emp_salary from employee
select @name3 as 'NAME' , @salary3 as 'Salary'



-- 35. Script

-- 36. Batch in T-SQL

-- 37. Go Command

use company_db;
GO

declare @Name1 varchar(50)
select @Name1 = 'Vivek'
GO

-- these variables can only be used in the batch, 
-- variables are limited to this batch (local variable)
declare @Name varchar(50)
select @Name = 'Vivek'
select @Name as 'Name'
GO

select @Name

-- 39. BEGIN...END in T-SQL

use company_db

select * from employee


begin 
	declare @name varchar(50), @salary int, @deptid varchar(10) = 'D3'
	select @name = emp_name, @salary  = emp_salary from employee
	where emp_deptid = @deptid
	select @name as 'Name', @salary as 'Salary'

	begin
		print 'dept id : '  + @deptid;
	end
end
go

-- 40. IF...ELSE Statement in T-SQL

begin 
	declare @salary decimal
	select @salary  = avg(emp_salary) from employee;
	select @salary as 'Avg. Salary'

	if @salary > 25000
		begin
			print 'Avg salary is greater than 25000';
		end
	else 
		begin
			print 'Avg salary is less than 25000';
		end
end

-- 41. WHILE Loop in T-SQL

select * from employee

begin 
	while( select min(emp_salary) from employee ) < 35000
	begin
		update employee set emp_salary = emp_salary + 10000
		print 'all salaries are updated';
		
		select * from employee;
		if ( select min(emp_salary) from employee) >= 35000
		print 'min salary is greater or equal to 35000.'
		break;
	end
end

-- 42. TRY...CATCH in T-SQL

begin try
	select 100/5 as 'Division'
end try
begin catch
	select ERROR_MESSAGE() as 'Error Messasge'
end catch

begin try
	select 100/0 as 'Division'
end try
begin catch
	select ERROR_MESSAGE() as 'Error Messasge', ERROR_LINE() as 'Error line',
	error_number() as 'error number', error_procedure() as 'procedure name'
end catch	

select ERROR_MESSAGE() as 'Error Messasge', ERROR_LINE() as 'Error line',
	error_number() as 'error number', error_procedure() as 'procedure name';


	-- 43. WAITFOR in T-SQL

	select getdate()
	go 

	begin 
		waitfor time '19:12:00'
		select * from company_db.dbo.employee
	end
	go
	select getdate() as 'current time'


begin 
	waitfor delay '00:00:10'
	select * from company_db.dbo.employee
end
go
select getdate() as 'current time'

-- 44. What is stored procedure in T-SQL

-- 45. Create Stored Procedure in T-SQL

use company_db
go

create procedure proc_allEmployeeDetails
as 
begin
	select * from employee
end
go

-- exec or
execute proc_allEmployeeDetails
go
-- 46. Parameterized Stored Procedure in T-SQL

select * from employee
select * from department
go

create procedure proc_employeeDetailsLocationWise (@location as varchar(50))
as
begin
	select * from 
	employee e inner join department d
	on e.emp_deptid = d.emp_deptid
	where d.dept_location = @location
	
end
go

exec proc_employeeDetailsLocationWise @location = 'Mumbai'
go
-- 47. Alter (Modify) a Stored Procedure in T-SQL 



alter procedure proc_allEmployeeDetails
as
begin 
	select emp_id, emp_name, emp_salary,dept_name, dept_location
	from employee inner join department
	on employee.emp_deptid = department.emp_deptid
end
go

exec proc_allEmployeeDetails
go

alter procedure proc_employeeDetailsLocationWise(@location as varchar(50))
as
begin
	select e.emp_id, e.emp_name, e.emp_salary, d.dept_name, d.dept_location
	from employee e inner join department d
	on e.emp_deptid = d.emp_deptid
	where d.dept_location = @location
end
go

exec proc_employeeDetailsLocationWise @location = 'Mumbai'
go

-- 48. Rename a Stored Procedure in T-SQL

exec sp_rename 'proc_allEmployeeDetails', 'proc_displayEmployeeDetails';

select * from sys.sql_modules
go

drop procedure proc_displayEmployeeDetails
go

create procedure proc_displayEmployeeDetails
as
begin 
	select emp_id, emp_name, emp_salary,dept_name, dept_location
	from employee inner join department
	on employee.emp_deptid = department.emp_deptid
end
go

select * from sys.sql_modules
go
-- 49. User-defined Functions in T-SQL 

-- 50. Scalar-Valued Function (Create) in T-SQL 

create function salary(@name as varchar(50))
returns decimal -- returns salary
begin
	declare @sal decimal;
	select @sal = emp_salary from employee
	where @name = emp_name
	return @sal
end

select dbo.salary('MIKE')

select * from employee
go
-- 51. Table-valued Function in T-SQL

-- inline table-valued function
create function getAllEmployees(@salary decimal)
returns table
as 
return 
	select * from employee where emp_salary = @salary

select * from getAllEmployees(55000)
go
-- multi- statement table-valued function


create function getListOfEmployeesUsingDID(@dept_id as varchar(50))
returns @table table
(ID int, NAME varchar(50), SALARY decimal, DEPTID varchar(50))
as
begin
	insert into @table --all values from the below select statement are stored into this table
	select * from employee where emp_deptid = @dept_id;
	return
end
go

select * from getListOfEmployeesUsingDID('d2')
go
-- 52. Modify, Delete, Rename, View User-defined Function in T-SQL

-- 53. Introduction to Triggers in T-SQL

-- 54. DML Trigger Part-I

create trigger tr_message
on employee
after insert 
as 
	begin
		print 'Welcome to our company'
	end

insert into employee values(1007, 'Vivek',50000, 'D2')

select * from employee
 

-- 55. DML Trigger Part-II 

create table employeeLogs
(id int, name varchar(255), salary decimal, deptid varchar(255), 
modifiedBy varchar(255), modifiedOn date)

select * from employeeLogs
go

--creating the insert trigger

create trigger tr_employees_after_insert
on employee
after insert
as 
	begin
		insert into employeeLogs
		select emp_id, emp_name, emp_salary, emp_deptid, 'vivek', getdate() 
		from inserted;
	end

--insert new records

insert into employee values(1008, 'mike', 45000, 'd2')

select * from employeeLogs
go

-- creating the update trigger

create trigger tr_employee_after_update
on employee
after update
as
	begin
		insert into employeeLogs
		select emp_id, emp_name, emp_salary, emp_deptid, 'vivek', getdate() 
		from inserted;
	end
go

update employee
set emp_salary = 45000
where emp_id = 1008

select * from employeeLogs
go

--trigger for delete

create trigger tr_employee_after_delete_new
on employee
after delete
as
	begin
		insert into employeeLogs
		select emp_id, emp_name, emp_salary, emp_deptid, 'vivek', getdate() 
		from deleted;
	end
go


delete from employee where emp_name = 'vivek'
select * from employeeLogs

--- 56. DML Trigger Part-III


select * from employeeLogs
select * from employee

--after trigger for all dml operations on employee table

create trigger tr_employee_allDMLOperations
on employee
after insert, delete, update
as 
	begin

