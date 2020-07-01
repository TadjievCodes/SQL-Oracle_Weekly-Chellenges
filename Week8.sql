

-- Week 8 Examples

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


