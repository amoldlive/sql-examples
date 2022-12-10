#------------{ Advance SQL }---------------------------
/**
 * @Author ->   Amol Dhawale
 * @Since ->    December 2022
 * @Note ->     This will explain advance sql concepts in mysql
 * @Contact ->  amoldlive@gmail.com | 7276466779
 * @Linkedin -> amoldhawale
 */
#-----------Required Data Builder----------------------
create database advancedb;

use advancedb;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number varchar(10)
);
 

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_details varchar(50),
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
 
INSERT INTO customers (first_name, last_name, email,phone_number) 
VALUES ('Rahul', 'Mishra', 'rm@gmail.com','7878457845'),
       ('Vishal', 'Varma', 'vv@gmail.com','4556788945'),
       ('Rohan', 'Trivedi', 'rt@gmail.com','1245784512'),
       ('John', 'Steele', 'js@gmail.com','4578457845'),
       ('Arun', 'Patel', 'ap@gmail.com','1278457845');

 select * from customers  ;    
       
INSERT INTO orders (order_details, order_date, amount, customer_id)
VALUES ('Oil','2022-02-10', 99.99, 1),
       ('soap','2022-11-11', 35.50, 1),
       ('fortune rice 5kg','2022-12-12', 800.67, 2),
       ('pen','2022-01-03', 12.50, 2),
       ('Vim Liquid 2L','2022-04-11', 450.25, 5),
        ('Vim Bar','2022-04-11', 65.25, 3),
        ('Cello Bottle','2022-04-11', 450.25, 3),
       ('Face Wash','2022-04-11', 45.25, 4);

 select * from orders  ;

#------------views-------------------------------------
/* the View is a virtual table created by a query by joining one or more tables */
/*-------------Create----------------------------------*/

/*syntax*/
-- CREATE [OR REPLACE] VIEW view_name AS    
-- SELECT columns    
-- FROM tables    
-- [WHERE conditions];

select  * from customers ;

select  id,first_name ,last_name  from customers ;

create view customers_view1 as
select id ,first_name ,last_name  from customers ;

select * from customers_view1 ;


create view customers_order_view as
select 
customers.id ,customers.first_name ,customers.last_name,
orders.order_details ,orders.amount  
from customers inner join orders 
where customers.id =orders.customer_id ;

select * from customers_order_view ;

/*with OR Replace*/
create or replace view customers_view1 as
select id ,first_name from customers ;

select * from customers_view1 ;


/*-------------Update----------------------------------*/
/*Syntax*/
/*
ALTER VIEW view_name AS    
SELECT columns    
FROM table    
WHERE conditions;   
*/

alter view customers_view1 as
select id ,first_name,last_name from customers
where id in (1,2,3);

select *  from customers_view1;

/*-------------Show Views----------------------------------*/

SHOW FULL TABLES IN advancedb WHERE TABLE_TYPE LIKE 'VIEW';

/*-------------Drop----------------------------------*/
/*Syntax*/
/*DROP VIEW [IF EXISTS] customers_view1;   */
DROP VIEW customers_view1;   

DROP VIEW customers_view1;   

DROP VIEW IF EXISTS customers_view1;   


#------------Stored Procedures-------------------------------------
/*A procedure (often called a stored procedure) is a collection of pre-compiled SQL statements stored inside the database.*/

/*Syntax*/
/*
DELIMITER $$  
CREATE PROCEDURE procedure_name [[IN | OUT | INOUT] parameter_name datatype [, parameter datatype]) ]    
BEGIN    
    Declaration_section    
    Executable_section    
END $$  
DELIMITER ; 
*/

select * from customers  ;   

select * from orders;

/* Delimeter  - > default ; */
DELIMITER delimiter_character

DELIMITER $$ -- channging default delimeter
 

/*Syntax --> Creating Simple Procedures*/

DELIMITER $$
CREATE PROCEDURE stored_procedure_name()
BEGIN
  -- statements 
END $$
DELIMITER ;  // change it to default


/*calling stored procedures */

CALL stored_procedure_name();


/*Creating 1st procedure */

DELIMITER $$
CREATE PROCEDURE customer_sp()
BEGIN
  select * from customers;
END $$
DELIMITER ;  

/*calling procedures*/
call customer_sp;

call customer_sp();


/*Creating procedure with argument*/

DELIMITER $$
CREATE PROCEDURE customer_arg_sp(in cust_id int)
BEGIN
  select * from customers where id=cust_id;
END $$
DELIMITER ;

/*calling procedure with argument*/
call customer_arg_sp(1);


#------------Show Procedures-------------------------------------
/*Syntax*/
/*SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE search_condition]*/

SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS like 'cust%';

SHOW PROCEDURE STATUS where db='advancedb';

#------------Alter Stored Procedures-------------------------------------
/*
To make such changes, you must drop ad re-create the stored procedure 
using the DROP PROCEDURE and CREATE PROCEDURE statements.
*/


#------------Removing stored procedure-------------------------------------
DROP PROCEDURE [IF EXISTS] stored_procedure_name;

DROP PROCEDURE customer_sp;

DROP PROCEDURE customer_sp;

DROP procedure if exists customer_sp;


#------------Check stored procedure Defination-------------------------------------
show create procedure <procedure_name>;

show create procedure customer_arg_sp;


#------------Stored Procedure Variable-------------------------------------

DECLARE variable_name datatype(size) [DEFAULT default_value];

/*
Desclare -> declare variable
datatype -> data type of the variable
default -> default value assigned to variable
*/

/*Assigning variable value*/
SET variable_name = value;

DECLARE total INT DEFAULT 0;
SET total = 10;


/* Constants */
SET @counter = 1;

/*Accessing Constants */
select @counter;


#------------Using variables-------------------------------------
DELIMITER $$
CREATE PROCEDURE testVariable()
BEGIN
	DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 0;
    DECLARE c INT DEFAULT 0;
    
    set a=50;
   	set b=50;
    set c=a+b;
    select c;  
END$$
DELIMITER ;

call testVariable();



DELIMITER $$
CREATE PROCEDURE addition(in num1 int,in num2 int)
BEGIN
    DECLARE addition INT DEFAULT 0;
			
   	set addition=num1+num2;
   select addition;  
END$$
DELIMITER ;

call addition(5,5);



DELIMITER $$
CREATE PROCEDURE getTotalCustomers()
BEGIN
    DECLARE totalCustomers INT DEFAULT 0;
			
	select count(*) into totalCustomers from customers ;
	
   select totalCustomers;  
END$$
DELIMITER ;



call getTotalCustomers(); 

/*Assignment 
 * -> implement store procedure which can take 2 inputs and perform substraction
 * * -> implement store procedure which can take 2 inputs and perform multiplication
 * * -> implement store procedure which can take 5 inputs and perform total /average operation
 * 
 * */
