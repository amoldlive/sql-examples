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

#------------------------------------------------Alter Operations-------------------------------------------------------------------------------------

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

#-------------------------------------------------------Insert Operation------------------------------------------------------------------------------

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




#assignmnet -
/*
 * create student db
 * create student table
 * properties
 * table operations
 * 20 recrods - using single insert / multi insert 
 * 
 */*
#----------------------------------------------------Select Operation---------------------------------------------------------------------------------

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

#----------------------------------------------------Aggregate Functions---------------------------------------------------------------------------------


#Aggregate functions
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

#80.6
#floor - 80
#ceil - 81
#https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html

#--------------------------------------------------Clouse-----------------------------------------------------------------------------------

#Clouse
	/*
	 * Where 
	 * group by
	 * having
	 * order by
	 */*

#where -> filteration 

#select column_names from table_name where [condition]

# = , < , > , <= , >= , <> , !=   [conditional - operators] 

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
	 
#Limit
select * from employee ;

SELECT * FROM employee  LIMIT 1;

SELECT name FROM employee e  LIMIT 3;

SELECT name,salary FROM employee e  LIMIT 3;

SELECT * FROM employee  LIMIT 5;

#wildcard characters _ , %
select * from employee e ;

SELECT * FROM employee
WHERE name LIKE '_o%';

SELECT * FROM employee e 
WHERE address  LIKE '______';

SELECT id, name , salary  
FROM employee e 
WHERE name LIKE '%ri%';

#---------------------------------------------Combining Conditions----------------------------------------------------------------------------------------

#merging / Combining Conditions
# and , or , in , as

#****************************AND /OR **********************************************************
#find employee whose salary is more than 30000 and stays in mumbai
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
select * from employee e order by name ,address;


#***************** Group By ********************************
select * from employee e ;

#find how much total salary is paying by each company
select organization , sum(salary) from employee group by organization ;

#find count of employee from each city
select address , count(name) as employee_count from employee group by address;

select address , count(name) as employee_count from employee group by address having  count(name)<5;

#TODO - understand the difference - IMP -  where vs having  

#--------------------------------------------------update/delete-----------------------------------------------------------------------------------

#update
	
update employee set address ='Kolhapur' where id=7;

select * from employee e where id=7;

select * from employee e ;

update employee set phone_number ='9874589645' where id=4 and name ='Neha sharma';

#Delete
delete  from employee where id=10;

select * from employee e ;
 
# delete  from employee; 

#------------------------------------------------------Constraints--------------------------------------------------------------------------------

#constraints 
/*
 * Not null
 * unique
 * primary key 
 * default
 *
 * */


#Person Table
create table person(
	firstName varchar(20),
	lastName varchar(20),
	age int
);

select * from person;

insert into person values('virat','kohli',40);

#multi insert
insert into person values
('virat','kohli',40),
('Rahul','vaidya',70),
('dinesh','karti',89);


insert into person(firstName,lastName) values('Soham','shah');

select * from person;


drop table person;

create table person(
	id int not null,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);

insert into person(id , firstName,lastName) values(1,'Soham','shah');

insert into person values(1,'virat','kohli',40);

select * from person;

desc person;



insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);


#id

drop table person;

create table person(
	id int not null unique,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);


insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

select * from person;

desc person;


# primary key ->  not null + unique

#primary key -way 1
drop table person;

create table person(
	id int primary key,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

select * from person;

#primary key -way 2



#default

drop table person;

create table person(
	id int primary key,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null default 20
);

insert into person(id,firstName,lastName) values(2,'virat','kohli');

select * from person;





#auto_increment
drop table person;

create table person(
	id int primary key auto_increment ,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null default 20
);

insert into person(firstName,lastName,age) values('virat','kohli',45);

insert into person(firstName,lastName,age) values('Rahul','Sharma',38);

select * from person;


#check
drop table person;

create table person(
	id int primary key auto_increment ,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null check (age>18)
);

insert into person(firstName,lastName,age) values('virat','kohli',20);

insert into person(firstName,lastName,age) values('Rahul','Sharma',25);

insert into person(firstName,lastName,age) values('Tejas','Varma',10);

select * from person;

#foreign key
#composite key

#---------------------------------------------------------------------------------------------------------------------------------------

#String function 

#refer belo link for more string function
#https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

#Code formatter 
#https://codebeautify.org/sqlformatter


create database booksdb;

use booksdb;

CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);
 
INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

select * from books b ;

#concat
SELECT CONCAT('pi', 'ckle');
 
SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;

SELECT CONCAT_WS('-', 'I', 'am', 'learning', 'SQL!');

SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;


#substring
SELECT SUBSTRING('Hello World', 1, 4);
 
SELECT SUBSTRING('Hello World', 7);
 
SELECT SUBSTRING('Hello World', -4);
 
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;


#multi function
SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;


#Replace
SELECT REPLACE('Hello World', 'Hell', '%$#@');
 
SELECT REPLACE('Hello World', 'l', '7');
 
SELECT REPLACE('Hello World', 'o', '0');
 
SELECT REPLACE('HellO World', 'o', '*');
 
select REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;
 
SELECT REPLACE(title, ' ', '-') FROM books;


#reverse
SELECT REVERSE('Hello World');
 
SELECT REVERSE('meow meow');
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;


#length
SELECT CHAR_LENGTH('Hello World');
 
SELECT CHAR_LENGTH(title) as length, title FROM books;
 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


#upper , lower
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;



#INSERT
SELECT INSERT('Hello Bobby', 6, 0, 'There'); 

SELECT INSERT('Hello Bobby', 6, 1, 'There'); 
 
SELECT INSERT('Hello Bobby', 6, 2, 'There'); 

#LEFT RIGHT REPEAT TRIM
SELECT LEFT('omghahalol!', 3);
 
SELECT RIGHT('omghahalol!', 4);
 
SELECT REPEAT('ha', 4);
 
SELECT TRIM('  pickle  ');


#Excercise -1 
reverse and uppercase the following sentence

 #A set of words that is complete in itself

replace spaces in titles with ->
print name and reverse of the name
print book title and length of each title
print short title , author , quantity

#Excercise-2
CRUD Excercise
---------------------
create database - mycart

create table cloaths

cloathid(primary key)  , article , color  , size , price , available


insert into cloaths
('T-SHIRT' , 'BLUE' , 'M' , 2000,'Y');
('T-SHIRT' , 'WHITE' , 'L' , 2500,'Y');
('T-SHIRT' , 'RED' , 'S' , 1000,'N');
('T-SHIRT' , 'ORANGE' , 'M' , 3000,'Y');
('SHIRT' , 'WHITE' , 'M' , 5000,'Y');
('SHIRT' , 'BLUE' , 'L' , 3500,'N');
('SHIRT' , 'GREY' , 'M' , 3400,'Y');
('TANK-TOP' , 'WHITE' , 'M' , 1000,'Y');
('TANK-TOP' , 'BLACK' , 'S' , 1200,'Y');
('TANK-TOP' , 'BLACK' , 'L' , 1300,'Y');
('JEANS' , 'BLACK' , 'M' , 3000,'Y');
('JEANS' , 'WHITE' , 'L' , 4000,'N');
('JEANS' , 'BLUE' , 'L' , 2500,'Y');
('TANK-TOP' , 'ORANGE' , 'M' , 2200,'Y');



print all data using single line command

add new shirt of grey color having size M and price 2000 which is available to sell

select available articles and colors

select all medium shirts

select article,price of color white and size L 

update all shirt size to L

update price of the shirt to 0 if not available into the stock

delete all articles if not available

delete jeans whose price is less than 2500





#joins
#sql injection
#SELECT * from EMPLOYEE where id=100 or   1=1  

