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

#alter Tabel
#-----Add column
#-----update column
#-----rename column
#-----drop column


#copy Tabel

#Data Types
#------------

##Number  -
#String 
#Floating Point
#character
#Boolean





#Data Operations
#-----------------
#insert
insert into employee(id,name,address,phone_number,email_id,salary) values(1,'Rohit Sharma' , 'Nagpur', '8945689564' ,'abc@gmail.com',44000.56);
#select

#update

#Delete
