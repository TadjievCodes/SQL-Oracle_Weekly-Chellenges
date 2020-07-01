

-- Week 8 Examples

INSERT INTO Employees (Id, FirstName, LastName, City, Province, StreetAddress, PostalCode, AreaCode, PhoneNumber, BirthDate)
VALUES (610, 'Ron', 'McLean', 'Oakville', 'ON', '231 Maple Ave', 'L4X-1L9', '289', '555-1551', '1960-04-12');









-- LAB 6 Questions

--- 1. Determine the last used employee Id

SELECT MAX (Id) AS LastUsed
FROM orders;





--- 2. Create a new SEQUENCE for the Employees table. Have the new sequence start at the next available multiple of 5 and increment by 5’s


