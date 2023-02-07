-- #### 1. From the `order_items` table, find the price of the highest priced order and lowest price order.
select order_id, order_item_id, price from order_items
order by price desc;

select order_id, order_item_id, price from order_items
order by price asc;

-- #### 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?

select shipping_limit_date from order_items
order by shipping_limit_date asc;

select shipping_limit_date from order_items
order by shipping_limit_date desc;

-- #### 3. From the `customers` table, find the states with the greatest number of customers.

select customer_state, count(*) as hd
from customers
group by customer_state
order by hd desc;

-- #### 4. From the `customers` table, within the state with the greatest number of customers, find the cities with the greatest number of customers.

select customer_city, count(*) as hd
from customers
where customer_state = "SP"
group by customer_city
order by hd desc
limit 10;

-- #### 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?

select count(distinct business_segment)
from closed_deals
where business_segment is not null;

-- #### 6. From the `closed_deals` table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

select distinct business_segment, sum(declared_monthly_revenue)
from closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc
limit 3;

-- #### 7. From the `order_reviews` table, find the total number of distinct review score values.

select count(distinct review_id)
from order_reviews;

-- #### 8. In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
-- #### 9. From the `order_reviews` table, find the review value occurring most frequently and how many times it occurs.

ALTER TABLE order_reviews
ADD Score_Description varchar(255);

UPDATE order_reviews 
SET Score_Description = CASE 
	when review_score = 1 then "Terrible"
    when review_score = 2 then "Bad"
    when review_score = 3 then "Okey"
    when review_score = 4 then "Good"
    when review_score = 5 then "Excellent"
    Else "not rated"
    end;

select Score_Description, count(Score_Description)
from order_reviews
group by Score_Description


    

