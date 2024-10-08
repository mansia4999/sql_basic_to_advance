--  here performing the basic to intermediate tasks
-- SQL series 
-- date format 'yyyy-mm-dd'

-- creating employees table 
-- 50000.25

CREATE TABLE employees (
						employee_id int, 
						name varchar(25),
						department varchar(25),
						salary DECIMAL(10, 2),
						hiredate date
						);


-- Inserting more records into employees table 

INSERT INTO employees (employee_id, name, department, salary, hiredate)
VALUES 
    (1, 'John Doe', 'IT', 50000, '2020-01-15'),
    (2, 'Jane Smith', 'HR', 55000, '2019-08-20'),
    (3, 'Michael Lee', 'Marketing', 60000, '2020-03-10'),
    (4, 'Emily Brown', 'Finance', 65000, '2018-11-05'),
    (5, 'David Wilson', 'IT', 52000, '2021-02-28');
	
select * from employees;

-- creating product table

CREATE TABLE products (
					    product_id INT,
					    product_name VARCHAR(100),
					    category VARCHAR(100),
					    price DECIMAL(10, 2),
					    quantity_in_stock INT
						); 

-- inserting records into products table 

INSERT INTO products (product_id, product_name, category, price, quantity_in_stock)
VALUES 
    (101, 'Laptop', 'Electronics', 1200, 50),
    (102, 'Smartphone', 'Electronics', 800, 100),
    (103, 'Headphones', 'Electronics', 100, 200),
    (104, 'T-shirt', 'Clothing', 20, 300),
    (105, 'Jeans', 'Clothing', 50, 150);

 select * from products;
-- Creating customers table 

CREATE TABLE customers (
					    customer_id INT,
					    customer_name VARCHAR(100),
					    email VARCHAR(100),
					    phone_number VARCHAR(20),
					    city VARCHAR(100)
						);


-- inserting data into customers table 

INSERT INTO customers (customer_id, customer_name, email, phone_number, city)
VALUES 
    (201, 'Alice Johnson', 'alice@example.com', '1234567890', 'New York'),
    (202, 'Bob Smith', 'bob@example.com', '9876543210', 'Los Angeles'),
    (203, 'Emma Davis', 'emma@example.com', '4567890123', 'Chicago'),
    (204, 'Jack Brown', 'jack@example.com', '7890123456', 'Houston'),
    (205, 'Olivia Wilson', 'olivia@example.com', '2345678901', 'Miami');


-- creating orders table 
CREATE TABLE orders (
					    order_id INT ,
					    customer_id INT,
					    product_id INT,
					    order_date DATE,
					    quantity_ordered INT
					);

-- inserting data into orders 
INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity_ordered)
VALUES 
    (301, 201, 101, '2022-03-15', 2),
    (302, 202, 103, '2022-03-16', 3),
    (303, 203, 104, '2022-03-17', 1),
    (304, 204, 102, '2022-03-18', 2),
    (305, 205, 105, '2022-03-19', 1);


-- PRIMARY KEY (t_id cannot be empty, cannot be duplicate, it has be unique)

CREATE TABLE transaction (
					    transaction_id INT PRIMARY KEY,
					    customer_id INT,
					    amount DECIMAL(10, 2),
					    transaction_date DATE,
					    payment_method VARCHAR(50)
						);

-- inserting records into transactions
INSERT INTO transaction (transaction_id, customer_id, amount, transaction_date, payment_method)
VALUES 
    (401, 201, 1200, '2022-03-15', 'Credit Card'),
    (402, 202, 1000, '2022-03-16', 'PayPal'),
    (403, 203, 800, '2022-03-17', 'Cash'),
    (404, 204, 1500, '2022-03-18', 'Debit Card'),
    (405, 205, 600, '2022-03-19', 'PayPal');


select * from employees;    -- employee_id,name, department,salary,hiredate
select * from products;    -- product_id,product_name,category,price,qunatity_in_stock
select * from customers;   -- customer_id,cusomer_name,email,phone_number,city
select * from orders;		-- order_id,customer_id,product_id,order_dt=ate,quanity_ordered
select * from transaction;	-- transaction_id,cusomer_id,amount,transaction_date,payment_method





-- -----------------------------------------------
-- Business Problems & Answers 
-- -----------------------------------------------

-- Q.1 Find the employees with the highest salary.

SELECT * FROM employees
WHERE salary = 65000;

-- all the employee who are from IT
SELECT * FROM employees
WHERE department = 'IT'

SELECT * FROM employees
WHERE salary > 60000;


SELECT * FROM employees
WHERE salary <= 50000;


-- Q.2 List employees hired after January 1, 2021.

SELECT * FROM employees
WHERE hiredate > '2021-01-01'




-- Q.8 Calculate total number of product we have in products table.

-- SUM, COUNT, MAX, MIN
	
SELECT 
	COUNT(product_id) as total_products
FROM products;




-- Q.4 Update the salary of employee with ID 3 to 62000.


SELECT * FROM employees;

UPDATE employees
SET salary = 62000
WHERE  employee_id = 3

	select  * from employees;

-- updating salary to 55000 and department to 'it' for zara

UPDATE employees
SET department = 'it', salary = 55000
WHERE name = 'zara'

	
SELECT * FROM employees
WHERE name = 'zara'

	
SELECT * FROM employees
WHERE  employee_id = 3




-- Q.10 Delete products with a price less than 50.

SELECT * FROM products
WHERE price < 50;

DELETE FROM products
WHERE price < 50;



-- -----------------------------------------------
-- Business Problems & Answers 
-- -----------------------------------------------



-- Employee Queries:

Q.1 Find the employee with the highest salary.

  select * from employees
	where salary = 65000;
	

Q.2 List employees hired after January 1, 2021.



select 
		*
from employees 
where hiredate>'2021-01-01';

	
Q.3 Calculate the average salary of employees in each department.

select 
		department,
		avg(salary) as avg_salary
from employees
group by 1;
	
Q.4 Update the salary of employee with ID 3 to 62000.

update employees
set  salary= 62000
where employee_id = 3

	
Q.5 Delete the employee with the lowest salary.

delete from employees
where employee_id =1;

select * from employees
	
-- Product Queries:
Q.6 Find the total value of products in stock for each category.

select  
	category,
	quantity_in_stock,
	sum(price)as total_value
from products
group by 1,2
order by 3
	
Q.7 Identify products with a quantity in stock less than 50.
select
		quantity_in_stock,
		product_name,
		count(product_id) as countofproducts
from products
	where quantity_in_stock <100
group by 1,2 
	
Q.8 Calculate total number of product we have.

select
		count(product_id)
from products
	
Q.9 Update the price of all products in the 'Clothing' category to 10% higher.

update products
set price = price * 1.10
where category = 'Clothing'

select * from products	
Q.10 Delete products with a price less than 50.

delete from products
where price <60

select * from products
	
-- Customer Queries:
Q.11 Count the number of customers in each city.

select
		city,
		count(customer_id) as countofcus
from customers
group by 1
	
Q.12 Identify customers who have made transactions using PayPal.


select * from customers
select * from transaction

select *
from transaction as t
left join customers as c
on t.customer_id = c.customer_id
where payment_method ='PayPal'

	
	
Q.13 Calculate the total amount spent by each customer.

	
	select * from transaction

select 
		customer_id,
		sum(amount)as Total_amount
from transaction
group by 1


	
Q.14 Update the email of customer with ID 204 to 'new_email@example.com'.

select * from customers

update customers
set email ='new_email@example.com'
where customer_id = 204
	
Q.15 Delete customers who have not made any transactions.

select * from transaction


delete from transaction
where payment_method= 'Cash'


-- Order Queries:
	
Q.16. Find the total number of orders placed on each date.

select 
		order_date,
		count(order_id) as total_number_orders
from orders
group by 1
order by 2

	
Q.17 Identify orders with a quantity_ordered greater than 3.

select * 
from orders
where quantity_ordered <3
	
Q.18 Calculate the total sale amount for each product.


SELECT
		PRODUCT_ID,
		SUM(AMOUNT) AS TOTAL_SALE_AMOUNT
FROM ORDERS
JOIN  TRANSACTION
ON ORDERS.CUSTOMER_ID = TRANSACTION.CUSTOMER_ID
GROUP BY 1

	
Q.19 Update the order_date of order with ID 304 to '2022-03-20'.

SELECT * FROM ORDERS;

UPDATE ORDERS
SET ORDER_DATE ='2022-03-20'
WHERE ORDER_ID = 304
	
Q.20 Delete orders placed before January 1, 2022.

DELETE  FROM ORDERS
WHERE ORDER_DATE< '2022-01-1'

SELECT * FROM ORDERS


	
-- Transaction Queries:
Q.21. Find the average transaction amount for each payment method.

 SELECT 
		PAYMENT_METHOD,
		AVG(AMOUNT)AS AVERAGE_AMOUNT
FROM TRANSACTION
GROUP BY 1
	
Q.22 Identify transactions made on March 15,

 SELECT * 
FROM TRANSACTION
WHERE TRANSACTION_DATE ='2022-03-15'

-- Your TASK


-- Insertion Tasks:
1. Insert a new employee with the following details: EmployeeID = 101,
	Name = 'John Doe', Department = 'Marketing', Salary = 60000, HireDate = '2022-04-01'.

SELECT * FROM EMPLOYEES;

INSERT INTO EMPLOYEES
	VALUES(101, 'John Doe','Marketing',60000,'2022-04-01')
	
2. Add a new product with the following details:
	ProductID = 11, Name = 'Smartphone', Category = 'Electronics', Price = 799.99, Quantity = 100.

	SELECT * FROM PRODUCTS

INSERT INTO PRODUCTS
	VALUES(11,'Smartphone','Electronics',799.99,100)

-- Update Tasks:
1. Increase the salary of all employees in the 'Sales' department by 10%.
 SELECT * FROM EMPLOYEES

	
UPDATE EMPLOYEES
SET  SALARY =  SALARY * 1.10
WHERE DEPARTMENT = 'HR'

	
Update the price of the product with ProductID = 3 to 99.99.


UPDATE PRODUCTS
SET PRICE = 99.99
WHERE PRODUCT_ID = 11

SELECT * FROM PRODUCTS

	


	
-- Deletion Tasks:
1. Delete the employee with EmployeeID = 102.

SELECT * FROM EMPLOYEES

DELETE FROM EMPLOYEES
WHERE EMPLOYEE_ID = 101

	
Remove all products with a Quantity less than 100.


SELECT * FROM PRODUCTS


DELETE FROM PRODUCTS
WHERE QUANTITY_IN_STOCK <100

