-- Hello World SQL, Select all records from actor table
-- the following selects all actors:
SELECT *  
FROM actor;  

-- Query for First_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick 
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';  -- must be single quotes

-- Query for a first_name that is equal to Nick using the LIKE clause with WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick'; -- look for first name where the its like 'Nick'

-- Query for all frist_name data that starts with a J using the LIKE and WHERE clauses -- using the wildcard
SELECT first_name, actor_id
FROM actor
WHERE first_name Like 'J%'; -- we just want anything that starts with a capital J

-- Query for all first_name data that starts with K and has 2 letters after the K using like and 
-- WHERE clauses -- using underscore
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__'; -- looking of a 'K' and atleast 2 characters after it

-- Query for all frist_name data that starts with a K and ends with 'th'
-- using the LIKE and WHERE clauses -- using BOTH wildcard AND underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name Like 'K__%th'; -- a 'K' and atleast 2 characters after that AND ends with 'th'
              -- if it was '%K__%th' this would allow for kenneth to be in the middle of a long first name
			  
-- Comparing operators are: 
-- Greater Than (>)
-- Less Than (<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal (<>)

-- Explore Data with SELECT ALL Query (specific to changing into new table)
SELECT * -- selcting all
FROM payment;

-- Query for data that shows customers who paid 
-- an amount GREATER than $2
SELECT Customer_id, amount
FROM payment  -- from 'payment' table
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS than $7.99
SELECT customer_id,amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS than or EQUAL to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customers who paid
-- an amount GREATER than or EQUAL to $2.00
-- in Ascending order
SELECT customer_id,amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;  -- ASCending order: From Lowest to Highest amount

-- Query for data that shows customers who paid
-- an amount BETWEEN $2.00 and $7.99
-- Using the BETWEEN with the AND clause
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 2.00 and 7.99
ORDER BY amount ASC; 

-- Query for data that shows customers who paid 
-- an amount NOT EQUAL to $.00
-- Ordered in DESCENDING order
SELECT customer_id,amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC; --  DESCending order: From Highest to Lowest



-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- Query to display SUM of amounts payed that are greater than $5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to dsiplay AVERAGE of amounts payed that are greater than $5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to dsiplay COUNT of amounts payed that are greater than $5.99
SELECT COUNT(amount)  -- MAY include duplicates
FROM payment
WHERE amount > 5.99;

-- Query to dsiplay COUNT OF DISTINCT amounts payed that are greater than $5.99
SELECT COUNT(DISTINCT amount)  -- looking for non repeating values / Distinct values that only show up once
FROM payment
WHERE amount > 5.99;

-- Query to dsiplay MIN amounts greater than $7.99
SELECT MIN(amount) AS Min_Num_Payments  -- LOWEST amount in this columen that is is over $7.99
FROM payment
WHERE amount > 7.99;

-- Query to dsiplay MAX amounts greater than $7.99
SELECT MAX(amount) AS Max_Num_Payments  -- HIGHEST amount in this column that is over $7.99
FROM payment
WHERE amount > 7.99;

-- Query to display ALL amounts (quick demo of groupby)
SELECT amount
FROM payment
WHERE amount = 7.99;

-- Query to display DIFFERENT amounts grouped together
-- and count the amounts..  Its showing each amount and number of times it appears
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER By amount;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id Desc;

-- Query to display customer_ids with the summed amounts for each customer_id -- Seperate example of
-- a different way to use Group By
SELECT customer_id, amount
FROM payment
GROUP BY amount,customer_id
ORDER BY customer_id Desc;

-- Query to explore the data inside of the customer table
SELECT *
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Groupling by the customer's email
SELECT COUNT(customer_id),email  --customer_id is in () because that's what we're counting
FROM customer
WHERE email LIKE 'j__.w%'  -- j with 2 values after it, followed by. and w, than anything else after that
GROUP BY email
HAVING COUNT (customer_id) > 0;  -- checking for atleast 0 occurence wtih an email as noted above.


-- -----------------------------------------------------------------------------------------------------
-- ------------------------------HOMEWORK --------------------------------------------------------------

-- Question 1 --
-- How many actors are there with the last name 'Wahlberg'?
-- Answer: 2, Nick and Daryl
SELECT *
FROM actor;

SELECT last_name, first_name
FROM actor
WHERE last_name Like 'Wahlberg';


-- Question 2 --
-- How many payments were made between $4.99 and $5.99?
-- Answer: 4619
SELECT *
FROM payment;

SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 4.99 and 5.99
ORDER BY amount ASC; 

-- Question 3 --
-- What film does the store have the most of? (search in inventory)
-- Answer: Many are tied at a count of 8.  film ID 193, 789
SELECT *
FROM inventory;

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER By count(film_id) desc;

-- Question 4 --
-- How many customers have the last name 'William'?
-- Answer:  None do.  1 has a last name of WilliamS
SELECT *
FROM customer;

SELECT last_name, first_name
FROM customer
WHERE last_name Like 'William';

-- Question 5 --
-- What store employee (get the id) sold the most rentals
-- Answer: Employee/staff_id 1 w/8040 rentals
SELECT *
FROM rental;

SELECT staff_id, COUNT(staff_id)
FROM rental
GROUP BY staff_id
ORDER By count(staff_id) desc;

-- Question 6 --
-- How many different district names are there?
-- Answer: 378
SELECT *
FROM address;

SELECT district, COUNT(district)
FROM address
GROUP BY district;

-- Question 7 --
-- What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: film_id 15 w/ 508 actors
SELECT *
FROM film_actor;

SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER By count(film_id) desc;

-- Question 8 --
-- From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- Answer: 21
SELECT *
FROM customer;

SELECT first_name, last_name, customer_id
FROM customer
WHERE last_name Like '%es';

-- Question 9 --
-- How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with 
-- ids between 380 and 430? (use group by and having > 250)
-- Answer: None do.  The higest total for any ID was 211.35. No one reached 250.
SELECT *
FROM payment;

SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
ORDER By count(customer_id) desc;



-- Question 10 --
-- Within the film table, how many rating categories are there?  And what rating has the most movies total?
-- Answers: 5 Categories.  PG-13 has the most movies with 223
SELECT *
FROM film;

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

