CREATE OR REPLACE PACKAGE practicum2_pkg AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type);
FUNCTION get_cust_name (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_agv_order_amount (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
END practicum2_pkg;

----------------------------

CREATE OR REPLACE PACKAGE practicum2_pkg AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type);
FUNCTION get_cust_name (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_agv_order_amount (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_agv_company (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_number_orders (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
END practicum2_pkg;

----------------------------
CREATE OR REPLACE PACKAGE BODY practicum2_pkg AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type) IS
o_id NUMBER(22,0);
o_date date;
o_status varchar2(20);
o_total NUMBER(20,2);
real_date DATE := sysdate;
CURSOR c_cursor IS
SELECT o.orderid, o.orderDate, NVL2(o.shippeddate, 'shipped   ', 'not shipped'), o.shipvia
 from orders o;
BEGIN
dbms_output.put_line('Statistics for ' || ' ' || real_date || ' - Tadjiev Muhammad' || CHR(10));
dbms_output.put_line('Order #' || '       ' || 'Date' || '       ' || 'Status' || '       ' || 'Order Total' || CHR(10));
OPEN c_cursor;
LOOP
FETCH c_cursor INTO o_id, o_date, o_status, o_total;
EXIT WHEN c_cursor%notfound;
dbms_output.put_line(o_id || '       ' || o_date || '       ' || o_status || '       '|| o_total || CHR(10));
END LOOP;
CLOSE c_cursor;
END; 

FUNCTION get_cust_name (cust_in IN customers.CustomerId%type)
RETURN VARCHAR2 IS 
cust_name VARCHAR2(40);
BEGIN 
SELECT COMPANYNAME INTO cust_name FROM CUSTOMERS
WHERE  customers.CUSTOMERID = cust_in;
RETURN cust_name;
END;

FUNCTION get_agv_order_amount (cust_in IN customers.CustomerId%type)
RETURN VARCHAR2 IS
agv_order VARCHAR2(20);
BEGIN
agv_order := 'hey';
RETURN agv_order;
END;

END practicum2_pkg;

select * from user_errors


begin
practicum2_pkg.p_get_orders_for_cust('ERNSH');
end;







---------------------------------------------
=============================================
---------------------------------------------

CREATE OR REPLACE PACKAGE practicum2_pkg AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type);
FUNCTION get_cust_name (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_agv_order_amount (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_agv_company (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_number_orders (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
END practicum2_pkg;

CREATE OR REPLACE PACKAGE BODY practicum2_pkg AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type) IS
o_id NUMBER(22,0);
o_date orders.orderDate%type;
o_status VARCHAR2(15);
od_total VARCHAR2(20);
real_date date;
CURSOR c_cursor IS
SELECT o.orderId, o.orderDate, NVL2(o.shippeddate, 'shipped', 'not shipped'), SUM((od.unitprice * od.quantity) * (1-od.discount)) FROM orders o
INNER JOIN orderDetails od ON o.orderid = od.orderid
WHERE cust_in = o.customerid
group BY o.orderId, o.orderDate;
BEGIN
SELECT TO_CHAR(sysdate, 'DD/MON/YYYY') into real_date FROM dual;
dbms_output.put_line('Statistics for ' || get_cust_name(cust_in) || ' ' || real_date || ' - Tadjiev Muhammad' || CHR(10) || CHR(10));
dbms_output.put_line('Order #' || '       ' || 'Date' || '       ' || 'Status' || '       ' || 'Order Total' || CHR(10) || CHR(10));
OPEN c_cursor;
LOOP
FETCH c_cursor into o_id, o_date, o_status, od_total;
EXIT WHEN c_cursor%notfound;
dbms_output.put_line(o_id || '       ' || o_date || '       ' || o_status || '       ' || '$' || od_total || CHR(10));
END LOOP;
CLOSE c_cursor;
dbms_output.put_line(CHR(10) || 'Avg. order amount for customer:    ' || get_agv_order_amount(cust_in) || CHR(10));
dbms_output.put_line(CHR(10) || 'Avg. order amount for company:     ' || get_agv_company(cust_in) || CHR(10));
dbms_output.put_line(CHR(10) || '# of orders for this customer:     ' || get_number_orders(cust_in));
END; 

FUNCTION get_cust_name (cust_in IN customers.CustomerId%type)
RETURN VARCHAR2 IS 
cust_name VARCHAR2(40);
BEGIN 
SELECT COMPANYNAME INTO cust_name FROM CUSTOMERS
WHERE cust_in = CUSTOMERID;
RETURN cust_name;
END;

FUNCTION get_agv_order_amount (cust_in IN customers.CustomerId%type)
RETURN VARCHAR2 IS
agv_order VARCHAR2(20);
BEGIN
SELECT TO_CHAR(AVG(SUM((od.unitprice * od.quantity) * (1-od.discount))), '$99,999.99') INTO agv_order FROM orderdetails od
INNER JOIN orders o ON o.orderid = od.orderid
WHERE cust_in = o.customerid
group by o.orderid;
RETURN agv_order;
END;

FUNCTION get_agv_company (cust_in IN customers.CustomerId%type)
RETURN VARCHAR2 IS
agv_order_company VARCHAR2(20);
BEGIN
SELECT TO_CHAR(AVG(SUM((od.unitprice * od.quantity) * (1-od.discount))), '$99,999.99') INTO agv_order_company FROM orderdetails od
INNER JOIN orders o ON o.orderid = od.orderid
INNER JOIN customers c on o.customerid = c.customerid
WHERE cust_in = o.customerid
group by c.companyname;
RETURN agv_order_company;
END;

FUNCTION get_number_orders (cust_in IN customers.CustomerId%type)
RETURN VARCHAR2 IS
number_orders VARCHAR2(5);
BEGIN
SELECT SUM(orders.orderId) INTO number_orders from orders
INNER JOIN customers ON customers.customerid = orders.customerid
group by customers.customerId;
RETURN number_orders;
END;

End;



begin
practicum2_pkg.p_get_orders_for_cust('LILAS');
end;



select * from user_errors


SELECT TO_CHAR(AVG(SUM((od.unitprice * od.quantity) * (1-od.discount))), '$99,999.99') FROM orderdetails od
INNER JOIN orders o ON o.orderid = od.orderid
WHERE 'LILAS' = o.customerid
group by o.orderid;

SELECT COMPANYNAME FROM CUSTOMERS
WHERE 'LILAS' = CUSTOMERID;