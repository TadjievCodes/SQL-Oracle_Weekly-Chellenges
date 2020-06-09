-- Question 1)

SELECT companyname, contactname,   address || ', ' ||  city  || ', ' ||  country AS "Full Address"
FROM CUSTOMERS 
ORDER BY companyname, city DESC; 


-- Question 2)
SELECT * 
FROM ORDERDETAILS
WHERE UNITPRICE < 10.00 AND DISCOUNT > 0 AND QUANTITY BETWEEN 29 AND 51
ORDER BY UNITPRICE DESC;

-- Question 3)
SELECT ORDERID 
FROM ORDERDETAILS o
INNER JOIN PRODUCTS p on p.PRODUCTID = o.ORDERID
WHERE o.QUANTITY > 50;


-- Question 4)
SELECT DISTINCT COMPANYNAME as "Shipped By" 
FROM SHIPPERS s
INNER JOIN ORDERS o on o.SHIPVIA = s.SHIPPERID
WHERE o.SHIPCOUNTRY = 'Brazil' 
ORDER BY s.COMPANYNAME;




-- Question 5 and 6 were easy just to give INSERT INTO values which result in error because of the constraintes added in the database tables)



-- Question 7)
SELECT DISTINCT c.COMPANYNAME, e.FIRSTNAME, e.LASTNAME, o.ORDERID, o.ORDERDATE
FROM CUSTOMERS c
INNER JOIN ORDERS o ON o.CUSTOMERID = c.CUSTOMERID
INNER JOIN EMPLOYEES e ON e.EMPLOYEEID = o.EMPLOYEEID
ORDER BY 1, 3;


-- Question 8)
-- Return the product name, product price of any product in the PRODUCTS table that has the same price as another product.
-- Sort by price highest to lowest.

SELECT P1.ProductName, P1.UnitPrice
FROM PRODUCTS P1  
INNER JOIN PRODUCTS P2
ON P1.UnitPrice = P2.UnitPrice
AND P1.ProductName != P2.ProductName
ORDER BY 2 DESC; 


-- Question 9)
SELECT CUSTOMERID, CONTACTNAME
FROM CUSTOMERS 
WHERE CONTACTNAME LIKE '% B%';


-- Question 10)
SELECT *
FROM CUSTOMERS
WHERE CITY IN ('Versailles', 'Bengaluru', 'Seoul', 'Tokyo', 'Walla Walla', 'Buenos Aires') AND COMPANYNAME LIKE '_a%e';





