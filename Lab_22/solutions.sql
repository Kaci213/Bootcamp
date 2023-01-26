use ppub;
-- for the advance need to use distinct title
-- for the royalties need to use sales
-- the sum of both for each author

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
ON advancetable.title_id = sales.title_id; -- as complicated;

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