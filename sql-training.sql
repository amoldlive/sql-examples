#Database Operation
-------------------

#create database
create database mydb;

#drop database 
drop database mydb

#rename database name : Direct rename is not supported in mysl

#select Databse
use mydb;


#Table Operation
----------------
#create Tabel
create table employee(
	id int,
	name varchar(100),
	address  varchar(100),
	phone_number varchar(10),
	email_id  varchar(100),
	salary float
);

#table representation
select * from employee ;

#drop Tabel
drop  table employee ;

#rename Tabel
rename table djfdj to employee;

#delete Tabel
delete from employee;

#truncate Tabel
truncate employee;

#alter Tabel operations
--------------------------

#-----Add column
ALTER TABLE employee ADD dept varchar(100);  

select *  from employee;

#-----Add Multi Column
ALTER TABLE employee ADD ( dept_id int, org varchar(50) ,test varchar(10) );  

select *  from employee;

#-----update column
ALTER TABLE employee MODIFY org varchar(100);  

#-----rename column
ALTER TABLE employee RENAME COLUMN org to organization;    

#-----drop column
ALTER TABLE employee DROP Column test;  


#Data Types
#------------

#Number  
Int

#String 
Varchar(100)

#Floating Point
float /double

#character
character(10)

#Boolean
bool


select * from employee e ;

#Data Operations
#-----------------
#insert

#Valid
insert into employee(id,name,address,phone_number,email_id,salary) values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);

#invalid
INSERT INTO employee values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);

#valid
INSERT INTO employee values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'IT',1,'Google');

select * from employee e ;

#------DummyData  -- execute SQL script
-------------------------------------
truncate table employee ;

INSERT INTO employee(id,name,address,phone_number,email_id,salary,dept,dept_id,organization) values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'HR',1,'Google');
INSERT INTO employee(id,name,address,phone_number,email_id,salary,dept,dept_id,organization) values(2,'Ameya Sawant' , 'Delhi', '1234567890' ,'cde@gmail.com',50000,'HR',1,'Google');
INSERT INTO employee values(3,'Priti kulhari' , 'Nagpur', '1234567891' ,'efg@gmail.com',80000,'IT',101,'Amazon');
INSERT INTO employee values(4,'Neha sharma' , 'Mumbai', '1234567892' ,'hij@gmail.com',80000,'IT',1,'Google');
INSERT INTO employee values(5,'Prakash Jha' , 'Delhi', '1234567893' ,'dsf@gmail.com',22000,'IT',1,'Google');
INSERT INTO employee values(6,'Digvesh Pandey' , 'Nagpur', '1234567894' ,'ssss@gmail.com',10500,'STAFF',102,'Amazon');
INSERT INTO employee values(7,'Akshay Patil' , 'Pune',  '1234567895' ,'cccc@gmail.com',90000,'IT',1,'Google');
INSERT INTO employee values(8,'Suman Srivastava' , 'Nagpur', '1234567896' ,'yyyy@gmail.com',30000,'HR',111,'Microsoft');
INSERT INTO employee values(9,'Anurag Pandit' , 'Mumbai', '1234567897' ,'zzzz@gmail.com',21200,'HR',1,'Google');
INSERT INTO employee values(10,'Ranveer Sing' , 'Nagpur', '123456789' ,'aaaa@gmail.com',25000,'IT',1,'Google');



#select
select * from employee ;

select id,name,address,phone_number,email_id,salary,dept,dept_id,organization from employee ;

select id,name from employee ;

select dept from employee ;

select organization  from employee ;

#distinct - find unique values
select organization  from employee ;

select distinct organization from employee;

select distinct dept from employee;


#count  get count of the data
select count(*) from employee ;

select count(id) from employee ;

#Aggregate functions
select * from employee;

select sum(salary) from employee;

select min(salary) from employee;

select max(salary) from employee;

select floor(salary) from employee;

select ceil (salary) from employee;


#80.6
#floor - 80
#ceil - 81

#where

#select column_names from table_name where [condition]

# = , < , > , <= , >= , <>    [conditional - operators] 

select * from employee where id=2;

select * from employee where salary <30000;

select * from employee where salary >30000;

select * from employee where salary <=30000;

select * from employee where salary >=30000;

select * from employee where salary <> 30000;

# and , or , in , as

#****************************AND /OR **********************************************************

select * from employee where salary >30000 and address ='Mumbai';

# find the list of Amazon employees whose salary is less than 30000 
select * from employee where salary <30000 and organization ='Amazon';

# find the list of Amazon employees whose salary is less than 30000 and working is STAFF department 
select * from employee where salary <30000 and organization ='Amazon' and dept='STAFF';

## find the list of Amazon employees whose salary is less than 30000 and working is IT department
select * from employee where salary <30000 and organization ='Amazon' and dept='IT';


# find the list of  employees whose salary is less than 30000 or working with Amazon 
select * from employee where salary <30000 or organization ='Amazon';

# find the list of  employees whose salary is less than 30000 or working with Amazon or department is staff
select * from employee where salary <30000 or organization ='Amazon' or dept='STAFF';

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

#***************** Group By ********************************
select * from employee e ;

#find how much total salary is paying by each company
select organization , sum(salary) from employee group by organization ;

#find count of employee from each city
select address , count(name) from employee group by address;

#Having vs Where

#*******************Order By************************************
#order by asc /desc 
#order by multi column
#SELECT * FROM customers  
#ORDER BY country, Customer-Name;  



#order By

#update
#UPDATE table_name  
#SET column_name = expression  
#WHERE conditions  
#Delete


#String function 
#Constraints
#joins
#sql injection
#SELECT * from EMPLOYEE where id=100 or   1=1  

