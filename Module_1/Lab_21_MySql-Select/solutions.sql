use ppub;

-- Challenge 1 
-- Create table aut_pub
Select a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name from
authors a
Inner join titleauthor ta
on a.au_id=ta.au_id
Inner join titles t
on ta.title_id=t.title_id
Inner join publishers p
on t.pub_id=p.pub_id;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- Challenge 2
Select a.au_id, concat(a.au_lname, " ", a.au_fname) as full_name, p.pub_name, count(t.title) from
authors a
Inner join titleauthor ta
on a.au_id=ta.au_id
Inner join titles t
on ta.title_id=t.title_id
Inner join publishers p
on t.pub_id=p.pub_id
group by a.au_id, full_name, p.pub_name;

-- Challenge 3   titles/publisher 
	-- SUM better than count s.title_id
Select a.au_id, concat(a.au_fname, " ", a.au_lname) as full_name , count(s.title_id) as Nb_Title from
authors a
inner join titleauthor ta
on ta.au_id=a.au_id
inner join sales s
on ta.title_id=s.title_id
group by a.au_id, full_name, a.au_fname
order by Nb_Title desc
limit 3;

-- Challenge 4   titles/publisher 
	-- missing IFNULL(SUM(sale.qty)
Select a.au_id, concat(a.au_fname, " ", a.au_lname) as full_name , count(s.title_id) as Nb_Title from
authors a
left join titleauthor ta
on ta.au_id=a.au_id
left join sales s
on ta.title_id=s.title_id
group by a.au_id, full_name, a.au_fname
order by Nb_Title desc;