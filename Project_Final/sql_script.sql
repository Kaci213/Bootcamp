use climate_fproject;

select *
from cities;

-- Query 1 : Cities grouped by and ordered by countries
select country_name_en, name
from cities
group by country_name_en, name
order by country_name_en, name asc;

-- Query 2 : Top 50 cities in the World, by population 
select name, population, country_name_en
from cities
order by population desc
limit 50;

-- Query 3 : Top 10 cities in France, by population
select name, population, country_name_en
from cities
WHERE country_name_en = 'France'
order by population desc
limit 10;

-- Query 4 : Average mean temperature (with convertion in Celcius) for the top 30 cities in the World from 1950 to 2100
select amt.geoname_id, c.name, amt.annual_mean_temperature, 
round((amt.annual_mean_temperature - 273.15), 2) as temperature_in_celcius,amt.year
from cities c
right join an_mean_temp amt
on c.geoname_id=amt.geoname_id
order by name asc, year asc;


-- Query 5 : Join all the tables (& export in csv for the analysis)
citiesSELECT amt.geoname_id,
c.name,
c.country_name_en,
c.population,
amt.year,
amt.annual_mean_temperature,
amp.mean_precipitation,
mtcq.mean_temperature_coldest_quarter,
mtwq.mean_temperature_warmest_quarter,
pdm.precipitation_driest_month,
pwm.precipitation_wettest_month
from an_mean_temp amt
left join an_mean_prec amp
on amt.geoname_id=amp.geoname_id and amt.year=amp.year
left join men_temp_cold_q mtcq
on amp.geoname_id=mtcq.geoname_id and amp.year=mtcq.year
left join men_temp_warm_q mtwq
on mtcq.geoname_id=mtwq.geoname_id and mtcq.year=mtwq.year
left join prec_dri_mon pdm
on mtwq.geoname_id=pdm.geoname_id and mtwq.year=pdm.year
left join prec_wet_mon pwm
on pdm.geoname_id=pwm.geoname_id and pdm.year=pwm.year
left join cities c
on pwm.geoname_id=c.geoname_id
order by name asc, year asc;

