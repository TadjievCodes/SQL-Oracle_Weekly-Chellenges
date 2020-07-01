--- 1. Determine the last used employee Id

SELECT MAX (Id) AS LastUsed
FROM orders;





--- 2. Create a new SEQUENCE for the Employees table. Have the new sequence start at the next available multiple of 5 and increment by 5’s


