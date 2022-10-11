-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2

SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM actor
WHERE last_name = 'Wahlberg'
GROUP BY last_name;

-- 2. How many payments were made between $3.99 and $5.99?
-- 3273

SELECT COUNT(*) AS "# of Payments"
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- film_id # 200  Curtain Videotape

-- searching for film with highest inventory count
SELECT film_id AS "Film ID", COUNT(*) AS "Film Inventory"
FROM inventory
GROUP BY film_id 
ORDER BY COUNT(*) DESC;

-- searching by film id for title of film w/ most inventory
SELECT title AS "Title"
FROM film
WHERE film_id = 200;


-- 4. How many customers have the last name ‘William’?
-- NO DATA -- test cases 

SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM customer 
WHERE last_name = 'William'
GROUP BY last_name;

-- test cases "Williams - 1" "Smith -1"
SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM customer 
WHERE last_name = 'Williams'
GROUP BY last_name;

SELECT last_name AS "Last Name", COUNT(last_name) AS "Count"
FROM customer 
WHERE last_name = 'Smith'
GROUP BY last_name;

-- 5. What store employee (get the id) sold the most rentals?
-- 1 Mike Hillyer  sold the most 8040  Jon Stephens sold 8004

SELECT staff_id AS "ID #", COUNT(*) AS "# Rented"
FROM rental
GROUP BY staff_id;

SELECT first_name AS "First Name", last_name AS "Last Name"
FROM staff
WHERE staff_id = 1;

SELECT first_name AS "First Name", last_name AS "Last Name"
FROM staff
WHERE staff_id = 2;

-- 6. How many different district names are there?
-- 378

SELECT COUNT(DISTINCT district) AS "# of Districts"
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- film_id 508 Lambs Cincinatti had 16 actors

--searching for film id with most actors
SELECT film_id AS "Film ID", COUNT(actor_id) "# of Actors"
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;


--searching by film id for film title with most actors
SELECT film_id As "Film Id", title AS "Film Title"
FROM film
WHERE film_id = 508;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- 21 customers with last name -'es'

-- with number of names
SELECT COUNT(last_name) AS "# of Customers"
FROM customer
WHERE last_name LIKE '%es';

-- with names printed
SELECT last_name, COUNT(*) AS "# of Customers"
FROM customer
WHERE last_name LIKE '%es'
GROUP BY last_name;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for 
--    customers with ids between 380 and 430? (use group by and having > 250)
-- 3 payment amount have more than 250 rentals w/ customers w/ ids 380-430

SELECT COUNT(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*)>250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
--  5 categories most PG-13: 223

SELECT rating AS "Movie Rating", COUNT(*) AS "Count"
FROM film
GROUP BY rating
ORDER by COUNT(*) DESC;

SELECT COUNT(DISTINCT rating) AS "# Categories"
FROM film;

SELECT rating AS "Movie Rating", COUNT(*) "# of Movies"
FROM film
WHERE rating = 'PG-13'
GROUP BY rating;



