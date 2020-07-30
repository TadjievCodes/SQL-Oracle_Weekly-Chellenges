-- Practtice exercises

CREATE OR REPLACE FUNCTION CustOrders
RETURN NUMBER IS
      custid NUMBER(4,0) := 1001; -- HARDCORE FOR NOW iniatialised for 1001
      order_total NUMBER(4,0) :=0;
BEGIN 
     SELECT COUNT(o.Id) INTO order_total
     FROM customers c INNER JOIN orders o
          ON c.Id = o.customerId
     WHERE c.Id = custid;
     RETURN order_total;
     END;            
























-- Week  12 LAB questions and answers

--====================================================================================================================

CREATE OR REPLACE PROCEDURE pTopProductForMonth(okok IN VARCHAR2) IS 
vari NUMBER(2,0) := 0;
ans NUMBER(4,0) := 0;
BEGIN

CASE
WHEN lower(okok) = 'january' THEN vari := 1;
WHEN lower(okok) = 'february' THEN vari := 2;
WHEN lower(okok) = 'march' THEN vari := 3;
WHEN lower(okok) = 'april' THEN vari := 4;
WHEN lower(okok) = 'may' THEN vari := 5;
WHEN lower(okok) = 'june' THEN vari := 6;
WHEN lower(okok) = 'july' THEN vari := 7;
WHEN lower(okok) = 'august' THEN vari := 8;
WHEN lower(okok) = 'september' THEN vari := 9;
WHEN lower(okok) = 'october' THEN vari := 10;
WHEN lower(okok) = 'november' THEN vari := 11;
WHEN lower(okok) = 'december' THEN vari := 12;
ELSE vari := 0;
END CASE;
 


IF vari != 0 THEN
ans := HP_Function(vari);
dbms_output.put_line('Lab 10 - Helly Patel');
dbms_output.put_line('The top product for '|| okok ||' is product - '|| ans || CHR(10) );
ELSE
dbms_output.put_line('Invalid month entered');
END IF;
END;








--***************************8888888888888

CREATE OR REPLACE FUNCTION HP_FUNCTION (monthNum IN NUMBER)
RETURN NUMBER IS
answer NUMBER(4,0) := 0;
BEGIN 
SELECT DISTINCT ORDER_DETAILS.PRODUCTID INTO answer 
FROM ORDER_DETAILS 
WHERE (ORDER_DETAILS.QUOTEDPRICE * ORDER_DETAILS.QTYORDERED) = (SELECT MAX(ORDER_DETAILS.QUOTEDPRICE * ORDER_DETAILS.QTYORDERED) 
FROM ORDER_DETAILS INNER JOIN ORDERS ON ORDER_DETAILS.ORDERID = ORDERS.ID  WHERE EXTRACT(MONTH FROM ORDERS.ORDERDATE) = monthNum);
RETURN answer;
END;
