-- 1. List all customers who live in Texas (use JOINs)
	-- There is no data to answer this question.	


-- 2. Get all payments above $6.99 with the Customer's Full Name
	-- There is no table with first_name or last_name that is connected with the payment table
SELECT CONCAT(first_name, ' ', last_name) AS customers_full_name, amount
FROM payment
WHERE p.amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
	-- There is no data to answer this question.

-- 4. List all customers that live in Nepal (use the city table)
	-- There is no data to answer this question.

-- 5. Which staff member had the most transactions?
	-- There is no data to answer this question.

-- 6. What film had the most actors in it?
	-- There is no data to answer this question.

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM payment
WHERE customer_id IN (
	SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(*) = 1
)

-- 8. Which category is most prevalent in the films?
	-- There is no data to answer this question.
