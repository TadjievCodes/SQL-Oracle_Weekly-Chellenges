-- SELECT <columns> FROM <table1> INNER JOIN <table2> ON <equality criteria> WHERE <search criteria> ...

-- What are all Chevy models?
--Example 1: 
--INNER JOIN
SELECT mk.makename, md.modelname 
FROM make AS mk
INNER JOIN model AS md ON mk.MakeID = md.MakeID
WHERE makename = "Chevy";



/*           
  Three Types of Outer Joins:
Left
Right
Full

In this video, we introduced three types of Outer Joins, but only showed examples of the Left Outer Join. 
This is because a few database engines, like SQLite, only support the Left Outer Join. Most other database systems support all three types.

Right Outer Joins are essentially the same thing as Left Outer Joins, but just specified in the opposite direction.

Full Outer Joins are functionally different in that you are guaranteed to get all rows from both tables. 
Full Outer Joins aren’t used as much in application or report coding as Inner and Left/Right Outer Joins, 
but can come in very handy when doing things like comparing data between two tables that are structurally similar.
 */

--LEFT OUTER JOIN
SELECT mk.makename, COUNT (md.modelname)  AS NumbeOfModels FROM make AS mk
LEFT OUTER JOIN model AS md ON mk.MakeID = md.MakeID
GROUP BY  mk.makename;

--A left outer join returns all data from the first -- or left -- table and only the data with matches in the second table.


-- Use a JOIN to select all patrons with outstanding books. Select their first name and email address.
-- CHALLENGE 1
SELECT first_name, email FROM patrons INNER JOIN loans ON patron_id WHERE returned_on IS NULL;

Select 
p.first_name, 
p.email,
l.book_id,
l.loaned_on,
l.returned_on
from patrons as p
inner join loans as l on l.patron_id = p.id
where l.returned_on is null;


-- CHALLENGE 2
-- Use a JOIN to find out which patrons haven't had any loans. Select their first name and email address.
select 
p.first_name, 
p.email,
l.book_id,
l.loaned_on,
l.return_by
from patrons as p
inner join loans as l on l.patron_id = p.id
where l.returned_on is not null group by p.email;

SELECT patrons.first_name, patrons.email FROM patrons LEFT JOIN loans ON patrons.id = loans.patron_id WHERE loans.id IS NULL;




-- CHALLENGE 3

-- Create a report that shows the title of the book, first and last name of the patron, email and all date fields of the loan.

SELECT b.title, p.first_name, p.last_name, p.email, l.loaned_on, l.return_by, l.returned_on 
FROM books AS b INNER JOIN loans AS l ON b.id = l.book_id INNER JOIN patrons AS p ON l.patron_id = p.id 
ORDER BY loaned_on DESC;

SELECT books.title
, patrons.first_name || ' ' || patrons.last_name AS full_name
, patrons.email
, loans.loaned_on, loans.return_by, loans.returned_on
FROM books
LEFT OUTER JOIN loans
ON loans.book_id = books.id
INNER JOIN patrons
ON patrons.id = loans.patron_id;


--From WEEK 3 material exercises ######################################################################################################################


-- The old way of counting the rows in the table with Cartesian method query
-- It basically joins the two tables and returns the data
-- But it's better to use SQL's INNER JOIN INSTEAD OF THE CARTESIAN QUERY
SELECT COUNT(*) AS "Cartesian" 
FROM products, categories;


-- CROSS JOIN IS ALMOST THE SAME AS CARTESIAN BUT IT'S JUST AN ORACLE SPECIFIC SYNTAX
SELECT COUNT(*) AS "Cartesian" 
FROM products CROSS JOIN categories;




-- And this is the new way of doing that without the Cartesian
SELECT COUNT(*) AS "# of products" FROM products;




-- This is the old way of joining the tables with the WHERE clause

SELECT categories.description AS "Category", name AS "Product"
FROM categories, products
WHERE categories.id = products.categoryid;



-- Now with Inner Joins doing the joins of the Tables

-- SELECTING CATEGORY'S ID AND CATEGORY'S DESCRIPTION, NAME AND INSTEAD OF WHERE USING ON
SELECT categories.id, categories.description, name
FROM categories 
INNER JOIN products
ON categories.id = products.categoryid;



-- Another one where we make it equal into 2
SELECT categories.id, categories.description, name
FROM categories 
INNER JOIN products
ON categories.id = products.categoryid
AND categories.id = 2;







--CORRECT WAY WITH TABLE ALIAS
SELECT c.id, c.description, name
FROM categories c 
INNER JOIN products p
ON c.id = p.categoryid;






SELECT c.id, c.description, name
FROM categories c 
                 INNER JOIN products p
ON c.id = p.categoryid
AND c.id = 2;






-- joining 4 tables requires 3 INNER JOINS
-- IF WERE adding 4 tables then why 3 inner joins as rule of thumb alwayas one lesser clause than the quantity of the tables

SELECT firstName, lastName, name
FROM customers c INNER JOIN orders o
ON c.id = o.customerid
INNER JOIN order_details od
ON o.id = od.orderid
INNER JOIN products p
ON od.productid = p.id;






-- SELF JOIN EXAMPLE

SELECT DISTINCT c1.firstname, c1.lastname 
FROM customers c1
INNER JOIN customers c2
ON c1.lastname = c2.lastname
AND c1.id != c2.id
ORDER BY 2;





-- Treehouse INNER JOIN challenge 1 answer
--In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
--For all cars in the database, show Model Name, VIN and Sticker Price in one result set.
SELECT modelname, vin, stickerprice 
FROM model AS m INNER JOIN car AS c 
ON m.modelid = c.modelid;

--challenge 2
--In a car database there is a Make table with columns, MakeID and MakeName, a Model table with columns, ModelID, MakeID and ModelName and 
--a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
--For all cars in the database, show Make Name, Model Name, VIN and Sticker Price from the Model and Car tables in one result set.
SELECT mk.MakeName, md.ModelName, ca.VIN, ca.StickerPrice
FROM Make mk
INNER JOIN Model md ON mk.MakeID = md.MakeID
INNER JOIN Car ca ON ca.ModelID = md.ModelID; 

--challenge3
--In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate. The database also has a SalesRep table with columns, SalesRepID, FirstName, LastName, SSN, PhoneNumber, StreetAddress, City, State and ZipCode.
--Show the First and Last Name of each sales rep along with SaleAmount from both the SalesRep and Sale tables in one result set.

SELECT firstname, lastname, saleamount
FROM sale sa
INNER JOIN salesRep AS sr 
ON sa.SalesRepID = sr.SalesRepID;


--challenge4
-- In a car database there is a Model table with columns, ModelID, MakeID and ModelName and a Car table with columns, CarID, ModelID, VIN, ModelYear and StickerPrice.
--Show all Model names from the Model table along with VIN from the Car table. Make sure models that aren’t in the Car table still show in the results!

SELECT m.modelname, c.vin 
FROM model AS m 
LEFT OUTER JOIN car AS c 
ON m.modelid = c.modelid;


--challenge5
-- In a car database there is a Sale table with columns, SaleID, CarID, CustomerID, LocationID, SalesRepID, SaleAmount and SaleDate. 
--The database also has a SalesRep table with columns, SalesRepID, FirstName, LastName, SSN, PhoneNumber, StreetAddress, City, State and ZipCode.
--Show all SaleDate, SaleAmount, and SalesRep First and Last name from Sale and SalesRep. Make sure that all Sales appear in results even if there 
--is no SalesRep associated to the sale.

SELECT SaleDate, SaleAmount, firstname, lastname
FROM sale sa
LEFT OUTER JOIN salesRep AS sr 
ON sa.SalesRepID = sr.SalesRepID;












-- Week 3 LAB
 
 -- Question 1

 -- 1. List the Customer Name (first and last concatenated) aliased as Customer Name, Ship Date, and Order Date for Order 451:

 -- Answer 1 

SELECT c.firstname || ', ' ||  c.lastname AS "Customer Name", o.orderdate, o.shipdate 
FROM customers c INNER JOIN orders o
ON o.customerid = c.id
AND o.id = 451;

-- Question 2

-- List all product names aliased as Product (only once per vendor) and the vendor’s name aliased as Vendor, 
-- who sells the product, sort by the product name (partial results shown)
-- Answer 2

SELECT DISTINCT p.Name AS "Product", v.Name AS "Vendor" 
FROM Products p 
INNER JOIN Product_Vendors pv ON p.Id = pv.ProductId
    INNER JOIN Vendors v ON pv.VendorId = v.Id
ORDER BY p.Name;


-- Question 3
--List the customer’s name, product name, retail price and discount amount (see aliases below) for all items on order 486,
-- that have been discounted (where quoted price is less than retail price)
-- Answer 3
-- Kinda correct but not fully correct Ask Wander or someone else or think about it

SELECT c.firstName, c.lastName, p.Name, p.RetailPrice, p.RetailPrice - od.QuotedPrice AS "Discounted Amt."
FROM Customers c
     INNER JOIN Orders o
   ON c.Id = o.CustomerId AND o.Id = 486
     INNER JOIN Order_Details od
   ON o.Id = od.OrderId
     INNER JOIN Products p
   ON od.ProductId = p.Id AND QuotedPrice < p.RetailPrice;




-- Question 4
--List the product name and vendor id for all products that we have purchased from more than one vendor, 
--sort this one on product name (Hint: you’ll need to use a Self-Join and an additional INNER JOIN to solve, see above for reference)
-- Don’t forget to remove any duplicates. Partial listing shown:
-- Answer 4

SELECT DISTINCT p.name AS product, v.id AS Vendorid
FROM products p 
     INNER JOIN product_vendors pv ON p.id = pv.productid
     INNER JOIN product_vendors pv2 ON pv.productid = pv2.productid AND pv.vendorid != pv2.vendorid 
     INNER JOIN vendors v ON v.id = pv.vendorid
ORDER BY p.name;

--OR could be also







