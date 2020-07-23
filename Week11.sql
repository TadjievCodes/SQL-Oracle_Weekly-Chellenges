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
FROM customers WHERE orders.shipdate = '2019-10-27';












--- Week 11 And LAB 9 Questions and answers

CREATE VIEW Lab9_View
AS
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, SHIPNAME AS "COMPANYNAME" 
FROM ORDERS 
WHERE ORDERDATE IN (SELECT ORDERDATE FROM ORDERS WHERE ORDERDATE BETWEEN '2019-08-14' AND '2019-08-23')
WITH READ ONLY;










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
dbms_output.put_line('Helly Patel''s Lab 9' || chr(10));
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
dbms_output.put_line('Helly Patel''s Lab 9' || chr(10));
dbms_output.put_line(' # ' || '          ' || ' Order Date ' || '          '||' Ship Date '||'          '|| ' Company ' ||chr(10));

OPEN c_cust;
LOOP
FETCH c_cust into o_id, o_date,s_date,company;

EXIT WHEN c_cust%notfound;
dbms_output.put_line(o_id || '          ' ||o_date||'          '||s_date||'          '||company);
END LOOP;
CLOSE c_cust;
END;

