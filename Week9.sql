
-- Synonyms for specifically to create the copy let's say for order_id_seq sequence that we created in the earlier week

CREATE SYNONYM OrderID
FOR order_id_seq;




-- test out the synonym

SELECT OrderID.nextval FROM dual;


-- Ansi outer join using left syntax

SELECT p.id, Name, od.OrderID FROM Products p  
LEFT OUTER JOIN Order_Details od 
ON p.Id = od.ProductId
WHERE Od.OrderID is NULL;



-- Miscellaneous string function 
-- the lower function

SELECT LOWER(lastname), LOWER(FirstName)
FROM Customers WHERE LastName = 'Perkins';




-- the upper function

SELECT UPPER(lastname), UPPER(FirstName)
FROM Customers WHERE LastName = 'Perkins';


-- TEST WITH forced uppercase
-- SO WERE IMMEDIATELY TYPING UPPERCASE LETTERS
SELECT * FROM  Employees WHERE UPPER(lastname) = 'JAMES';


-- AND THE OPPOSITE

SELECT * FROM  Employees WHERE LOWER(lastname) = 'james';






-- ctreating a table for practice

CREATE table Contacts (name VARCHAR2(40));

INSERT INTO contacts 
VALUES ('LAM, MIKE, 416-384-3493');


INSERT INTO contacts 
VALUES ('Harvey, Annette, 905-868-2739');



INSERT INTO contacts 
VALUES ('Cobb, Ben, 416-239-3638');



-- SUBSTR function - string -start -length

SELECT DISTINCT postalcode,
    SUBSTR(postalcode, 1, 3) AS "1st 3 bytes";
    SUBSTR(postalcode, -3, 3) AS "last 3 bytes"
FROM customers;


-- INSTR FUNCTION
-- (string, string to find, [start pos], [occurrence] 

SELECT name,
           INSTR(name, ',') AS "First comma pos.",
           INSTR(name, ',', 10) AS "First comma after 9th byte pos.",
           INSTR(name, ',', 1, 2) AS "2nd comma pos."
FROM contacts;


-- instr string to find
-- INSTR returns integer number and the SUBSTR returns a string
-- mystery query with substr and instr


SELECT name,
           SUBSTR(name, 1, INSTR(name,',')-1) AS "Last",
           SUBSTR(name,
           INSTR(name, ',') +1,
           INSTR(name, ',', 1, 2) -INSTR(name,',')-1) AS "First"
FROM contacts;



-- LPAD and RPAD example


SELECT FirstName, LPAD(FirstName,12,'*'), RPAD(FirstName, 12, '*') 
FROM Customers
WHERE FirstName like 'J%';


-- LTRIm string on the left

SELECT name, streetaddress, LTRIM(streetaddress, 'PO ') AS "BOX"
FROM vendors
WHERE streetaddress LIKE 'PO %';


-- Replace (string with old string or a new string) > 1 byte
-- Replace is useful when you're using more than one byte

SELECT streetaddress,
     REPLACE(streetaddress, 'PO ', 'Post Office ') AS PO
     FROM vendors
     WHERE streetaddress LIKE 'PO %';



-- IF you're using only one byte then there's a better method to do that
-- use Translate for 1 byte string replacement


SELECT name, TRANSLATE(name, ',', '-') AS "No Comma"
FROM Contacts;


-- USE concat as an alternative for || the pipe we used before

SELECT LastName, CONCAT('Customer # ', Id) 
AS "Number"
FROM customers 
WHERE Id BETWEEN 1000 AND 1005; 



-- Length returns an integer number of the length of the string

SELECT lastname, LENGTH(lastname) AS "# of chars in lastname"
FROM employees;


-- Find Employees born in OCTOBER

SELECT FirstName, lastname, birhtdate
FROM employees
WHERE EXTRACT(Month FROM birthdate) = 10;











-- LAB 7 Started for Week 9 Database
-- QUESTION 1
-- Need to use let outer join
/*
Return the CompanyName (customers table) aliased as Customer, 
PostalCode with any space replaced the most efficient way with a hyphen 
(customers table) aliased as Postal Code and OrderId (orders table) aliased as Order #, 
for customers from South America (Argentina, Brazil, Venezula). 
If a customer has not made an order, still include the name and postal code in your list. Sort on the OrderId highest to lowest:
*/


SELECT C.CompanyName AS Customer, TRANSLATE(C.PostalCode, ' ', '-') AS "Postal Code",
O.ORDERID AS "Order #"
FROM Customers C
      LEFT OUTER JOIN ORDERS O
      ON C.customerid = O.customerid
      WHERE (O.ORDERID IS NULL OR O.ORDERID IS NOT NULL) AND C.COUNTRY IN ('Argentina', 'Brazil', 'Venezula')
ORDER BY O.ORDERID DESC;






-- QUESTION 2
/*
Return CompanyName as Company (suppliers table) truncated to 20 characters,
 if the name is less than 20 characters embed a period for each space. 
 Return ProductName (products table) as Product truncated to 15 characters, 
 if the product name is less than 15 characters embed a space. Return product price expanded to 7 characters as Padded Price,
  if the product price is less than 7 characters embed leading asterisks for each missing character. 
  Also, only select prices where the total length of the price is more than 3 characters (including decimals). 
  Sort on price highest to lowest. A partial listing is shown:
*/



SELECT RPAD(SUBSTR(s.CompanyName,1,20), 20, '.') AS Company, 
RPAD(SUBSTR(p.ProductName,1,15), 15, ' ') AS Product, 
LPAD(SUBSTR(p.UNITPRICE,1,7), 7, '*') AS "Padded price" FROM suppliers s
LEFT OUTER JOIN Products p ON s.supplierid = p.supplierid
WHERE LENGTH(p.UNITPRICE) >= 3
ORDER BY p.UNITPRICE DESC;







-- QUESTION 3
/*
Return the company name, and a field called "Area Code" for all customers who have a phone number where there is an area code contained in parenthesis.
 The area code field is only to contain the area code part of the phone # not the entire phone #. 
 Sort this one by area code. Hint: you'll need to use both the SUBSTR, and INSTR functions to get this one, 
 and the “Area Code” column should include the parenthesis and have a data format of (###), a partial listing is shown:



*/


SELECT CompanyName, SUBSTR(Phone,
INSTR(Phone,'('), INSTR(Phone,')')) AS "Area Code" FROM Customers WHERE Phone LIKE '(%'
ORDER BY Phone DESC;









-- QUESTION 4
/*
4. Return all of the contact names, and contact titles for all customers whose contact title has “Sales” as the 2nd word of the title, the following examples are in the current data:
o Associate Sales Assistant – should be returned
o Associate Salesmanager – should not be returned
o Manager Sales – should be returned
o Assistant to Sales Manager – should not be returned
*/



SELECT contactname, contacttitle FROM customers
WHERE SUBSTR(contacttitle,
              INSTR(contacttitle, ' ', 1, 1) + 1,
              INSTR(contacttitle, ' ', 1, 2) - INSTR(contacttitle, ' ', 1, 1) - 1) = 'Sales'
OR SUBSTR(contacttitle,
              INSTR(contacttitle, ' ', 1, 1) + 1,
              6) = 'Sales';













