SELECT *
FROM actor

SELECT *
FROM address

SELECT *
FROM category

SELECT *
FROM city

SELECT *
FROM country

SELECT *
FROM customer

SELECT *
FROM film

SELECT *
FROM film_actor

SELECT *
FROM film_category

SELECT *
FROM inventory

SELECT *
FROM language

SELECT *
FROM payment

SELECT *
FROM rental

SELECT *
FROM staff

SELECT *
FROM store

-- 1. List all customers who live in Texas (use JOINs) 
SELECT customer.first_name, customer.last_name, address.district
FROM customer 
JOIN address ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.first_name, customer.last_name, payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries) 
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN(
    SELECT payment.customer_id
    FROM payment
    WHERE payment.amount > 175
);

-- 4. List all customers that live in Nepal (use the city table) 
SELECT customer.first_name, customer.last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city.city = 'Nepal';

-- 5. Which staff member had the most transactions? 
SELECT staff.first_name, staff.last_name
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY COUNT(payment.payment_id) DESC
LIMIT 1;

-- 6. What film had the most actors in it? 
SELECT film.title, COUNT(film_actor.actor_id) AS most_actors_count
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY Most_actors_count DESC
LIMIT 1;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries) 
SELECT customer.first_name, customer.last_name
FROM customer
WHERE customer.customer_id IN(
    SELECT payment.customer_id
    FROM payment
    WHERE payment.amount > 6.99
    GROUP BY payment.customer_id
    HAVING COUNT(*) = 1
);

-- 8. Which category is most prevalent in the films?  
SELECT category.name, COUNT(*) 
FROM Film_category 
JOIN category ON film_category.category_id = category.category_id 
GROUP BY category.name 
ORDER BY COUNT(*) DESC 
LIMIT 1;









