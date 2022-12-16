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
DELIMITER ;  -- change it to default


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

call customer_arg_sp(2);

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

call addition(5,50);

call addition(15,25);


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
#------------Drop All Procedures from DB-------------------------------------
SELECT
    CONCAT('DROP ',ROUTINE_TYPE,' `',ROUTINE_SCHEMA,'`.`',ROUTINE_NAME,'`;') as stmt
FROM information_schema.ROUTINES where ROUTINE_SCHEMA='advancedb';


#------------Parameters-------------------------------------
[IN | OUT | INOUT] parameter_name datatype[(length)]

/*IN Parameter*/

DELIMITER $$
CREATE PROCEDURE getOrders(in custId int)
BEGIN
	select * from orders where customer_id =custId;			
END$$
DELIMITER ;

call getOrders(1) ;

call getOrders(2) ;

call getOrders(0) ;

/*OUT Parameter*/
DELIMITER $$
create procedure addition(in num1 int,in num2 int,out result int)
begin
	set result=num1+num2;
end $$
DELIMITER ;

set @addresult=0;

call addition(10,12,@addresult);

select @addresult;

call addition(15,12,@addresult);

select @addresult;



select sqrt(16);


DELIMITER $$
DROP PROCEDURE IF exists GET_SQRT$$
CREATE PROCEDURE GET_SQRT(in num INT, OUT sqrt_result FLOAT)
begin
    SET sqrt_result=SQRT(num);
END$$
DELIMITER ;

set @result=0;

call GET_SQRT(16,@result);

select @result;


/*example 2*/
DELIMITER $$
DROP PROCEDURE IF exists cust_count_sp$$
CREATE PROCEDURE cust_count_sp(OUT cust_count FLOAT)
begin
    select count(*) into cust_count from customers;  
END$$
DELIMITER ;

set @cust_count=0;

call cust_count_sp(@cust_count);

select @cust_count;


/*INOUT Parameter*/

DELIMITER $$
DROP PROCEDURE IF exists mycounter$$
CREATE PROCEDURE mycounter( INOUT counter INT, IN inc INT )
BEGIN
	SET counter = counter + inc;
END$$
DELIMITER ;

SET @counter = 1;

select @counter;

CALL mycounter(@counter,1); -- 2

select @counter;

CALL mycounter(@counter,1); -- 3

select @counter;

CALL mycounter(@counter,5); -- 8

select @counter;

#------------IF-THEN [IF-ELSE] -------------------------------------

/*
	The IF statement has three forms: 
	1. simple IF-THEN statement,
	2. IF-THEN-ELSE statement, 
	3. IF-THEN-ELSEIF- ELSE statement.
*/


/*Simple IF-THEN */

/*IF condition THEN 
   statements;
END IF;*/


DELIMITER $$
drop procedure if exists testIfThen$$
create  PROCEDURE testIfThen(IN  switch INT)
BEGIN
   if switch=1 then
   		select "I am in if block";
   end if;
END$$
DELIMITER ;

call testIfThen(1);

call testIfThen(0);

call testIfThen(5);



DELIMITER $$
drop procedure if exists testIfThen$$
create  PROCEDURE testIfThen(IN  num INT)
BEGIN
   	DECLARE i int;
   	set i= 10 ;
   		if num>0 then
   			set i= i+num;
   		end if;
   	select i;	
END$$
DELIMITER ;

call testIfThen(1);

call testIfThen(2);

call testIfThen(3);

call testIfThen(4);

/*find is number is positive*/
DELIMITER $$
drop procedure if exists checkPositiveNumber$$
create  PROCEDURE checkPositiveNumber(IN  num INT)
BEGIN
   if num>0 then
   		select concat("Number ",num,' is positive');
   end if;
END$$
DELIMITER ;

call checkPositiveNumber(1);

call checkPositiveNumber(2);

call checkPositiveNumber(0);

#------------IF-THEN-ELSE-------------------------------------

/*
IF condition THEN
   statements;
ELSE
   else-statements;
END IF;
*/
/*find is number is positive or negative*/
DELIMITER $$
create  PROCEDURE findNumberState(in num int)
BEGIN
   if num>0 then
   		select concat("Number ",num,' is positive');
   else
   		select concat("Number ",num,' is negative');
   end if;
END$$
DELIMITER ;

call findNumberState(3);

call findNumberState(-3);


/*get table data on the basis of character*/
DELIMITER $$
create  PROCEDURE getData(in dataSelector varchar(1))
BEGIN
   if dataSelector='c' || dataSelector='C' then
   		select * from customers;
   else
   		select * from orders;
   end if;
END$$
DELIMITER ;

call getData('c');

call getData('C');

call getData('o');

call getData('a');


#------------IF-THEN-ELSEIF-------------------------------------

/*IF condition THEN
   statements;
ELSEIF elseif-condition THEN
   elseif-statements;
...
ELSE
   else-statements;
END IF;*/

/*find the number is positive , negative or zero*/
DELIMITER $$
drop procedure if exists findNumberState$$
create  PROCEDURE findNumberState(in num int)
BEGIN
   if num>0 then
   		select concat("Number ",num,' is positive');
   elseif num<0 then
   		select concat("Number ",num,' is negative');
   else
   		select concat("Number ",num,' is zero');
   end if;
END$$
DELIMITER ;

call findNumberState(3);

call findNumberState(-3);

call findNumberState(0);

#------------CASE-WHEN-------------------------------------

/*CASE case_value
   WHEN when_value1 THEN statements
   WHEN when_value2 THEN statements
   ...
   [ELSE else-statements]
END CASE;*/

/*Task - Print name of day*/
DELIMITER $$
create  PROCEDURE printDayName(in dayNum int)
BEGIN
  case dayNum
  	when 1 then
  		select "Sunday";
  	when 2 then
  		select "Monday";
  	when 3 then
  		select "Tuesday";
  	when 4 then
  		select "Wednesday";
  	when 5 then
  		select "Thursday";
 	when 5 then
  		select "Friday";
  	when 6 then
  		select "Saturday";
  	else
  		select "invalid day number";
  	end case;  		
END$$
DELIMITER ;

call printDayName(1);

call printDayName(3);

call printDayName(7);

/*Assignment  :create case to print month name on the basis of month number*/

DELIMITER $$
create  PROCEDURE printAlphabet(in alphabet varchar(1))
BEGIN
  case alphabet
  	when 'a' then
  		select "This is a";
  	when 'b' then
  		select "This is b";
  	when 'c' then
  		select "This is c";
  	else
  		select "invalid alphabet";
  	end case;	
END$$
DELIMITER ;

call printAlphabet('a');

call printAlphabet('c');

call printAlphabet('#');


DELIMITER $$
create  PROCEDURE getMyData(in tableNum int,in inputId int)
BEGIN
  case tableNum
  	when 1 then
  		select * from customers where id =inputId  ;
  	when 2 then
  		select * from orders where id =inputId ;
  	else
  		select "invalid table number";
  	end case;	
END$$
DELIMITER ;

call getMyData(1,1);

call getMyData(1,2);

call getMyData(2,1);

call getMyData(2,3);


#------------Loop-------------------------------------
/*[begin_label:] LOOP
    statement_list
    [ leave / iterate ] begin_label
END LOOP [end_label]*/

#----------break/continue-------------
# leave label  | Iterate Label

DELIMITER $$
create  PROCEDURE printNumber()
begin
	declare num int;
	declare str varchar(50);
	
	set num=1;
	set str='';

  	print_label: loop
	  		if num>10 then
	  			leave print_label;
	  		end if;
  		set str=concat(str,num,','); 
	  	set num=num+1;	  	
  	end loop print_label;
  	select str;
END$$
DELIMITER ;


call printNumber();

#---------------------------------------------------------

drop procedure if exists printNumberSkipTillFive;

DELIMITER $$
create  PROCEDURE printNumberSkipTillFive()
begin
	declare num int;
	declare str varchar(50);
	
	set num=0;
	set str='';

  	print_label: loop
	  		if num>10 then
	  			leave print_label;
	  		end if;
		  	
  		
	  		set num=num+1;	
	  
	  		if num<=5 then
		  		iterate print_label;
		  	end if;
		  
		  if num<=10 then 
	  		set str=concat(str,num,',');
		  end if;	
	  
  	end loop print_label;
  	select str;
END$$
DELIMITER ;

call printNumberSkipTillFive();


/*Assignment : 
 * Print 10 to 1 numbers
 * Print even numbers between 1 to user given number
 * Calculate factorial of users gien number
 * */

#------------While Loop-------------------------------------
/*[begin_label:] WHILE search_condition DO
    statement_list
END WHILE [end_label]*/

drop procedure printNumberWhile;

DELIMITER $$
create  PROCEDURE printNumberWhile()
begin
	declare num int;
	declare str varchar(50);
	
	set num=1;
	set str='';

  	my_label: while num<=10 do
  		set str=concat(str,num,','); 
	  	set num=num+1;	  	
  	end while my_label;
  	select str;
END$$
DELIMITER ;

call printNumberWhile();

/*Assignment using while : 
 * print 1 to users given number incliding their sum : O/P 1,2,3 | 6   : in -> 5  o/p 1 2 3 4 5 | 15
 * print fabonnacci series till users gien number 
 * */

#------------Repeat Loop [similar to inverse conditional do-while loop]-------------------------------------

/*[begin_label:] REPEAT
    statement
UNTIL search_condition
END REPEAT [end_label]*/

-- breaks loop when condition gets true

drop procedure printNumberRepeat;

DELIMITER $$
create  PROCEDURE printNumberRepeat()
begin
	declare num int;
	declare str varchar(50);
	
	set num=1;
	set str='';

  	my_label:Repeat
  		set str=concat(str,num,','); 
	  	set num=num+1;
	 until num>10  -- breaks loop when condition gets true
  	end repeat my_label;
  	select str;
END$$
DELIMITER ;

call printNumberRepeat();


#------------LEAVE [similar to break]-------------------------------------

DELIMITER $$
create  PROCEDURE getNumber(in num int)
mysp_label:begin
		if num=0 then
			leave mysp_label;  -- breaking sp
		end if;	
  	select num;
END$$
DELIMITER ;

call getNumber(1);

call getNumber(2);

call getNumber(0);

#------------Cursor [similar to resultset]-------------------------------------
/*To handle a result set inside a stored procedure, you use a cursor.
 * A cursor allows you to iterate a set of rows returned by a query and process each row individually.
 */

/*
 * MySQL cursor is read-only, non-scrollable and asensitive.
 *
 * Read-only: you cannot update data in the underlying table through the cursor.
 * Non-scrollable: you can only fetch rows in the order determined by the SELECT statement. You cannot fetch rows in the reversed order. In addition, you cannot skip rows or jump to a specific row in the result set.
 * Asensitive: there are two kinds of cursors: asensitive cursor and insensitive cursor. An asensitive cursor points to the actual data, whereas an insensitive cursor uses a temporary copy of the data. An asensitive cursor performs faster than an insensitive cursor because it does not have to make a temporary copy of data. 
 *
 */


/*  Steps to create and use cursors 
 * -------------------------------------
 *  1. DECLARE cursor_name CURSOR FOR SELECT_statement;
 *  2. DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
 *  3. OPEN cursor_name;
 *  4. FETCH cursor_name INTO variables list;
 *  5. CLOSE cursor_name;
 * --------------------------------------
 */

select * from customers ;  

select concat("[" , first_name , " " , last_name  , "]")  from customers

select CONCAT("[Vishal Varma] " , "[Rahul Mishra]" );

/*TASK : get customer details list */

drop procedure if exists processCustomerData;

DELIMITER $$
create  PROCEDURE processCustomerData(
				INOUT customerDetailsList varchar(500))
begin

	DECLARE finished INTEGER DEFAULT 0;
	DECLARE customerdetails varchar(500) DEFAULT '';
	
	/*declare cursor*/
	DECLARE cursor_customer CURSOR FOR select concat("[" , first_name , " " , last_name  , "]")  from customers;	
	
	/* declare NOT FOUND handler*/
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
	
    /*Open Cursor*/
	OPEN cursor_customer;

	custdata_sp: loop
	
		/*Fetch details in cursor*/	
		FETCH cursor_customer INTO customerdetails;
		IF finished = 1 THEN 
			LEAVE custdata_sp;
		END IF;
		SET customerDetailsList = CONCAT(customerdetails," , ",customerDetailsList);
	
	end loop custdata_sp;

	/*close cursore*/
	close cursor_customer;
	
END$$
DELIMITER ;

set @customerDetailsList='';

call processCustomerData(@customerDetailsList);

select @customerDetailsList;

/*Assignment :
 * 	get customers phone number and send 'Thank you for contacting with us' message
 * 
 * table message -> column : id autoincrement PK ,phone_number , message , status default yes
 * 
 * insert into message (phone number , message)
 * */


#------------Error Handling [similar to try-catch]-------------------------------------
/*
 * When an error occurs inside a stored procedure, 
 * it is important to handle it appropriately, 
 * such as continuing or exiting the current code block’s execution, 
 * and issuing a meaningful error message.
 */

/*  ----------------------------------------------------------
 *  DECLARE action HANDLER FOR condition_value statement;
 *  -----------------------------------------------------------
 */

/*
 * If a condition whose value matches the  condition_value ,
 * MySQL will execute the statement and continue or exit the current code block based on the action .
 * 
 * The action accepts one of the following values:
 * -----------------------------------------------
 * CONTINUE :  the execution of the enclosing code block ( BEGIN … END ) continues.
 * EXIT : the execution of the enclosing code block, where the handler is declared, terminates.
 * 
 * A MySQL error code.
 * --------------------
 * A standard SQLSTATE value. Or it can be an SQLWARNING , NOTFOUND or SQLEXCEPTION condition, 
 * which is shorthand for the class of SQLSTATE values. 
 * The NOTFOUND condition is used for a cursor or  SELECT INTO variable_list statement.
 * 
 */


/* Sample to declare handler */
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;


/* Sample to declare handler */
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET RowNotFound = 1;

/* Sample to declare handler */
DECLARE CONTINUE HANDLER FOR 1062
SELECT 'Error, duplicate key occurred';

#SQLState Codes
#https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-reference-error-sqlstates.html

drop table person ;
truncate table person;
create table person(
	id int,
	first_name varchar(50),
	last_name varchar(50),
	primary key(id,first_name,last_name)
);

insert into person values(1,'Rahul' ,'Varma');

insert into person values(2,'Soham' ,'Jha');

select * from person ;

insert into person values(1,'Rahul' ,'Varma');

drop procedure if exists InsertPerson;

DELIMITER $$
CREATE PROCEDURE InsertPerson( IN pid INT, IN pfirst_name varchar(50),    IN plast_name varchar(50))
BEGIN
	
    
    INSERT INTO person(id,first_name,last_name) VALUES(pid,pfirst_name,plast_name);
    
    select concat(id,'-',first_name,'-',last_name) as person_details from person where id=pid;
   
END$$
DELIMITER ;

call InsertPerson(1,'Rohan','Shende');

call InsertPerson(1,'Rohan','Shende');

# [1062] [23000]: Duplicate entry '1-Rohan-Shende' for key 'person.PRIMARY'

#------------------------------------------------------------------
drop procedure if exists InsertPerson;

DELIMITER $$
CREATE PROCEDURE InsertPerson(
    IN pid INT, 
    IN pfirst_name varchar(50),
    IN plast_name varchar(50)
)
BEGIN

    DECLARE EXIT HANDLER FOR 1062
    	-- BEGIN
 			SELECT CONCAT('My Exception -> Duplicate key ( ',pid,'-',pfirst_name,'-',plast_name,' ) occurred , PLease add valid data ') AS message;
    	-- END
    
    INSERT INTO person(id,first_name,last_name) VALUES(pid,pfirst_name,plast_name);
    
    select concat(id,'-',first_name,'-',last_name) as person_details from person where id=pid;
   
END$$
DELIMITER ;


call InsertPerson(1,'Rohan','Shende');


#------------Raising Errors [similar to throw]-------------------------------------


/*
SIGNAL SQLSTATE | condition_name;
SET condition_information_item_name_1 = value_1,
    condition_information_item_name_1 = value_2, etc;
*/

drop procedure if exists Divide;

DELIMITER $$
CREATE PROCEDURE Divide(
	IN numerator INT, 
	IN denominator INT, 
	OUT result double
)
BEGIN
		SET result := numerator / denominator;
end $$
DELIMITER ;

set @div_result=0;

call Divide(10,2,@div_result);

select @div_result;

call Divide(10,0,@div_result); -- can not divide any number with 0

select @div_result;

#------------------------------------------------------------------

drop procedure Divide;

DELIMITER $$
CREATE PROCEDURE Divide(
	IN numerator INT, 
	IN denominator INT, 
	OUT result double
)
begin
	IF denominator = 0 then
	  SIGNAL SQLSTATE '22012'
      SET MESSAGE_TEXT = 'can not divide by 0', MYSQL_ERRNO = 1365;
	ELSE
		SET result := numerator / denominator;
	END IF;
end $$
DELIMITER ;

set @div_result=0;

call Divide(10,2,@div_result);

select @div_result;

call Divide(10,0,@div_result); -- can not divide any number with 0

select @div_result;

#---------------------------------------------------------------------
drop procedure Divide;

DELIMITER $$
CREATE PROCEDURE Divide(
	IN numerator INT, 
	IN denominator INT, 
	OUT result double
)
begin
	DECLARE divideByZero CONDITION FOR SQLSTATE '22012';

	IF denominator = 0 then
	  SIGNAL divideByZero
      SET MESSAGE_TEXT = 'My ERROR-> can not divide by zero', MYSQL_ERRNO = 1000;
	ELSE
		SET result := numerator / denominator;
	END IF;
end $$
DELIMITER ;

set @div_result=0;

call Divide(10,2,@div_result);

select @div_result;

call Divide(10,0,@div_result); -- can not divide any number with 0

select @div_result;

#---------------------------------------------------------------

drop procedure getCustData;

DELIMITER $$
CREATE PROCEDURE getCustData(in custNum int)
begin
	
	IF custNum = 0 then
	  SIGNAL sqlstate '23000'
      SET MESSAGE_TEXT = 'customer ID can not be null / 0', MYSQL_ERRNO = 1000;
	ELSE
		select * from customers;
	END IF;
end $$
DELIMITER ;

call getCustData(1);

call getCustData(0);

#------------PROCEDURES RETURNS MULTIPLE VALUES-------------------------------------

select * from customers ;

select * from orders ;

drop procedure if exists getCustomerNameAndOrdersCount;

/*get customer name and order count*/
DELIMITER $$
CREATE PROCEDURE getCustomerNameAndOrdersCount(
	IN custId INT, 
	out custName varchar(50), 
	OUT orderCount double
)
begin
	
	select 
	concat(first_name,' ',last_name) into custName 
	from customers where id=custId;

	select 
	count(id) into orderCount 
	from orders where customer_id =custId;
	
end $$
DELIMITER ;

set @custName='';
set @orderCount='';

call getCustomerNameAndOrdersCount(3,@custName,@orderCount);

select @custName,@orderCount;


#------------Stored Functions OR Functions-------------------------------------

/*
 * A stored function is a special kind stored program that returns a single value.
 * Typically, you use stored functions to encapsulate common formulas or business rules 
   that are reusable among SQL statements or stored programs.
 */

/*
DELIMITER $$
CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC   
BEGIN
 -- statements
END $$
DELIMITER ;
*/

/* A deterministic function always returns the same result for the same input parameters 
 * A non-deterministic function returns different results for the same input parameters.
 
Example :- 
	DETERMINISTIC - mathematical function
	non-deterministic - random function
*/

#------------calling Stored Functions-------------------------------------
# select functionName();



DELIMITER $$
CREATE FUNCTION getAddition(num1 int , num2 int) 
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE additionResult int;
		set additionResult=num1+num2;			
	RETURN (additionResult);
END$$
DELIMITER ;

select getAddition(10,35);

select getAddition(15,35);

#-----------------------------------------

drop function if exists getRandom;

#Need below line to activate non deterministic function creation : default - 0
SET GLOBAL log_bin_trust_function_creators = 1;
#SET GLOBAL log_bin_trust_function_creators = 0;


DELIMITER $$
CREATE FUNCTION getRandom(num1 int) 
RETURNS int
NOT DETERMINISTIC
BEGIN
    DECLARE randomNumber int;
		select FLOOR(RAND() * (num1 - 1 + 1)) + 1 into 	randomNumber;		
	RETURN (randomNumber);
END$$
DELIMITER ;



select getRandom(20);


#-------------------------------------------------------
drop function if exists getRecordCount;

DELIMITER $$
CREATE FUNCTION getRecordCount(tableName varchar(50)) 
RETURNS int
DETERMINISTIC
BEGIN
    DECLARE recordCount int;
	
	if tableName='Customers' or tableName='customers' then
		select count(id) into recordCount from customers ;
	elseif tablename='Orders' or tablename='orders' then
		select count(id) into recordCount from orders ;
	else
		set recordCount=0;
	end if;
		
	RETURN (recordCount);
END$$
DELIMITER ;

select getRecordCount("orders");

select getRecordCount("customers");

select getRecordCount("other");

#----------------calling function from procedures------------------------------------------
drop procedure if exists addTwoNumbers;

DELIMITER $$
create procedure addTwoNumbers(in num1 int, in num2 int)
begin
	select getAddition(num1,num2);
end$$
DELIMITER ;


call addTwoNumbers(10,15);

call addTwoNumbers(20,30);

/**
 *  functions can be called from procedure  | procedure can not be called from functions
 */

/*Cant call procedures from function*/
/*TODO : difference between Procedure vs Function */


#------------List all functions-------------------------------------
SHOW FUNCTION STATUS  WHERE db = 'advancedb';


#Removing function
--------------------------------
DROP FUNCTION [IF EXISTS] function_name;

DROP FUNCTION IF EXISTS getAddition;

SHOW FUNCTION STATUS  WHERE db = 'advancedb';


#------------Index-------------------------------------
/* MySQL uses indexes to quickly find rows with specific column values. 
 * Without an index, MySQL must scan the whole table to locate the relevant rows.
 */


#------------Create Index-------------------------------------

CREATE INDEX index_name ON table_name (column_list)

CREATE INDEX idx_cust_id ON customers(id);

CREATE INDEX idx_cust_id_name ON customers(id,first_name);

#------------List Index-------------------------------------
SHOW INDEXES FROM <table_name>;

SHOW INDEXES FROM customers;

#------------Removing Index-------------------------------------
DROP INDEX index_name ON table_name

DROP index idx_cust_id_name on customers;


#------------TRIGGERS-------------------------------------
/*
 *  In MySQL, a trigger is a stored program invoked automatically in response to an event such as 
 *  insert, update, or delete that occurs in the associated table. 
 *  For example, you can define a trigger that is invoked automatically before a new row is inserted into a table.
*/

#------------Create TRIGGERS-------------------------------------

/*
 CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE| DELETE }
ON table_name FOR EACH ROW
trigger_body;
*/

/**

trigger-Event	OLD		NEW
INSERT				No		Yes
UPDATE				Yes		Yes
DELETE				Yes		No

**/

/*log update activity of customers table for audit*/

select * from customers;

/*create log table*/
create table customers_audit(
	id int primary key auto_increment,
	custId INT NOT NULL,
    oldFirstName VARCHAR(50) not NULL,
	newFirstName VARCHAR(50) NOT NULL,
    oldLastName VARCHAR(50) NOT NULL,
	newLastName VARCHAR(50) NOT NULL,     
	changedat DATETIME DEFAULT now(),
    action VARCHAR(50) DEFAULT 'update'
);



create trigger customers_audit_update
before update
on customers for each row
INSERT INTO 
customers_audit(
custId,
oldFirstName,newFirstName,
oldLastName,newLastName) 
values(old.id , old.first_name , new.first_name , old.last_name , new.last_name );


update customers set first_name ='SRK' where id=1;

select * from customers;

select * from customers_audit ;

update customers set first_name ='Hardik' where id=2;

update customers set first_name ='Hardik' , last_name ='Pandya' where id=2;

select * from customers;

select * from customers_audit ;


#------------SHOW TRIGGERS-------------------------------------
SHOW TRIGGERS;

#------------DROP TRIGGERS-------------------------------------
DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name;

DROP TRIGGER customers_audit_update;

DROP TRIGGER IF EXISTS advancedb.customers_audit_update;



/*Send message to customer once he registers to your domain*/

/*
 * Design -> 
 * Register -> insert customer data into customers
 * 
 * Send Message -> once data inserted in customers insert message and contact number in message table
 * 
 * */

select * from customers ;

#drop table message_details;

create table message_details(
	id int primary key  auto_increment,
	customerid int ,
	emailId varchar(50) ,
	phone varchar(10),
	message  varchar(300) default 'Thank you for choosing X Mart , You can call on our helpline number 9999999999 for any kind of issues/request/feedback', 
	message_status varchar(3) default 'NO'
);


create trigger customers_message_Details
after insert
on customers for each row
INSERT INTO message_details
(customerid,emailId,phone) 
values(new.id,new.email,new.phone_number);



INSERT INTO customers (first_name, last_name, email,phone_number) 
VALUES ('Varun', 'Sharma', 'vs@gmail.com','7600000001'),
       ('Pooja', 'Mehra', 'pm@gmail.com','7600000002'),
       ('Tina', 'Tondon', 'tt@gmail.com','7600000003');

select * from customers c ;


select * from message_details;

/*
 * Assignment -> 
 * 1. create student table with columns id , first name , last name , marks1 ,marks2 ,marks13 ,marks4 ,marks5 - use procedure to insert data
 * 2. create student_result table with column resultid , studentid , total_marks , avaerage , percentage , result_Status [pass/faile] [pass if % >35] - use trigger to insert
 * 
 * */
#------------------------------------All The Best----------------------------------------------------------
