-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor 
WHERE last_name like 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(payment_id) 
FROM payment 
WHERE amount BETWEEN 3.99 AND 5.99;


--3. What film does the store have the most of? (search in inventory)
SELECT COUNT(film_id), film_id 
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC
LIMIT 1;


--4. How many customers have the last name ‘William’?
SELECT COUNT(customer_id) FROM customer WHERE last_name like 'William';
SELECT COUNT(customer_id) FROM customer WHERE last_name like 'Williams';


--5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC
LIMIT 1;


--6. How many different district names are there?
SELECT COUNT(DISTINCT district) FROM address;


--7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC
LIMIT 1;


--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(customer_id)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT customer_id, sum(amount) 
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY customer_id
HAVING sum(amount) > 250;

--10a. Within the film table, how many rating categories are there? 
SELECT DISTINCT rating FROM film


--10b. And what rating has the most movies total?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC
LIMIT 1
