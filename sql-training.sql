#Database Operation
-------------------
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
BLOB
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

#Assignment-1 - create student table | perform related operations  

#Table Operation
----------------
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


# delete VS truncate


#alter Tabel operations
--------------------------
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


#Data Operations
#-----------------
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
-------------------------------------
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


#select
select * from employee ;


#assignmnet -
/*
 * create student db
 * create student table
 * properties
 * table operations
 * 20 recrods - using single insert / multi insert 
 * 
 */*

