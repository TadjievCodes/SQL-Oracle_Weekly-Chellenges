--- Week 11


-- WHAT is the name of the most expensive product?

 SELECT name, TO_CHAR(retailprice, '$9,999.99') AS "Most Expensive"
 FROM products
 WHERE retailprice = (SELECT MAX(retailprice) FROM products);





-- Scalar subquery in the Select Clause
-- Customer lastnames from October 27th orders
 
SELECT orders.Id, orders.orderdate, orders.shipdate,
  (SELECT lastname FROM customers WHERE 
    customers.id = orders.customerid) AS customer
FROM orders WHERE orders.shipdate = '2019-10-27';




/*
*******************************************************************************
Multiple Row Sub queries (Sets)
• Return more than one row of results
• Requires the use of IN, ANY, ALL, or EXISTS operators
Multiple Row Sub Query in a WHERE Clause – IN Operator

*/



-- In keyword, what other products were ordered with
-- an Ash Baseball bat Order 2
--
 
 SELECT DISTINCT name AS "Products Ordered with Ash Bat"
  FROM orders JOIN order_details
  ON orders.id = order_details.OrderId
  JOIN products ON order_details.ProductId = products.Id 
  WHERE orders.Id IN
     (SELECT OrderId FROM order_details
       WHERE productId = 2)
AND products.Id <> 2;



/*
Exists Operator       ************************************          Exists Operator
• Determines whether condition “exists” in sub query, “Find all customers who ordered baseball equipment – CategoryId=2”.
*/

SELECT Customers.Id
      Customers.FirstName,
      Customers.LastName
FROM Customers     
WHERE EXISTS
  (SELECT * FROM Orders INNER JOiN 
     Order_Details ON Orders.Id = Order_Details.OrderId
     INNER JOIN Products ON Products.Id = Order_Details.ProductId 
      WHERE Products.CategoryId = 2 
      AND Orders.CustomerId = Customers.Id );






 -- VIEWS 

/*
A view is a way to expose a results table data so that it looks like a real table. They typically serve 2 main purposes:
1. Simplify having to issue complex queries
2. Restrict access to certain columns from a table
Typically, a view is used with read only access, but it can also write data back to the base table(s) it is created from. 
This class will focus on simple read only views, as they are the ones that you’ll most likely encounter.

*/


CREATE VIEW inventory
AS 
SELECT Id, name, qtyonhand, retailprice
   FROM products
WITH READ ONLY;







-- see view contents

SELECT * FROM inventory;









-- The READ ONLY option indicates that we can’t change the base table, without it,
-- if a change is made to the view (inventory) the base table (products) would also be changed:

-- ensure Read only works


UPDATE inventory SET qtyonhand = 0
WHERE Id = 2;

/*
Again, a View is treated just like a table, so we can process any of our SELECT clauses against it and all standard
 functions like the TO_CHAR function work the same as if they were going against a real table.
*/



-- a view is treated like a table

SELECT Id, TO_CHAR(retailprice, '$9,999.99') AS "Price"
FROM Inventory;



-- We can also create views from more than one table’s columns:







-- view based on two tables

CREATE VIEW CustomerOrders
AS
SELECT FirstName, LastName, orders.id, OrderDate 
 FROM Customers JOIN Orders ON
 customers.Id = orders.customerId
 WITH READ ONLY;





-- tEST OUT

SELECT * FROM CUSTOMERORDERS;


/*
To remove a view, just drop it like any other database object again with Application Express we need to do these one at a time:
*/

DROP VIEW INVENTORY;




-- aND ALSO

DROP VIEW CUSTOMERORDERS;













/* 
                ************************************       Intro to Oracle PL/SQL        ************************************   

We’re going to enter a different world of SQL now. Oracle provides a way to program SQL using a language known officially
 as the Procedural Language extension of SQL or more commonly referred to PL/SQL.
These “procedures” are written as blocks and a block consists of three sections:
• The Declaration section (optional).
• The Execution section (mandatory).
• The Exception Handling (or Error) section (optional).
Declaration Section:
The Declaration section of a PL/SQL Block starts with the reserved keyword DECLARE. 
This section is optional and is used to declare any placeholders like variables, constants…, 
which are used to manipulate data in the execution section. Placeholders may be any of Variables, 
Constants and Records, which store data temporarily.
Execution Section:
The Execution section of a PL/SQL Block starts with the reserved keyword BEGIN and ends with END. 
This is a mandatory section and is the section where the program logic is written to perform any task. 
The programmatic constructs like loops, conditional statement and SQL statements form the part of execution section.
*/





-- usEFUL TO FIND THE ERRORS IF THERE ARE ANY MADE ALONG THE WAY
SELECT * FROM user_errors;









-- Need to use Projects Table for the  LAB of WEEK 11


--- Week 11 And LAB 9 Questions and answers

CREATE VIEW Lab9_View
AS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME AS "COMPANYNAME", SHIPCOUNTRY
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2019-08-14' AND '2019-08-23')
WITH READ ONLY;




-- To test we type 
SELECT * FROM Lab9_View;







CREATE OR REPLACE PROCEDURE p_lab9 IS
o_id varchar2(20);
o_date ORDERS.ORDERDATE%type;
s_date ORDERS.SHIPPEDDATE%type;
company ORDERS.SHIPNAME%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2018-08-14' AND '2018-08-23');
BEGIN
dbms_output.put_line('Tadjiev Muhammad''s Lab 9' || chr(10));
dbms_output.put_line(' # ' || '          ' || ' Order Date ' || '          '||' Ship Date '||'          '|| ' Company ' ||chr(10));
OPEN c_cust;
LOOP
FETCH c_cust into o_id, o_date,s_date,company;
EXIT WHEN c_cust%notfound;
IF (o_id = 10283) THEN  SET s_date = ' -- ' WHERE o_id = 10283 ;
dbms_output.put_line(o_id || '          ' ||o_date||'          '||s_date||'          '||company);
END LOOP;
CLOSE c_cust;
END;









---------------------------------

CREATE OR REPLACE PROCEDURE p_lab9 IS
o_id varchar2(20);
o_date ORDERS.ORDERDATE%type;
s_date ORDERS.SHIPPEDDATE%type;
company ORDERS.SHIPNAME%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2018-08-14' AND '2018-08-23');

BEGIN
dbms_output.put_line('Tadjiev Muhammad''s Lab 9' || chr(10));
dbms_output.put_line(' # ' || '          ' || ' Order Date ' || '          '||' Ship Date '||'          '|| ' Company ' ||chr(10));

OPEN c_cust;
LOOP
FETCH c_cust into o_id, o_date,s_date,company;

EXIT WHEN c_cust%notfound;
IF (s_date == )
dbms_output.put_line(o_id || '          ' ||o_date||'          '||'  --  '||'          '||company);
ELSE
dbms_output.put_line(o_id || '          ' ||o_date||'          '||s_date||'          '||company);
END LOOP;
CLOSE c_cust;
END;



//--------------------------------------------------------------------------------------


CREATE OR REPLACE PROCEDURE cursor_example IS
o_id varchar2(20);
o_date ORDERS.ORDERDATE%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2018-08-14' AND '2018-08-23');

BEGIN
dbms_output.put_line('something' || chr(10));
dbms_output.put_line('order#' || '          ' || ' date ' || chr(10));

OPEN c_cust;
LOOP
FETCH c_cust into o_id, o_date;
EXIT WHEN c_cust%notfound;
dbms_output.put_line(o_id || '          ' ||o_date);
END LOOP;
CLOSE c_cust;
END;

//----------------------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE cursor_example IS
o_id varchar2(20);
o_date ORDERS.ORDERDATE%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2018-08-14' AND '2018-08-23');

BEGIN
dbms_output.put_line('something' || chr(10));
dbms_output.put_line('order#' || '          ' || ' date ' || chr(10));

OPEN c_cust;
LOOP
FETCH c_cust into o_id, o_date;
EXIT WHEN c_cust%notfound;
dbms_output.put_line(o_id || '          ' ||o_date);
END LOOP;
dbms_output.put_line('COMPLETED');
CLOSE c_cust;
END;
//////






-- THE CORRECT VERSION OF THE PROCEDURE

CREATE OR REPLACE PROCEDURE p_lab9 IS
o_id orders.orderid%type;                               --previously o_id varchar2(20);
o_date ORDERS.ORDERDATE%type;
s_date ORDERS.SHIPPEDDATE%type;
company ORDERS.SHIPNAME%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME, --SHIPCOUNTRY
FROM Lab9_View                --When it was from ORDERS it worked right?
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2019-08-14' AND '2019-08-23');

BEGIN
dbms_output.put_line('Tadjiev Muhammad''s Lab 9' || chr(10));
dbms_output.put_line(' # ' || '          ' || ' Order Date ' || '          '||' Ship Date '||'          '|| ' Company ' ||chr(10));

OPEN c_cust;
LOOP
FETCH c_cust into o_id, o_date,s_date,company;

EXIT WHEN c_cust%notfound;
dbms_output.put_line(o_id || '          ' ||o_date||'          '||s_date||'          '||company);
END LOOP;
CLOSE c_cust;
END;





CREATE OR REPLACE PROCEDURE procedurelab9 
IS
orderid orders.orderid%type;
orderdate ORDERS.ORDERDATE%type;
shippeddate ORDERS.SHIPPEDDATE%type;
ship VARCHAR(20);
shipname ORDERS.SHIPNAME%type;
shipcountry orders.shipcountry%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, shipname, SHIPCOUNTRY
FROM lab9 ;

BEGIN
dbms_output.put_line('Tadjiev Muhammad''s Lab 9'  chr(10));
dbms_output.put_line(' # '  '          '  ' Order Date '  '          '' Ship Date ''          ' ' Company ' 'country'chr(10));

OPEN c_cust;
LOOP
FETCH c_cust into orderid, orderdate,shippeddate,shipname,shipcountry;

EXIT WHEN c_cust%notfound;
dbms_output.put_line(orderid  '          ' orderdate'          'shippeddate'          'shipnameshipcountry);
END LOOP;
CLOSE c_cust;
END;
OPEN c_cust;
LOOP
FETCH c_cust into orderid, orderdate,shippeddate,shipname,shipcountry;

EXIT WHEN c_cust%notfound;
dbms_output.put_line(orderid  '          ' orderdate'          'shippeddate'          'shipname||shipcountry);
END LOOP;
CLOSE c_cust;
END;




-- new Arjinder's version that is working and that I fixed






 CREATE OR REPLACE PROCEDURE p_lab9 
IS
orderid ORDERS.ORDERID%type;
orderdate ORDERS.ORDERDATE%type;
shippeddate ORDERS.SHIPPEDDATE%type;
shipname ORDERS.SHIPNAME%type;
shipcountry ORDERS.SHIPCOUNTRY%type;
CURSOR c_cust IS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME, SHIPCOUNTRY
FROM Lab9_View;


BEGIN
--dbms_output.put_line('Tadjiev Muhammad''s Lab 9'  chr(10));
OPEN c_cust;
LOOP
FETCH c_cust into orderid, orderdate,shippeddate,shipname,shipcountry;


EXIT WHEN c_cust%notfound;
dbms_output.put_line(orderid  || '          '||orderdate||'          '||shippeddate||'          '||shipname||shipcountry);
END LOOP;
CLOSE c_cust;
END;
 
 

-- The correct answers of LAB 9 and Week 11


--- Week 11 And LAB 9 Questions and answers

CREATE VIEW Lab9_View
AS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME AS "COMPANYNAME", SHIPCOUNTRY
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2019-08-14' AND '2019-08-23')
WITH READ ONLY;













-- To test we type 
SELECT * FROM Lab9_View;












CREATE OR REPLACE PROCEDURE p_lab9 IS
o_id orders.orderid%type;
o_date ORDERS.ORDERDATE%type;
o_ship VARCHAR(20);
c_name customers.COMPANYNAME%type;
c_country customers.country%type;

CURSOR cursor_lab9 IS
    SELECT ORDERID, ORDERDATE, NVL(SHIPPEDDATE, '    --    '),   RPAD(COMPANYNAME, 20, ' '), COUNTRY
FROM lab9_View 
ORDER BY COUNTRY;


BEGIN   
dbms_output.put_line('Tadjiev Muhammad''s Lab 9 - Orders by Country Aug. 14th-23rd' || chr(10));
dbms_output.put_line('  # ' ||  '    '  ||   ' Order Date ' ||  '   ' || ' Ship Date ' 
|| '   ' || '    Comnpany'  || '          Country' || chr(10) );


OPEN cursor_lab9;
LOOP
FETCH cursor_lab9 into o_id, o_date, o_ship, c_name, c_country;
 EXIT WHEN cursor_lab9%notfound;
 dbms_output.put_line( o_id || '  ' || o_date || '   ' || o_ship || '   '
 || c_name || '    '  || c_country);

  END LOOP;
 CLOSE cursor_lab9;
END;

BEGIN p_lab9; END