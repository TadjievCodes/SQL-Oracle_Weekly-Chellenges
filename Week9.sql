
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



-- INSTR returns integer number and the SUBSTR returns a string
-- mystery query with substr and instr


SELECT name,
           SUBSTR(name, 1, INSTR(name,',')-1) AS "Last",
           SUBSTR(name,
           INSTR(name, ',') +1,
           INSTR(name, ',', 1, 2) -INSTR(name,',')-1) AS "First"
FROM contacts;



-- LPAD and RPAD example


