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