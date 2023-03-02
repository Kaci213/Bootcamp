use ppub;
-- for the advance need to use distinct title
-- for the royalties need to use sales
-- the sum of both for each author

-- CHALENGE 1: 
-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT advancetable.title_id, advancetable.au_id, advancetable.advance,
		(advancetable.price * sales.qty * advancetable.royalty / 100 * advancetable.royaltyper / 100) as sales_royalty
FROM (
		SELECT titleauthor.title_id, titleauthor.au_id, titles.price,
		titles.royalty, titleauthor.royaltyper,
			(titles.advance*titleauthor.royaltyper/100) as advance
		FROM titleauthor
		LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
        WHERE advance IS NOT NULL) as advancetable
LEFT JOIN sales
ON advancetable.title_id = sales.title_id;

-- Step 2: Aggregate the total royalties for each title and author

with step2 as (
SELECT advancetable.title_id, advancetable.au_id, advancetable.advance,
		(advancetable.price * sales.qty * advancetable.royalty / 100 * advancetable.royaltyper / 100) as sales_royalty
FROM (
		SELECT titleauthor.title_id, titleauthor.au_id, titles.price,
		titles.royalty, titleauthor.royaltyper,
			(titles.advance*titleauthor.royaltyper/100) as advance
		FROM titleauthor
		LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
        WHERE advance IS NOT NULL) as advancetable
LEFT JOIN sales
ON advancetable.title_id = sales.title_id
)
Select title_id, au_id, advance, sum(sales_royalty) as tot_royalties
From step2
GROUP BY title_id, au_id;

-- Step 3: Calculate the total profits of each author

Select au_id, tot_royalties+advance as tot_profit
FROM(
with step2 as (
SELECT advancetable.title_id, advancetable.au_id, advancetable.advance,
		(advancetable.price * sales.qty * advancetable.royalty / 100 * advancetable.royaltyper / 100) as sales_royalty
FROM (
		SELECT titleauthor.title_id, titleauthor.au_id, titles.price,
		titles.royalty, titleauthor.royaltyper,
			(titles.advance*titleauthor.royaltyper/100) as advance
		FROM titleauthor
		LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
        WHERE advance IS NOT NULL) as advancetable
LEFT JOIN sales
ON advancetable.title_id = sales.title_id
)
Select title_id, au_id, advance, sum(sales_royalty) as tot_royalties
From step2
GROUP BY title_id, au_id
) step3
order by tot_profit desc;

-- CHALLENGE 2 Alternative solution
	-- should've created temporary tables
-- Step 1

CREATE TABLE ppub.royalty_per_sale
SELECT advancetable.title_id, advancetable.au_id, advancetable.advance,
		(advancetable.price * sales.qty * advancetable.royalty / 100 * advancetable.royaltyper / 100) as sales_royalty
FROM (
		SELECT titleauthor.title_id, titleauthor.au_id, titles.price,
		titles.royalty, titleauthor.royaltyper,
			(titles.advance*titleauthor.royaltyper/100) as advance
		FROM titleauthor
		LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id
        WHERE advance IS NOT NULL) as advancetable
LEFT JOIN sales
ON advancetable.title_id = sales.title_id;

-- Step 2

SELECT royalty_per_sale.au_id, royalty_per_sale.title_id, SUM(royalty_per_sale.sales_royalty) as tot_royalties
FROM ppub.royalty_per_sale
GROUP BY  royalty_per_sale.au_id, royalty_per_sale.title_id;

-- step 3

CREATE TABLE ppub.final_results
SELECT royalty_per_sale.au_id, concat(authors.au_fname, " ", authors.au_lname) as Author_Name, (SUM(royalty_per_sale.advance)+SUM(royalty_per_sale.sales_royalty)) as profits
FROM ppub.royalty_per_sale
left join authors 
on royalty_per_sale.au_id=authors.au_id
GROUP BY  royalty_per_sale.au_id
ORDER BY profits DESC LIMIT 3;

-- CHallenge 3
	-- should've created temporary tables

select *
from final_results;

create table most_profiting_authors(
au_id varchar(11),
author_name varchar(50),
profits int);


Insert into most_profiting_authors (au_id, author_name, profits)
Select au_id, Author_Name, profits
from final_results;

Select * 
from most_profiting_authors;
