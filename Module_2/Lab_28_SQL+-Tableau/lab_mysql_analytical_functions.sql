use sakila;


-- -- 1. find the running total of rental payments for each customer in the payment table, 
-- ordered by payment date. By selecting the customer_id, payment_date, and amount columns from 
-- the payment table, and then applying the SUM function to the amount column within each customer_id partition, 
-- ordering by payment_date.

SELECT 
    customer_id, 
    payment_date, 
    amount, 
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total 
FROM payment;

-- 2.  find the rank and dense rank of each payment amount within each payment date by selecting 
-- the payment_date and amount columns from the payment table, and then applying the RANK and DENSE_RANK 
-- functions to the amount column within each payment_date partition, ordering by amount in descending order.

SELECT
	date(payment_date),
    amount,
	RANK() over (PARTITION BY date(payment_date) ORDER BY amount DESC) AS amount_rank,
    DENSE_RANK() over (PARTITION BY date(payment_date) ORDER BY amount DESC) AS amount_dense_rank
FROM payment;

-- 3. find the ranking of each film based on its rental rate, within its respective category. 

SELECT
	name, 
    title,
    rental_rate,
    RANK() over (PARTITION BY name order by rental_rate DESC, title) AS rnk,
	DENSE_RANK() over (PARTITION BY name order by rental_rate DESC, title) AS dense_rnk
FROM film 
join film_category using (film_id)
join category using (category_id);

-- 4.(OPTIONAL) update the previous query from above to retrieve only the top 5 films within each category

select * from (
SELECT
	name, 
    title,
    rental_rate,
    RANK() over (PARTITION BY name order by rental_rate DESC, title) AS rnk,
	DENSE_RANK() over (PARTITION BY name order by rental_rate DESC, title) AS dense_rnk,
    ROW_NUMBER() over (PARTITION BY name) AS rnb
FROM film 
join film_category using (film_id)
join category using (category_id)
) a
where a.rnb <= 5;

-- 5. find the difference between the current and previous payment amount and 
-- the difference between the current and next payment amount, for each customer in the payment table

SELECT
	payment_id,
    customer_id,
    amount,
    payment_date,
    (amount-LAG(amount) OVER (PARTITION BY customer_id ORDER BY payment_date)) AS diff_from_prev ,
    (LEAD(amount)  OVER (PARTITION BY customer_id ORDER BY payment_date) - amount) AS diff_from_next 
FROM payment;
