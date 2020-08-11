

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


-- Base the Sequence startinmg point on +1 from MAX

CREATE SEQUENCE orders_id_seq
INCREMENT BY 1
START WITH 501
NOCACHE
NOCYCLE;


-- To look at the metadata for the sequence we can use metadata from the system table user_sequences:

SELECT sequence_name, min_value, increment_by, last_number
 FROM user_sequences WHERE sequence_name = 'orders_id_seq';







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







-- LAB 6 Questions and Answers

--- 1. Determine the last used employee Id

SELECT MAX (Id) AS LastUsed
FROM Employees;

--(LAst used Id is 610 so far for now)



--- 2. Create a new SEQUENCE for the Employees table. Have the new sequence start at the next available multiple of 5 and increment by 5’s


CREATE SEQUENCE Employees_id_seq
INCREMENT BY 5
START WITH 610   -- Start with 610 as next multiple of 5 after 608 is 610
NOCACHE
NOCYCLE;


-- 3  Add a single SELECT statement to confirm the sequence exists by selecting it from the meta data table USER_SEQUENCES

SELECT sequence_name, min_value, increment_by, last_number
 FROM USER_SEQUENCES WHERE sequence_name = 'EMPLOYEES_ID_SEQ';




 /*
4. Add an INSERT statement to add a new employees to the employees table using the following data:
• Primary key - use the sequence’s next value
• First Name – Sidney
• Last Name – Crosby
• Street Address – 28 Hanbury Drive
• City – Cole Harbor
• Province – Nova Scotia
• Postal Code – B4R
• Area Code – 902,
• Phone – 555-1111
• Birth Date - 1987-08-07
 */

 INSERT INTO Employees (Id, FirstName, LastName, StreetAddress, City, Province, PostalCode, AreaCode, PhoneNumber, BirthDate)
VALUES (Employees_id_seq.nextval, 'Sidney', 'Crosby', '28 Hambury Drive', 'Cole Harbor', 'NS', 'B4R', '902', '555-1111', '1987-08-07');

`````````````````0`
`10

/* 5. 
Add another INSERT statement to add another employee using the following data:
• Primary key - use the sequence’s next value
• First Name – Ron • Last Name – McClean
• Street Address – 231 Maple Ave
• City – Oakville
• State - Ontario
• Postal Code – L4X-1L9
• Area Code – 289
• Phone – 555-1551
• Birth Date - 1960-04-12
*/

INSERT INTO Employees (Id, FirstName, LastName, StreetAddress, City, Province, PostalCode, AreaCode, PhoneNumber, BirthDate)
VALUES (Employees_id_seq.nextval, 'Ron', 'McLean', '231 Maple Ave', 'Oakville', 'ON', 'L4X-1L9', '289', '555-1551', '1960-04-12');




-- 6. Add a Select statement to the script to retrieve all data for the 2 new employees, plus your name (not mine) as a constant e.g.:


SELECT Id, FirstName, LastName, City, Province, StreetAddress, PostalCode, AreaCode, PhoneNumber, BirthDate, 'Tadjiev Muhammad'
FROM Employees WHERE Id > 608;




-- 7. Add a single Update statement to the script to update all of the new Employees so that both new employees postal code is (L4X-1L9)

   UPDATE Employees SET PostalCode = 'L4X-1L9' 
   WHERE Id > 608;


-- 8. Issue the same select as in step 6 again to show the new postal codes


SELECT Id, FirstName, LastName, City, Province, StreetAddress, PostalCode, AreaCode, PhoneNumber, BirthDate, 'Tadjiev Muhammad'
FROM Employees WHERE Id > 608;


-- 9. Add a single DELETE to the script to remove the 2 new employees

DELETE
FROM Employees
WHERE Id > 608;



-- 10. Issue a SELECT to dump out the remaining employees (should be 8 employees)

SELECT * FROM Employees;



-- 11. Add a drop to the script to remove the sequence created in step 2

DROP SEQUENCE Employees_id_seq;

-- AND IT WORKS FINE


-- 12. Repeat the code from the SELECT statement from step 3 showing the meta data again (should be empty)

SELECT sequence_name, min_value, increment_by, last_number
 FROM USER_SEQUENCES WHERE sequence_name = 'EMPLOYEES_ID_SEQ';

-- iT IS EMPTY NOW 


-- TO RESTART YOU SHOULD RELOAD THE SCRIPT'S DATA






