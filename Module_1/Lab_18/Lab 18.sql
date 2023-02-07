-- **1. What are the different genres?**
select prime_genre from applestore
group by prime_genre
or 
select distinct prime_genre from applestore

-- **2. Which is the genre with the most apps rated?**

select prime_genre, rating_count_tot from applestore
order by rating_count_tot desc

-- **3. Which is the genre with most apps?**

select prime_genre, count(*) as hd
from applestore
group by prime_genre
order by hd desc

-- **4. Which is the one with least?**

select prime_genre, count(*) as hd
from applestore
group by prime_genre
order by hd asc

-- **5. Find the top 10 apps most rated.**

Select track_name, rating_count_tot from applestore
order by rating_count_tot desc 
limit 10;

-- **6. Find the top 10 apps best rated by users.**

Select track_name, user_rating, rating_count_tot, from applestore
order by user_rating desc, rating_count_tot desc
limit 10;

-- **10. How could you take the top 3 regarding both user ratings and number of votes?**    

Select track_name, user_rating, rating_count_tot from applestore
order by user_rating desc, rating_count_tot desc
limit 3;

-- **11. Do people care about the price of an app?**

Select track_name, user_rating, rating_count_tot, prime_genre, price from applestore
where price = 0
order by rating_count_tot desc
limit 5;

Select track_name, user_rating, rating_count_tot, prime_genre, price from applestore
where price > 0
order by rating_count_tot desc
limit 5;