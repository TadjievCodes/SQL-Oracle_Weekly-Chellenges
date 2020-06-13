-- We've removed the reviews section from our website. Please remove all reviews.


DELETE FROM reviews;


-- Remove actors with the first name "Yuri", "Walter" and "Victor".

---SELECT * FROM actors WHERE name LIKE "Yuri%" OR name LIKE "Walter%" OR name LIKE "Victor%";

DELETE FROM actors WHERE name LIKE "Yuri%" OR name LIKE "Walter%" OR name LIKE "Victor%";



-- Remove all Sci Fi movies.

DELETE FROM movies
WHERE genre = 'Sci Fi';


