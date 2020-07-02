

-- Week 8 Examples





INSERT INTO Customers (FirstName, LastName, StreetAddress,
City, Province, PostalCode, AreaCode, PhoneNumber)
VALUES ('Tom', 'Williams', '127 River Drive',
'Vancouver', 'BC', 'V5J-1A1', 604, '555-2981');

/*
Notice there is no PK or value for it specified. When the primary key is artificial (data is not pertinent to the entity), and is only used to make the row unique we let the database generate the key for us. Microsoft uses the term AutoNumber in Access and Identity in
SQL Server, MySQL uses Auto_Increment. All of these types make this construct a part of the table itself. So if we drop the table the auto generation capability is also removed.
Oracle, however, takes a different approach to generate key values by using a database object called a SEQUENCE. The sequence stands on its own and is not part of any table. Sequences are used for:
• Internal control purposes by providing sequential integers for auditing
• Generating unique value for primary key columns.
You create a sequence by:
• Using the CREATE SEQUENCE command
• Various intervals are allowed – Default: 1
• You can specify the starting number – Default: 1
• Can specify MINVALUE for decreasing sequence and MAXVALUE for increasing sequence
• Numbers can be reused if CYCLE is specified
• ORDER clause is used in application cluster environment
• Use CACHE to pre-generate integers – Default: 20

*/











INSERT INTO Employees (Id, FirstName, LastName, City, Province, StreetAddress, PostalCode, AreaCode, PhoneNumber, BirthDate)
VALUES (610, 'Ron', 'McLean', 'Oakville', 'ON', '231 Maple Ave', 'L4X-1L9', '289', '555-1551', '1960-04-12');




-- Update multiple columns on one row
UPDATE Employees
SET province = 'MN', City = 'Brandon',
  PostalCode = 'R7A-101', AreaCode = '204', PhoneNumber = '555-5552'
  WHERE Id  = 609;
  

  -- To check if it exists there we type

  SELECT * FROM Employees 
WHERE Id = 609;




-- Update one column on multiple rows

UPDATE Employees  SET province = 'ON' WHERE Id > 608;
   
SELECT * FROM Employees 
WHERE Id = 608;






-- one last set, multiple columns, multiple rows 

UPDATE Employees SET Province = 'BC', City = 'Vancouver'
  Where Id > 608;








-- common newbie mistake to delete new rows, So this is a wrong way kind of

DELETE * 
FROM Employees
WHERE Id > 608; 



-- The correct syntax would be without the asterisk * 

DELETE
FROM Employees
WHERE Id > 608;














-- LAB 6 Questions

--- 1. Determine the last used employee Id

SELECT MAX (Id) AS LastUsed
FROM orders;





--- 2. Create a new SEQUENCE for the Employees table. Have the new sequence start at the next available multiple of 5 and increment by 5’s


