use project_3;
select *
From primary_education;

Create table education_by_region(
SELECT Region, ROUND(avg(Total), 2) as edu_index
FROM primary_education 
GROUP BY Region)
Order BY ROUND(avg(Total), 2) DESC;

Create table education_by_income(
SELECT Income_Group, ROUND(avg(Total), 2) as edu_index
FROM primary_education 
GROUP BY Income_Group
Order BY ROUND(avg(Total), 2) ASC );

CREATE TABLE coutries_per_income(
SELECT Countries_and_areas, Income_Group
FROM primary_education
order by Income_Group);

select *
from education_by_region;

select *
from education_by_income;

select *
from coutries_per_income;

select Countries_and_areas, Total
from primary_education;
