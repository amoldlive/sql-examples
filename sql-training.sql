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


#create Tabel

/*

create table <table_name>(
	column_details
);

*/

create table people(
	column_details
);

create table employee(
	id int,
	name varchar(100),
	address  varchar(100),
	phone_number varchar(10),
	email_id  varchar(100),
	salary float
);

#Assignment-1 - create student table 

