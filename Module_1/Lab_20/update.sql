USE lab_mysql;

UPDATE salespersons
SET store = "Miami"
WHERE id=4;


UPDATE customers
SET email=case 
	when id=0 then "ppicasso@gmail.com"
    when id=1 then "lincoln@us.gov"
    when id=2 then "hello@napoleon.me"
	end;

