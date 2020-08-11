--.sql//

-- Practicum Answers started


CREATE OR REPLACE package BODY practicum_pkg AS

PROCEDURE p_get_orders_for_cust(cust_in IN customers.customerId%TYPE) IS
orderid orders.orderid%type;
orderdate varchar2(16);
shippeddate varchar2(18);
total_Amount varchar2(20);
cursor c_procedure is
select DISTINCT orders.orderid,TO_CHAR(orderdate,'DD/MON/YYYY'),rpad(NVL2(shippeddate,'SHIPPED','Not Shipped'),15,' '),LPAD(to_char(( (select sum(unitprice * quantity) - sum(unitprice * quantity * discount)
                    from orderdetails 
                    where orderdetails.orderid=orders.orderid)), '$9,999.99')
  ,10,' ') FROM ORDERS
WHERE ORDERS.CUSTOMERID=CUST_IN
BEGIN
dbms_output.put_line('Statistics for 'practicum_pkg.get_cust_name(CUST_IN) ' ' SysDATE ' -'chr(10));
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
