-- Practice week 1

SELECT * FROM customers;

SELECT id,city FROM customers;


SELECT DISTINCT province, 'Evan Laursen'
FROM vendors;

 
--- Double Pipe String Concatenation        (Done via Oracle Database but we're using standard SQL)

SELECT firstname || ', ' ||  lastname AS "Full Name"
FROM customers;

-- If there's no space in the value of AS Alias then no need for the string ""

SELECT firstname || ', ' ||  lastname AS FullName
FROM customers;

-- Complex example where we display nam, retailprice, TAX and the Full Price on one row

SELECT name, retailprice, retailprice * .13  AS Tax, retailprice * 1.13 AS "Full Price"
FROM products;








--Question 1)

/*
Return all vendor names aliased as Vendor, streetaddress + city + province + postal code aliased as Vendor Address for all vendors. 
Sort by the city within province with the city name in descending order and the province code in ascending order, 
the start of the output should look like this:
*/



SELECT name AS Vendor, streetaddress || ', ' ||  city  || ', ' ||  province  || ', ' ||  postalcode AS "Vendor Address" FROM vendors ORDER BY province, city DESC, province ASC;
-- Correct



--Question 2)
/*
Return the name with an alias of Product Name, category id aliased as Category, retail price aliased as MSRP, tax (13% of price), 
and full price (retail price + tax) aliased as Full Price for all products. Sort on price lowest to highest by category
 highest to lowest and use the ordinal position not column names to do the sorting (again only the start of the output is shown):
*/


SELECT name AS "Product Name", categoryid AS Category, retailprice AS MSRP, retailprice * .13 AS Tax, retailprice + (retailprice * .13) AS "Full Price" FROM products ORDER BY 2 DESC, 3;



--Question 3)

/*
Create a single column list labelled: Provincial Codes for Customers, and sort the list alphabetically:
*/

SELECT DISTINCT province AS "Provincial Codes For Cutomers" FROM customers ORDER BY province ASC;

-- Distinct lets us return only the 6 values without repeating ON, BC n other Province codes




--Question 4)

/*

*/



SELECT name AS "Our Vendors", city AS"Vendor City", province AS "PROVINCE"  FROM vendors ORDER BY name, province, city DESC;


