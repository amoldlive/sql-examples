#************** Database Operation**************************************
#create database
#create database <database_name>;
create database mydb;

create database icici_db;

create database student_db;

#drop database 
#drop database <database_name>

drop database icici_db;

drop database student_db;

#rename database name : Direct rename is not supported in mysql

#select Databse
#use <database_name>
use mydb;

#DDL
#create Tabel

/*
create table <table_name>(
	column_details
);
*/

#create table
create table <tablename> (
	// properties
);

create table person (
  firstName varchar(100),
  lastName  varchar(100),
  age       int,
  status    varchar(1)
);

#Data Types

/*
Numeric Types			 
INT
SMALLINT
TINYINT
MEDIUMINT
BIGINT
DECIMAL	
NUMERIC
FLOAT
DOUBLE
BIT
String Type
------------
CHAR
VARCHAR
BINARY
VARBINARY
BLOB  -binary large object
TINYBLOB
MEDIUMBLOB
LONGBLOB
TEXT
TINYTEXT
MEDIUMTEXT
LONGTEXT
ENUM
DATE TYPES
-----------
DATE
DATETIME
TIMESTAMP
TIME
YEAR

boolean
------------
BOOL/boolean
*/

#insert into <table_name> values();

insert into person values('Virat','Kohli',38,'Y');

#select * from <table_name>;

select * from person;

/*
CRUD operaton | DML
--------------------
CREATE READ UPDATE DELETE
*
*CREATE - > CREATE + INSERT
*READ -> SELECT
*UPDATE -> UPDATE
*DELETE -> DELETE
**/

create table employee(
	id int,
	name varchar(100),
	address  varchar(100),
	phone_number varchar(10),
	email_id  varchar(100),
	salary float
);


#************** Table Operation**************************************
show databases;

#DISPLAY LIST OF TABLES
show TABLES;

#display columns from table
show columns from employee;

#describe tables
desc employee ;

#table representation
select * from employee ;


#rename Tabel
rename table <old_table_nmae> to <new_table_name>;

rename table employee to employee2;

rename table employee2 to employee;

#drop Tabel
drop  table employee ;

#delete Tabel
insert into employee(id,name,address,phone_number,email_id,salary) values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);

select * from employee  ;

delete from employee;

#truncate Tabel
insert into employee(id,name,address,phone_number,email_id,salary) values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);

select * from employee  ;

truncate employee;


#TODO : understand delete VS truncate

#************** Alter Table Operations **************************************
#-----Add column
#alter table <table_name> add columnname datatype;

ALTER TABLE employee ADD dept varchar(100);  

desc employee;

#-----Add Multi Column
#alter table <table_name> add ( columnname datatype , columnname2 datatype , ...); 

ALTER TABLE employee ADD ( dept_id int, org varchar(50) ,test varchar(10) );  

desc employee;

#-----update column
#alter table <tablenmae> modify columnname datatype
ALTER TABLE employee MODIFY org varchar(100);  

desc employee ;

#-----rename column
#alter table <tablenmae> rename column old_column_name to new_column_name
ALTER TABLE employee RENAME COLUMN org to organization;    

desc employee ;

#-----drop column
ALTER TABLE employee DROP Column test;  

desc employee ;


#************** Insert Operations **************************************
#insert
#insert into <table_name> values(....,...,..,..);
#insert into <table_name>(columnname1,columnanme2,columnname3) values(....,...,..,..);


#valid
INSERT INTO employee values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'IT',1,'Google');


#Valid
insert into employee(id,name,address,phone_number,email_id,salary) values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);

select * from employee ;

#multi insert 
INSERT INTO employee values
 (1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'IT',1,'Google'),
(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'IT',1,'Google'),
(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'IT',1,'Google')
;

select * from employee e ;

#invalid
INSERT INTO employee values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);


select * from employee e ;

#------DummyData  -- execute SQL script

truncate table employee ;

INSERT INTO employee values
(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'HR',1,'Google'),
(2,'Ameya Sawant' , 'Delhi', '1234567890' ,'cde@gmail.com',50000,'HR',1,'Google'),
(3,'Priti kulhari' , 'Nagpur', '1234567891' ,'efg@gmail.com',80000,'IT',101,'Amazon'),
(4,'Neha sharma' , 'Mumbai', '1234567892' ,'hij@gmail.com',80000,'IT',1,'Google'),
(5,'Prakash Jha' , 'Delhi', '1234567893' ,'dsf@gmail.com',22000,'IT',1,'Google'),
(6,'Digvesh Pandey' , 'Nagpur', '1234567894' ,'ssss@gmail.com',10500,'STAFF',102,'Amazon'),
(7,'Akshay Patil' , 'Pune',  '1234567895' ,'cccc@gmail.com',90000,'IT',1,'Google'),
(8,'Suman Srivastava' , 'Nagpur', '1234567896' ,'yyyy@gmail.com',30000,'HR',111,'Microsoft'),
(9,'Anurag Pandit' , 'Mumbai', '1234567897' ,'zzzz@gmail.com',21200,'HR',1,'Google'),
(10,'Ranveer Sing' , 'Nagpur', '123456789' ,'aaaa@gmail.com',25000,'IT',1,'Google');


#TODO -
#assignmnet -
/*
 * create student db
 * create student table
 * properties
 * table operations
 * 20 recrods - using single insert / multi insert 
 * 
 */

 
#************** Select Operations **************************************
 #select
# fetch all data
select * from employee ;

select  id , name ,address ,phone_number ,email_id ,salary ,dept ,dept_id ,organization from employee ;

#fetch column wise data
select id,name,salary from employee;

select id,name,organization  from employee;


#distinct - find unique values
select organization  from employee ;

#seletc distinct <column_nmae> from <tablename>

select distinct organization from employee;


select dept from employee e ;

select distinct dept from employee;


#************** Aggregate Functions**************************************
#count  get count of the data
#select aggregate_Function(column_name) from <tablename>

#to get count
select count(*) from employee ;

select count(id) from employee ;

select count(name) from employee ;


select * from employee;

#to get sum
select sum(salary) from employee;

select sum(id) from employee;

select * from employee;

#to get minimum value
select min(salary) from employee;

#to get maximum value
select max(salary) from employee;

select * from employee;

#to get floor and ceil
select floor(salary) from employee;

select ceil (salary) from employee;

select avg(salary) from employee;

/**
 * 80.6
 * floor - 80
 * ceil - 81
 */

#TODO - refer below link
#https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html


#************** Clouse **************************************
#Clouse
	/*
	 * Where 
	 * group by
	 * having
	 * order by
	 */*

#**************Where Clouse **************************************
#where -> filteration 
#select column_names from table_name where [condition]

	 
# = , < , > , <= , >= , <> , != , LIKE  [conditional - operators] 

select * from employee where id=2;

select * from employee where salary <30000;

select * from employee where salary >30000;

select id,name,salary from employee where salary >30000;

select * from employee where salary <=30000;

select * from employee where salary >=30000;

#Not Equal To
select * from employee where address <> 'Nagpur';


select * from employee where salary <> 30000;

#Not Equal To
select * from employee where address != 'Nagpur';

select * from employee where salary != 30000;
	 

#**************Like Operator **************************************
#wildcard characters _ , %
# _ -> represent single character location
#% -> represent Multi CHaracter

select * from employee e ;

#select * from employee where <columnname> like 'wildcard expression' ;

#select employee whose names 2nd character is O 
SELECT * FROM employee
WHERE name LIKE '_o%';


SELECT * FROM employee
WHERE name ='Ranveer Sing';

# find employee names contains ee
SELECT * FROM employee
WHERE name like '%ee%';

#find employee whose location contains 6 character start with N
SELECT * FROM employee e 
WHERE address  LIKE 'N_____';

SELECT id, name , salary  
FROM employee e 
WHERE name LIKE '%ri%';


#**************LIMIT Operator **************************************
select * from employee ;

SELECT * FROM employee  LIMIT 1;

SELECT name FROM employee e  LIMIT 3;

SELECT name,salary FROM employee e  LIMIT 3;

SELECT * FROM employee  LIMIT 5;



#************** Combining Conditions [and , or , in ] **************************************

#************** AND **************************************
#find employee whose salary is more than 30000 and stays in mumbai
select * from employee where salary >30000 and address ='Mumbai';

# find the list of Amazon employees whose salary is less than 30000 
select * from employee where salary <30000 and organization ='Amazon';

# find the list of Amazon employees whose salary is less than 30000 and working is STAFF department 
select * from employee where salary <30000 and organization ='Amazon' and dept='STAFF';

## find the list of Amazon employees whose salary is less than 30000 and working is IT department
select * from employee where salary <30000 and organization ='Amazon' and dept='IT';

#************** OR **************************************
# find the list of  employees whose salary is less than 30000 or working with Amazon 
select * from employee where salary <30000 or organization ='Amazon';

# find the list of  employees whose salary is less than 30000 or working with Amazon or department is staff
select * from employee where salary <30000 or organization ='Amazon' or dept='STAFF';

#************** AND/OR **************************************
# find the list of  employees whose salary is less than 30000 and working department is HR or IT 
select * from employee where salary <30000 and dept =('HR' or  'IT');

# find the list of  employees whose salary is greater than 30000 and working with Amazon Or Google 
select * from employee where salary >30000 and organization =('Amazon' or 'Google');


#************** in**************************************
#find the list of employees working in Amazon Google Microsoft
select * from employee where organization='Amazon';

select * from employee where organization =('Amazon' and 'Google' and 'Microsoft');

select * from employee where organization in ('Amazon' , 'Google' , 'Microsoft');

select * from employee where organization in ( 'Google');

#************** AS**************************************
#display id,name,Salary of enployee and employee_id,employee_name , employee_salary
select id ,name ,salary from employee;

#select id as employee_id,name as employee_name,salary as employee_salary from employee;

#select id  employee_id,name  employee_name,salary  employee_salary from employee;

#select id  employee_id,name  employee_name,salary  employee_salary from employee emp where emp.id =2;


#*******************Order By************************************
#Natural sorting algo -ascending

#order by asc /desc 
select * from employee e order by name ;

select * from employee e order by address ASC;

select * from employee e order by address  desc;

#order by 2nd column - ascending
select id,name,salary from employee e order by 2 ASC;

#order by 2nd column -descending
select id,name,salary from employee e order by 2 desc;

#order by multi column
select * from employee e order by address,name ;

select * from employee e order by address,name desc;

#***************** Group By ********************************
select * from employee e ;

#find how much total salary is paying by each company
select organization , sum(salary) from employee group by organization ;

#find count of employee from each city
select address , count(name) as employee_count from employee group by address;

select address , count(name) as employee_count from employee group by address having  count(name)<5;

