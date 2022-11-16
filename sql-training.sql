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


# select clouse
#where
#in
#null 
#multi table 

#and 
#or 
#with 
#as
#having


#order By

#update

#Delete
