--Question 1)

SELECT name AS Vendor, streetaddress || ', ' ||  city  || ', ' ||  province  || ', ' ||  postalcode AS "Vendor Address" FROM vendors ORDER BY province, city DESC, province ASC;
-- Correct


--Question 2)

SELECT name AS "Product Name", categoryid AS Category, retailprice AS MSRP, retailprice * .13 AS Tax, retailprice + (retailprice * .13) AS "Full Price" FROM products ORDER BY 2 DESC, 3;



--Question 3) 

SELECT DISTINCT province AS "Provincial Codes For Cutomers" FROM customers ORDER BY province ASC;

 
-- Distinct lets us return only the 6 values without repeating ON, BC n other Province codes

--Question 4)


SELECT name AS "Our Vendors", city AS"Vendor City", province AS "PROVINCE"  FROM vendors ORDER BY name, province, city DESC;


