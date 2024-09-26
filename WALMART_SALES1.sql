--  here learning group by, having, order by with basics to advance level
 --   creating table : walmart_sales
--  insert the datas / file

-- GROUP BY in SQL
DROP TABLE IF EXISTS walmart_sales;
CREATE TABLE walmart_sales(
                            invoice_id VARCHAR(15),
                            branch	CHAR(1),	
                            city  VARCHAR(25),  
                            customer_type	VARCHAR(15),
                            gender	VARCHAR(15),
                            product_line VARCHAR(55),	
                            unit_price	FLOAT,
                            quantity    INT, 	
                            vat	FLOAT,
                            total	FLOAT,
                            date	date,	
                            time time,
                            payment_method	VARCHAR(15),
                            rating FLOAT
                        );

SELECT * FROM walmart_sales;




-- ---------------------------------------------
-- Business Problems :: Basic Level
-- ---------------------------------------------
Q.1 Find the total sales amount for each branch

SELECT
	BRANCH,
	SUM(TOTAL) AS TOTALSALES
FROM WALMART_SALES
GROUP BY BRANCH;
	
Q.2 Calculate the average customer rating for each city.

SELECT
		CITY,
		AVG(RATING) AS AVG_RATING
FROM WALMART_SALES
GROUP BY CITY
ORDER BY 2
	
Q.3 Count the number of sales transactions for each customer type.

	SELECT * FROM WALMART_SALES

SELECT
		CUSTOMER_TYPE,
		COUNT(TOTAL)AS NUM_SALES
FROM WALMART_SALES
GROUP BY CUSTOMER_TYPE
		
Q.4 Find the total quantity of products sold for each product line.

SELECT
		PRODUCT_LINE,
		SUM(TOTAL)AS TOTAL_SALES,
		COUNT(QUANTITY)AS TOTAL_QUANTITY
FROM WALMART_SALES
GROUP BY PRODUCT_LINE
ORDER BY 2,3
	
Q.4 v1 Calculate the total VAT collected for each payment method.

SELECT * FROM WALMART_SALES


SELECT 
		PAYMENT_METHOD,
		SUM(VAT) AS TOTAL_VAT
FROM WALMART_SALES
GROUP BY 1
-- ---------------------------------------------
-- Business Problems :: Medium Level
-- ---------------------------------------------
Q.5 Find the total sales amount and average customer rating for each branch.


SELECT
		BRANCH,
		SUM(TOTAL) AS TOTAL_SALES,
		AVG(RATING) AS AVG_RATING
FROM WALMART_SALES
GROUP BY BRANCH


	
Q.6 Calculate the total sales amount for each city and gender combination.

SELECT
		CITY,
		GENDER,
		SUM(TOTAL)AS TOTAL_SALE
FROM WALMART_SALES
GROUP BY 1,2
ORDER BY 2
		



	
Q.7 Find the average quantity of products sold for each product line to female customers.

SELECT
		PRODUCT_LINE,
	AVG(QUANTITY)AS AVG_QUANTITY
FROM WALMART_SALES
WHERE GENDER='Female'
group by 1
order by 2

	
Q.8 Count the number of sales transactions for members in each branch.

select * FROM WALMART_SALES


SELECT
		BRANCH,
	SUM(TOTAL) AS TOTAL_SALE
FROM WALMART_SALES
GROUP BY BRANCH

	
Q.9 Find the total sales amount for each day. (Return day name and their total sales order DESC by amt)

SELECT
		TO_CHAR(DATE,'DAY') AS DAY_NAME,
		SUM(TOTAL) AS TOTAL_SALE
FROM WALMART_SALES
GROUP BY 1
ORDER BY 2 DESC


-- ---------------------------------------------
-- Business Problems :: Advanced Level
-- ---------------------------------------------
Q.10 Calculate the total sales amount for each hour of the day

SELECT
		EXTRACT(HOUR FROM TIME)AS HOUR_OF_DAY,
		SUM(TOTAL)AS TOTAL_SALE
FROM WALMART_SALES
GROUP BY 1
ORDER BY 2

	
Q.11 Find the total sales amount for each month. (return month name and their sales)

SELECT
		TO_CHAR(DATE,'MONTH')AS MONTHS,
		SUM(TOTAL)AS TOTAL_SALE
FROM WALMART_SALES
GROUP BY 1
ORDER BY 2
	
Q.12 Calculate the total sales amount for each branch where the average customer rating is greater than 8.

	SELECT
			BRANCH,
			SUM(TOTAL)AS TOTAL_SALE,
		AVG(RATING) AS AVG_RATING
FROM WALMART_SALES
GROUP BY 1
HAVING AVG(RATING)>7


Q.13 Find the total VAT collected for each product line where the total sales amount is more than 500.

SELECT
		PRODUCT_LINE,
		SUM(VAT)AS TOTAL_VAT,
		SUM(TOTAL) AS TOTAL_SALES
FROM WALMART_SALES
GROUP BY 1
HAVING SUM(TOTAL) >500

	
Q.14 Calculate the average sales amount for each gender in each branch.

	SELECT
			GENDER,
			BRANCH,
			AVG(TOTAL) AS AVG_SALES
	FROM WALMART_SALES
	GROUP BY 1,2
	ORDER BY 2
	
Q.15 Count the number of sales transactions for each day of the week.

SELECT
		TO_CHAR(DATE,'DAY')AS DAY_OF_WEEK,
		COUNT(TOTAL) AS TOTAL_TRANSACTIONS
FROM WALMART_SALES
GROUP BY 1
ORDER BY 2

Q.16 Find the total sales amount for each city and customer type combination
	where the number of sales transactions is greater than 50.

SELECT
		CITY,
		CUSTOMER_TYPE,
		SUM(TOTAL) AS TOTAL_SALE,
		COUNT(TOTAL) AS TOTAL_ORDERS
FROM WALMART_SALES
GROUP BY 	1,2
HAVING COUNT(TOTAL) >50
	
Q.17 Calculate the average unit price for each product line and payment method combination.

SELECT
		PRODUCT_LINE,
		PAYMENT_METHOD,
		AVG(UNIT_PRICE) AS AVERAGE_PRICE
FROM WALMART_SALES
GROUP BY 1,2
ORDER BY 3
	
Q.18 Find the total sales amount for each branch and hour of the day combination.
SELECT
		BRANCH,
		EXTRACT(HOUR FROM TIME) AS HOURS,
		SUM(TOTAL) AS TOTAL_SALE
FROM WALMART_SALES
GROUP BY 1,2
ORDER BY 2
	
Q.19 Calculate the total sales amount and average customer rating for each product line
	where the total sales amount is greater than 1000.

SELECT 
		PRODUCT_LINE,
		SUM(TOTAL) AS TOTAL_SALES,
		AVG(RATING)AS AVGRATING
FROM WALMART_SALES
GROUP BY 1
HAVING SUM(TOTAL)>1000
	
Q.20 Calculate the total sales amount for morning (6 AM to 12 PM),
	afternoon (12 PM to 6 PM), and evening (6 PM to 12 AM) periods using the time condition.



WITH NEW_TABLE
as(

SELECT * ,
	CASE
		WHEN EXTRACT(HOUR FROM TIME) BETWEEN 6 AND 12 THEN  'MORNING'  
		WHEN  EXTRACT(HOUR FROM TIME) >12 AND  EXTRACT(HOUR FROM TIME) >=18 THEN 'AFTERNOON'
		ELSE 'EVENING'
		END  AS SHIFT
FROM WALMART_SALES
)
SELECT
	  SHIFT,
	SUM(TOTAL) AS TOTAL_SALE,
	COUNT(INVOICE_ID) AS TOTAL_ORDERS
FROM NEW_TABLE
GROUP BY 1
HAVING  COUNT(INVOICE_ID) <500



