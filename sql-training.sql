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
select * from employee where organization ='Amazon' and salary <30000 ;

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
select * from employee where  salary<30000 and  ( dept='HR' or dept='IT' ) ;


# find the list of  employees whose salary is greater than 30000 and working with Amazon Or Google 
select * from employee where salary >30000 and (organization ='Amazon' or organization ='Google');


#************** in**************************************
#find the list of employees working in Amazon Google Microsoft
select * from employee where organization='Amazon';

select * from employee where organization in ('Amazon' , 'Google' , 'Microsoft');

select * from employee where organization in ( 'Google');

#************** AS**************************************
#display id,name,Salary of enployee as employee_id,employee_name , employee_salary
select id ,name ,salary from employee;

select id as employee_id,name as employee_name,salary as employee_salary from employee;

select id  employee_id,name  employee_name,salary  employee_salary from employee;

select id  employee_id,name  employee_name,salary  employee_salary from employee emp where emp.id =2;


#*******************Order By************************************
#Natural sorting algo -ascending

#order by asc /desc 
select * from employee e order by name ;

select * from employee e order by name asc;

select * from employee e order by address ASC;

select * from employee e order by address  desc;

#order by 2nd column - ascending
select id,name,salary from employee e order by 2 ASC;

#order by 2nd column -descending
select id,name,salary from employee e order by 2 desc;

#order by multi column
select * from employee e order by address ;

select * from employee e order by address,name ;

select * from employee e order by address,name desc;

#***************** Group By ********************************
select * from employee e ;

#find how much total salary is paying by each company
select organization , sum(salary) from employee group by organization ;

#find count of employee from each city
select address , count(name) as employee_count from employee group by address;

select address , count(name) as employee_count from employee group by address having  count(name)<5;

#TODO - understand the difference - IMP -  where vs having  


#***************** Update ********************************
	
update employee set address ='Kolhapur' where id=7;

select * from employee e where id=7;

select * from employee e ;

update employee set phone_number ='9874589645' where id=4 and name ='Neha sharma';

#multi column update
update employee set phone_number ='9874589645', salary=0 where id=4 and name ='Neha sharma';


#***************** Delete ********************************
delete  from employee where id=10;

select * from employee e where id=10 ;
 
#below query will delete all the data from employee table
# delete  from employee; 


select *  from employee e ;

#***************** MISC Operations ********************************
#UUID - universally unique identifier
select uuid();

#  ROW_Number()
SELECT *, ROW_NUMBER() OVER(order by salary) AS row_num  
FROM employee ;  

#Rand() - get random records
select * FROM employee e  
ORDER BY RAND() LIMIT 1;  


#***************** Sub Queries ********************************
#find employee with highest salary 
select * from employee order by salary desc limit 1;

select * from employee where salary =(select max(salary) from employee e);

#find employee with 2nd highest salary
select * from employee where salary <(select max(salary) from employee e) order by salary desc limit 1;

#find employee with 3rd highest salary
SELECT *, ROW_NUMBER() OVER(order by salary desc) AS row_num  FROM employee ;

SELECT * from (select *, ROW_NUMBER() OVER(order by salary desc) AS row_num  FROM employee ) emp where row_num=1;

 SELECT * from (select *, ROW_NUMBER() OVER(order by salary desc) AS row_num  FROM employee) emp  where emp.row_num=3;

#find employee with 3rd lowest salary
#find employee with 2nd highest salary less than 70000

#find dupllicate records
INSERT INTO employee values
(13,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56,'HR',1,'Google'),
(14,'Ameya Sawant' , 'Delhi', '1234567890' ,'cde@gmail.com',50000,'HR',1,'Google');


select * from employee e ;

select name ,count(name) from employee e group by name having count(name)>1;

#delete duplicate records
select * from employee e2 where id in (1,2,11,12);

SELECT	id, name,     ROW_NUMBER() OVER ( PARTITION BY name ORDER BY name) AS row_num  FROM employee e ;

select * from ( select  id,name,  ROW_NUMBER() OVER ( PARTITION BY name ORDER BY name) AS row_num  FROM employee)  emp where emp.row_num>1 ;

select id from ( select  id,name,  ROW_NUMBER() OVER ( PARTITION BY name ORDER BY name) AS row_num  FROM employee)  emp where emp.row_num>1 ;

delete from employee where id in (select id from ( select  id,name,  ROW_NUMBER() OVER ( PARTITION BY name ORDER BY name) AS row_num  FROM employee)  emp where emp.row_num>1 );

#***************** CRUD Excersise ********************************

create database - mycart

create table cloaths

cloathid primary key  , article , color  , size , price  , available


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

-- print all data using single line command

-- add new shirt of grey color having size M and price 2000 which is available to sell

-- select available articles and colors

-- select all medium shirts

-- select article,price of color white and size L 

-- find article with min price

-- find article with max price

-- find 2nd highest price article

-- find 3rd lowest price article

-- find articles withi care not available in stock

-- find article and total price belongs to that article 

-- update all shirt size to L

-- update price of the shirt to 0 if not available into the stock

-- delete all articles if not available

-- delete jeans whose price is less than 2500

#***************** constraints ********************************
/*
 * Not null
 * unique
 * primary key 
 * default
 * check
 * foreign key
 * composite key
 * */

#***************** Not Null ********************************
drop table person;

create table person(
	id int,
	firstName varchar(20) ,
	lastName varchar(20) ,
	age int 
);

desc person;

insert into person values(1,null,null,null);

select * from person;


insert into person values(null,null,null,null);

select * from person;

drop table person;


create table person(
	id int not null,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);

desc person;

insert into person values(1,'virat','kohli',null);

insert into person values(1,'virat',null,40);

insert into person values(1,'virat','kohli',40);

select * from person;

insert into person values(1,'virat','kohli',40);

select * from person;

#*****************Unique ********************************

drop table person;

create table person(
	id int not null unique,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);

desc person ;

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

select * from person;

#*****************primary key ->  not null + unique ********************************

drop table person;

create table person(
	id int primary key,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);

desc person;

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

select * from person;

#primary key -way 2
drop table person;

create table person(
	id int,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null,
	primary key(id)
);

desc person;

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

select * from person;

#primary Key-way 3
drop table person;

create table person(
	id int,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null
);

ALTER TABLE person  add primary key(id);  

desc person;

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

select * from person;


#*****************Composite Key ********************************
drop table person;

create table person(
	id int,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null,	
	primary key(id,firstName)
);

desc person;

insert into person values(1,'virat','kohli',40);

insert into person values(1,'virat','kohli',40);

insert into person values(2,'virat','kohli',40);

insert into person values(1,'rahul','jain',30);

select * from person;


#*****************Default ********************************
drop table person;

create table person(
	id int primary key,
	firstName varchar(20) not null,
	lastName varchar(20) not null,
	age int not null default 0
);

insert into person(id,firstName,lastName) values(2,'virat','kohli');

select * from person;


#*****************Auto Increment ********************************
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


#*****************Check ********************************
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

select * from person where age>18; 
-- time consume


#*****************String Function ********************************

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
 
desc books;

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

select * from books ;

#concat
select concat('A','B','C') output;

SELECT CONCAT('pi', 'ckle');

SELECT CONCAT(author_fname,' ', author_lname) as author_fullname  FROM books;


#concat_WS
SELECT CONCAT_WS('-', 'I', 'am', 'learning', 'SQL!') as output;

#I-am-learning-SQL!

SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;


#substring

/*
sentence  			Hello World
start point         1
end point           4
*/

SELECT SUBSTRING('Hello World', 1, 4);
 
SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', 9);
 
#start with last location
SELECT SUBSTRING('Hello World', -5 );

SELECT SUBSTRING('Hello World', -1 );

SELECT SUBSTRING('Hello World', -3 );


SELECT title FROM books;

#The Amazing Adventures of Kavalier & Clay : The Amazin

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books where title ='The Amazing Adventures of Kavalier & Clay';
 
#SUBSTRING /SUBSTR
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;


#multi function

select concat('Hello' ,'World')

select substring('Hello World' , 7);

select concat('Hello' ,substring('Hello Wold' , 7))

select concat_ws('**','Hello' ,substring('Hello Wold' , 7))


#The Amazin...

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;


#Replace
/*String , spring_part , new_part
 * */
SELECT REPLACE('Hello World', 'Hell', '%$#@');
 
SELECT REPLACE('Hello World', 'l', '7');
 
SELECT REPLACE('Hello World', 'o', '0');
 
SELECT REPLACE('HellO World', 'o', '*');
 
select REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;
 
SELECT REPLACE(title, ' ', '-') as newtitle FROM books;


#reverse
SELECT REVERSE('Hello World');
 
SELECT REVERSE('meow meow');
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, '  ' ,REVERSE(author_fname)) FROM books;


#length
SELECT CHAR_LENGTH(' Hello World ');
 
SELECT title , CHAR_LENGTH(title) as length  FROM books;
 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


#upper , lower
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;


#INSERT
#Insert the string Replace the Nthe sixth characters:
SELECT INSERT('Hello Bobby', 6, 0, 'There'); 
#HelloThere Bobby

SELECT INSERT('Hello Bobby', 6, 1, 'There'); 
#HelloThereBobby

SELECT INSERT('Hello Bobby', 6, 2, 'There'); 
#HelloThereobby

#LEFT RIGHT REPEAT TRIM
SELECT LEFT('omghahalol!', 3);
 
SELECT RIGHT('omghahalol!', 4);
 
SELECT REPEAT('ha', 4);
 
SELECT TRIM('  pickle  ');


#*****************String Function Excercise ********************************

-- reverse and uppercase the following sentence
 #A set of words that is complete in itself
-- replace spaces in titles with ->
-- print name and reverse of the name
-- print book title and length of each title
-- print short title , author , quantity #titlelength-> 10


#*****************SQL Injection ********************************
use mydb;

CREATE TABLE admin 
	(
		id INT primary key auto_increment,
		user_id varchar(100) not null,
		password varchar(100) not null
	);


insert into admin(user_id,password) values('rahul@gmail.com','abcd@123'),
('priya@gmail.com','abdssdcd@123'),
('sonam@gmail.com','absdscd@123');

select * from admin;

select * from admin where id=4568 or 1=1 ; 

#*****************Date Playground ********************************
use mydb;

CREATE TABLE people (
	name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

select * from people;
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Elton', '2000-12-25', '11:00:00', '2000-12-25 11:00:00');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Lulu', '1985-04-11', '9:45:10', '1985-04-11 9:45:10');
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Juan', '2020-08-15', '23:59:00', '2020-08-15 23:59:00');


SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();
 
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

select * from people;

SELECT 
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM people;
 
SELECT 
    birthdate,
    MONTHNAME(birthdate),
    YEAR(birthdate)
FROM people;


SELECT 
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime)
FROM people;
 
SELECT 
    birthdt,
    MONTH(birthdt),
    monthname(birthdt), 
    DAY(birthdt),
    HOUR(birthdt),
    MINUTE(birthdt)
FROM people;

##TODO - refer below for more date time function details
#https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html

#*****************Foreign Key ********************************
#TODO : Understand Normalization and ACID Property
use mydb;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

 select * from customers c ;    
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

 select * from orders ;    	   

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 10);      

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 4);      



SELECT id FROM customers WHERE last_name = 'George';

SELECT * FROM orders WHERE customer_id = 1;
 
 
SELECT * FROM orders 
WHERE customer_id = (SELECT id FROM customers WHERE last_name = 'George');

 
#*****************Join ********************************
use mydb;

drop table orders;
drop table customers;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);
 
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
     
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5),
       ('1999-04-11', 450.25, 8);

select * from customers c ;  
select * from orders ; 

-- To perform a (kind of useless) cross join:
SELECT * FROM customers, orders;

#*****************Inner Join ********************************
SELECT * FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT * FROM customers
INNER JOIN orders ON orders.customer_id = customers.id;
 

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT orders.id,customers.first_name, customers.last_name, orders.order_date, amount FROM customers
JOIN orders ON orders.customer_id = customers.id;

SELECT o.id,c.first_name, c.last_name, o.order_date, amount FROM customers c
JOIN orders o ON o.customer_id = c.id;

/*The order doesn't matter here*/

SELECT * FROM orders
JOIN customers ON customers.id = orders.customer_id;


/*group By with join*/

SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name;

/*order By with join*/
SELECT 
    first_name, last_name, SUM(amount) AS total
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.id
GROUP BY first_name , last_name
order by total desc;
