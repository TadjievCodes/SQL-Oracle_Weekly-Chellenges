--- DML - Data Manipulation Language - the subset of the SQL programming language that deals with CRUD operations.



--An update statement for specific rows:

UPDATE <table> SET <column> = <value> WHERE <condition>;
--Examples:

UPDATE users SET password = "thisisabadidea" WHERE id = 3;
UPDATE blog_posts SET view_count = 1923 WHERE title = "SQL is Awesome";
Update multiple columns for specific rows:

UPDATE <table> SET <column 1> = <value 1>, <column 2> = <value 2> WHERE <condition>;
--Examples:

UPDATE users SET entry_url = "/home", last_login = "2016-01-05" WHERE id = 329;
UPDATE products SET status = "SOLD OUT", availability = "In 1 Week" WHERE stock_count = 0;






-- To delete specific rows from a table:

DELETE FROM <table> WHERE <condition>;
-- Examples:

DELETE FROM users WHERE email = "andrew@teamtreehouse.com";
DELETE FROM movies WHERE genre = "Musical";
DELETE FROM products WHERE stock_count = 0;






-- We've removed the reviews section from our website. Please remove all reviews.


DELETE FROM reviews;


-- Remove actors with the first name "Yuri", "Walter" and "Victor".

---SELECT * FROM actors WHERE name LIKE "Yuri%" OR name LIKE "Walter%" OR name LIKE "Victor%";

DELETE FROM actors WHERE name LIKE "Yuri%" OR name LIKE "Walter%" OR name LIKE "Victor%";



-- Remove all Sci Fi movies.

DELETE FROM movies
WHERE genre = 'Sci Fi';


