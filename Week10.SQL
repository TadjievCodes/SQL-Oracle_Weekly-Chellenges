-- WEEK 10 Content

-- do some math using temp DUAL table

SELECT 235/16 FROM DUAL;



-- GET THE whole number than the remainder

-- We're using trunc aggregate operator here to get the whole number and MOD which is modulus in order to get the remainder part like in any programming

SELECT 235/16 AS "Original Calc", TRUNC(235/16,0) AS "Whole Number Part", MOD(235,16) AS "Remainder Part"
FROM DUAL;



/*
NVL
• Substitutes a value for a ‘null’ value
• Instead of a null being returned you can return a value
SELECT name, NVL(description, '*** Missing Description ***’)
FROM products;
• NVL2
• NVL2 function returns one string when the value of a specified expression is not
null, and returns a different string if the field is null
SELECT name, NVL2(description, 'Has Description', 'Description Missing')
FROM products;

*/

-- Exercise the NVL function


SELECT Id, OrderDate, ShipDate,
       NVL(ShipDate, '2019-12-20'),
       NVL(ShipDate, '2019-12-20') -OrderDate AS "Delay"
FROM Orders WHERE Id > 496;




-- Exercise  the NVL2 function


SELECT Id, OrderDate, ShipDate,
       NVL2(ShipDate, 'Shipped', 'Not Shipped')
       AS "Status"
FROM Orders WHERE Id > 496;





-- format #'s with To_Char


SELECT Id, Name, retailprice,
TO_CHAR(retailprice, '$9,999.99') AS "Retail Price"
FROM Products 
WHERE Id BETWEEN 1 AND 10
ORDER BY 3 DESC;



/*
Typically used to convert dates or numbers to a character string
• Second argument is the format option
SELECT TO_CHAR(retailprice,'$999.99') FROM products;
• would result a formatted string $2.99
SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd') FROM DUAL
• would return the string ‘2014/07/08’
SELECT TO_CHAR(SYSDATE, 'Month DD, YYYY') FROM DUAL;
• would return ‘July 8, 2014’

*/


-- Format dates with To_Char



SELECT OrderDate, ShipDate,
TO_CHAR(OrderDate, 'MONTH DD, YYYY') AS "Order Date",

    TO_CHAR(ShipDate, 'MON-DD-RR') AS "Ship Date"

FROM Orders 
WHERE Id BETWEEN 490 AND 495;




/*
We use TO_DATE to convert character strings to a date format that is
acceptable to Oracle
SELECT TO_DATE('January 15, 1989','Month dd, YYYY') FROM DUAL;
*/


-- Aggregate functions Important part of SQL

/*

There are 5 aggregate functions:
• SUM – Calculates the total for a column of data
• MIN – Returns the smallest value for data in a column
• MAX – Returns the largest value for data in a column
• AVG – Determines the average for data values within a column of data
• COUNT – Returns the number of rows returned by the query
• COUNT(*) or COUNT(order_ID) are both valid

*/



-- What profit did we make on order 312?


SELECT SUM(retailprice-quotedprice) AS "Total Profit"
FROM order_details JOIN products ON
order_details.productId = products.Id 
WHERE OrderId = 312;



-- Whats the average discount we put on Hockey Gloves?

SELECT AVG(retailprice-quotedprice) AS "AVG Discount"
FROM order_details JOIN products ON
order_details.productId = products.Id 
WHERE name LIKE '%Gloves';




-- AVG embedded into To_Char


SELECT TO_CHAR(AVG(retailprice-quotedprice), '$999.99' ) AS "AVG Discount"
FROM order_details JOIN products ON
order_details.productId = products.Id 
WHERE name LIKE '%Gloves';





-- Count Rows with Data
-- How many customers do we have?

SELECT COUNT(*) AS "# of Customers" FROM Customers;

-- OR we could do
SELECT * FROM Customers;





-- MAX
-- What was the largest discount made on a sale?

SELECT TO_CHAR(MAX(retailprice-quotedprice), '$9,999.99' ) AS "Largest Discount On Sale"
FROM products JOIN order_details 
ON order_details.productId = products.Id;


-- MIN Function

SELECT TO_CHAR(MIN(retailprice),'$999.99') AS "Smallest Retail Price"
FROM products;



-- Group BY Example

/*
GROUP BY returns one result per group of rows that are processed by a
query
• Group functions ignore all NULL values except when using the COUNT(*)
• You need to use the DISTINCT to eliminate any duplicate values
*/


/*
When building a query any attributes in the select list that are not
associated with an aggregate function must be included in a group by
clause
*/


SELECT name, SUM(qtyordered)
FROM order_details 
INNER JOIN products on products.id = order_details.productid
GROUP BY name;


-- another example

SELECT Province, COUNT(*) AS "# of Customers" FROM Customers
GROUP BY Province
ORDER BY 2 DESC;








--HAVING clause can be used to filter the result of an aggregate function when grouping information


SELECT Country, name, SUM(qtyordered)
FROM order_details od
INNER JOIN products I ON od.productID = i.id
WHERE Province = 'ON'
GROUP BY country, name
HAVING SUM(qtyordered) > 50;

--• Note: The Having is similar to a where clause but it is applied after the aggregate function takes place

-- aLSO wHERE CLAUSE CANNOT OPERATE ON THE RESULTS OF AN AGGREGATE FUNCTION, THAT'S WHY, WE'RE USING HAVING CLAUSE HERE



-- ANOTHER EXAMPLE


SELECT Province, COUNT(*) AS "# of Customers" FROM Customers
GROUP BY Province
HAVING COUNT(*) > 4
ORDER BY 2 DESC;














-- WEEK 10 LAB Answers started

-----------1

SELECT EMPLOYEES.LASTNAME AS "Employee", COUNT(ORDERS.ORDERID) AS "Orders Sold"
FROM EMPLOYEES JOIN ORDERS ON EMPLOYEES.EMPLOYEEID = ORDERS.EMPLOYEEID
GROUP BY EMPLOYEES.LASTNAME
ORDER BY 2 DESC;

-----------2

SELECT DISTINCT CUSTOMERS.COMPANYNAME AS "Customer", CUSTOMERS.COUNTRY AS "COUNTRY",COUNT(ORDERS.SHIPCOUNTRY)OVER(PARTITION BY CUSTOMERS.COUNTRY) AS "Total Orders from Country"
FROM CUSTOMERS
JOIN ORDERS ON CUSTOMERS.CUSTOMERID = ORDERS.CUSTOMERID ORDER BY 2;


-----------3

SELECT ORDERID, SUM(QUANTITY) AS "Total Qtys"
FROM ORDERDETAILS
GROUP BY ORDERID
HAVING SUM(QUANTITY) > 175
ORDER BY 2 DESC;

-----4

SELECT SUPPLIERS.COMPANYNAME, SUM(PRODUCTS.UNITSINSTOCK) AS "Total Units in Stock"
FROM SUPPLIERS
JOIN PRODUCTS ON SUPPLIERS.SUPPLIERID = PRODUCTS.SUPPLIERID
GROUP BY SUPPLIERS.COMPANYNAME
HAVING SUM(PRODUCTS.UNITSINSTOCK) > 200
ORDER BY 2 DESC;

