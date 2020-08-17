

-- Practicun start LAst version


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
SELECT orders.orderid,TO_CHAR (orderdate,'DD/MON/YYYY'),rpad(NVL2(shippeddate,'SHIPPED','Not Shipped'),15,' '),LPAD(to_char(( SELECT sum(unitprice * quantity * discount)
              FROM orderdetails 
              WHERE orderdetails.orderid=orders.orderid)), '$9,999.99')
  ,10,' ') 
  FROM ORDERS
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

