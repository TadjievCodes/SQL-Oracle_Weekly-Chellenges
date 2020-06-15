
-- Examples of Week 2

SELECT firstname, lastname FROM customers WHERE lastname = 'Peterson';


SELECT * FROM customers;


-- Notice 'AB' inside the single quotes in uppercase letters as string data is case sensitive in SQL plus mostly use '' single quotes as a rule of thumb
SELECT firstname, lastname, province FROM customers WHERE province = 'AB';














--1. Find all customer names (create a concatenated field for alias Customer Name as seen below), street address aliased as Address, city and province for customers that live on a street that ends with the word Ave and whose last name has the letter e as the 2nd character and also ends in the letter s. 

--2. List products that end in the word ‘RH’ or ‘LH’ and whose product Id is less than the value of the ‘QtyOnHand’ field. Sort this list by QtyOnHand lowest to highest: 

--3. Without using the logical operator OR, list all vendors from Ontario, Alberta and BC who are not in the 416 and 780 area codes. Also, sort this list by city within province: 

--4. List all orders created in the last full week of September 2019 (September 22nd – September 28th inclusive), that were sold either by employee 604, employee 606 or employee 608 and sort it by employee Id (partial list only shown) 

--Question 1)

SELECT id AS ID, firstname || ', ' ||  lastname AS "Customer Name", streetaddress AS "Address", city AS "City", province AS "Province" FROM customers WHERE streetaddress LIKE '%Ave' AND lastname LIKE '_e%s';
SELECT id AS ID, firstname || ', ' ||  lastname AS "Customer Name", streetaddress AS "Address", city AS "City", province AS "Province" FROM customers WHERE streetaddress LIKE '%Ave' AND firstname LIKE '_e%s';

-- Correct FULLY and ending with “s” works as well plus 2nd character as “e”
-- Question 2)

SELECT Id, Name, Description, RetailPrice, QtyOnHand, CategoryId
FROM products
WHERE (Name LIKE '%RH' OR Name LIKE '%LH') AND Id < QtyOnHand
ORDER BY QtyOnHand ASC;


--Question 3)

SELECT *
FROM Vendors
WHERE Province IN ('ON', 'AB', 'BC') AND phonenumber NOT LIKE '(780)%' AND phonenumber NOT LIKE '(416)%'
ORDER BY province, city;


--Question 4)

SELECT * FROM orders WHERE EMPLOYEEID IN (604,606,608) AND orderdate BETWEEN '2019-09-22' AND '2019-09-28';


