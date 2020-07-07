
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
