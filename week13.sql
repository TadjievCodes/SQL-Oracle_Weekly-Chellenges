--sql//

-- Practicum Answers started week 13


CREATE OR REPLACE package BODY PRACTICUM_PKG AS

PROCEDURE p_get_orders_for_cust(cust_in IN customers.customerId%TYPE) IS
orderid orders.orderid%type;
orderdate varchar2(16);
shippeddate varchar2(18);
total_Amount varchar2(20);
cursor c_procedure is
SELECT DISTINCT orders.orderid,TO_CHAR(orderdate,'DD/MON/YYYY'),rpad(NVL2(shippeddate,'SHIPPED','Not Shipped'),15,' '),LPAD(to_char(( (SELECT sum(unitprice * quantity) - sum(unitprice * quantity * discount)
                    FROM orderdetails 
                    WHERE orderdetails.orderid=orders.orderid)), '$9,999.99')
  ,10,' ') FROM ORDERS

WHERE ORDERS.CUSTOMERID=CUST_IN
BEGIN
dbms_output.put_line('Statistics for 'PRACTICUM_PKG.get_cust_name(CUST_IN) ' ' SysDATE ' -'chr(10));
dbms_output.put_line('Order #''    ''Date'  '           ''Status''              ''Order Total'chr(10));
OPEN  C_PROCEDURE;
LOOP
FETCH C_PROCEDURE INTO ORDERID,ORDERDATE,SHIPPEDDATE,TOTAL_AMOUNT;
EXIT WHEN C_PROCEDURE%NOTFOUND;
dbms_output.put_line(OrderID'    'ORDERDATE  '     'SHIPPEDDATE'      'TOTAL_AMOUNTchr(10));
END LOOP;
DBMS_OUTPUT.PUT_LINE('Avg. order amount for customer :              ' PRACTICUM_PKG.GET_AVG_ORDER_AMOUNT(cust_in));

CLOSE C_PROCEDURE;
END; 


--// 
-- arjinder's answer as well still

--.sql-- 
CREATE OR REPLACE package BODY PRACTICUM_PKG AS

PROCEDURE p_get_orders_for_cust(cust_in IN customers.customerId%TYPE) IS
orderid orders.orderid%type;
orderdate varchar2(16);
shippeddate varchar2(18);
total_Amount varchar2(20);
cursor c_procedure is
SELECT DISTINCT orders.orderid,TO_CHAR(orderdate,'DD/MON/YYYY'),rpad(NVL2(shippeddate,'SHIPPED','Not Shipped'),15,' '),LPAD(to_char(( (SELECT sum(unitprice * quantity) - sum(unitprice * quantity * discount)
                    FROM orderdetails 
                    WHERE orderdetails.orderid=orders.orderid)), '$9,999.99')
  ,10,' ') FROM ORDERS
WHERE ORDERS.CUSTOMERID=CUST_IN
BEGIN
dbms_output.put_line('Statistics for 'PRACTICUM_PKG.get_cust_name(CUST_IN) ' ' SysDATE ' -'chr(10));
dbms_output.put_line('Order #''    ''Date'  '           ''Status''              ''Order Total'chr(10));
OPEN  C_PROCEDURE;
LOOP
FETCH C_PROCEDURE INTO ORDERID,ORDERDATE,SHIPPEDDATE,TOTAL_AMOUNT;
EXIT WHEN C_PROCEDURE%NOTFOUND;
dbms_output.put_line(OrderID'    'ORDERDATE  '     'SHIPPEDDATE'      'TOTAL_AMOUNTchr(10));
END LOOP;
DBMS_OUTPUT.PUT_LINE('Avg. order amount for customer :              ' PRACTICUM_PKG.GET_AVG_ORDER_AMOUNT(cust_in));

CLOSE C_PROCEDURE;
END; 

--//



/* Another Sergey's version for practicum   */


CREATE OR REPLACE PACKAGE BODY practicum2_pkg AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type) IS
o_id NUMBER(22,0);
o_date date;
o_status varchar2(20);
o_total NUMBER(20,2);
real_date DATE := sysdate;
CURSOR c_cursor IS
SELECT o.orderid, o.orderDate, NVL2(o.shippeddate, 'shipped   ', 'not shipped'), o.shipvia
 FROM orders o;
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


-- another version

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
SELECT TO_CHAR(sysdate, 'DD/MON/YYYY') INTO real_date FROM dual;
dbms_output.put_line('Statistics for ' || get_cust_name(cust_in) || ' ' || real_date || ' - Tadjiev Muhammad' || CHR(10) || CHR(10));
dbms_output.put_line('Order #' || '       ' || 'Date' || '       ' || 'Status' || '       ' || 'Order Total' || CHR(10) || CHR(10));
OPEN c_cursor;
LOOP
FETCH c_cursor INTO o_id, o_date, o_status, od_total;
EXIT WHEN c_cursor%notfound;
dbms_output.put_line(o_id || '       ' || o_date || '       ' || o_status || '       ' || '$' || od_total || CHR(10));
END LOOP;
CLOSE c_cursor;
dbms_output.put_line(CHR(10) || 'Avg. order amount for customer:    ' || get_agv_order_amount(cust_in) || CHR(10));
dbms_output.put_line(CHR(10) || 'Avg. order amount for company:     ' || get_agv_company(cust_in) || CHR(10));
dbms_output.put_line(CHR(10) || '# of orders for this customer:     ' || get_number_orders(cust_in));
END; 







-- Practicun start

-- Initial speciifcation
-- Correct version Practicum

CREATE OR REPLACE package PRACTICUM_PKG AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.CustomerId%type);
FUNCTION get_cust_name (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
FUNCTION get_agv_order_amount (cust_in IN customers.CustomerId%type) RETURN VARCHAR2;
END PRACTICUM_PKG;


 


-- Body of package and procedure

CREATE OR REPLACE package BODY PRACTICUM_PKG AS
PROCEDURE p_get_orders_for_cust(cust_in IN customers.customerId%TYPE) IS
orderid orders.orderid%type;
orderdate varchar2(20);
shippeddate varchar2(30);
total_Amount varchar2(20);
cursor c_procedure is
SELECT orders.orderid,TO_CHAR(orderdate,'DD/MON/YYYY'),rpad(NVL2(shippeddate,'SHIPPED','Not Shipped'),15,' '),LPAD(to_char(( SELECT sum(unitprice * quantity * discount)
              FROM orderdetails 
              WHERE orderdetails.orderid=orders.orderid)), '$9,999.99')
  ,10,' ') FROM ORDERS
WHERE ORDERS.CUSTOMERID=CUST_IN
ORDER BY 4 DESC;

BEGIN
dbms_output.put_line('Statistics for '||PRACTICUM_PKG.get_cust_name(CUST_IN) ||' ' ||Sysdate ||' - Tadjiev Muhammad'||chr(10));
dbms_output.put_line('Order #'||'    '||'Date' || '           '||'Status'||'              '||'Order Total'||chr(10));

OPEN  C_PROCEDURE;
LOOP
FETCH C_PROCEDURE INTO ORDERID,ORDERDATE,SHIPPEDDATE,TOTAL_AMOUNT;
EXIT WHEN C_PROCEDURE%NOTFOUND;
dbms_output.put_line(OrderID||'    '||ORDERDATE || '     '||SHIPPEDDATE||'      '||TOTAL_AMOUNT||chr(10));
END LOOP;

DBMS_OUTPUT.PUT_LINE('Avg. order amount for customer :              '|| PRACTICUM_PKG.GET_AVG_ORDER_AMOUNT(cust_in));
CLOSE C_PROCEDURE;
END;


-- 2 Functions part

FUNCTION get_cust_name(cust_in IN customers.customerId%TYPE) 
RETURN VARCHAR2 IS
COMPANYNAME CUSTOMERS.COMPANYNAME%TYPE;
BEGIN
SELECT COMPANYNAME INTO COMPANYNAME FROM CUSTOMERS INNER JOIN ORDERS ON CUSTOMERS.CUSTOMERID=ORDERS.CUSTOMERID
WHERE customers.CUSTOMERID=CUST_IN;
RETURN COMPANYNAME;
END;

FUNCTION get_avg_order_amount(cust_in IN customers.customerId%type)
RETURN VARCHAR2 IS
ave VARCHAR2(50);
BEGIN
    SELECT to_char(avg( (SELECT sum(unitprice * quantity) - sum(unitprice * quantity * discount)
                    FROM orderdetails 
                    WHERE orderdetails.orderid=orders.orderid)), '$9,999.99')
        INTO ave
        FROM orders
        WHERE customerid=cust_in;

        RETURN ave;
    END;

-- Ending the Body of the package here
END PRACTICUM_PKG;





-- tHIS PART REQUIRED TO RUN TO GET ALL THE DATA
begin
PRACTICUM_PKG.p_get_orders_for_cust('ERNSH');
end;

