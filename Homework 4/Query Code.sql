use homeworkfour;
-- Query 1 -------------------------------------------------------------------------------------------------------
/*select name, avg(length) as "Average Film Length"
from film
natural join film_category 
natural join category
group by name
order by name asc;*/
-- Query 1 END ---------------------------------------------------------------------------------------------------

-- Query 2 -------------------------------------------------------------------------------------------------------
/*select name, avg(length) as "average_film_length"
from film
natural join film_category
natural join category
group by name
having (avg(length) >= all (select avg(length) -- getting the category with the highest avg film length
								from film
                                natural join film_category
                                natural join category
                                group by name)
		or 
        avg(length) <= all (select avg(length) -- getting the category with the lowest avg film length 
								from film
                                natural join film_category
                                natural join category
                                group by name))
order by name asc;*/
-- Query 2 END ---------------------------------------------------------------------------------------------------

-- Query 3 -------------------------------------------------------------------------------------------------------
/*select distinct first_name, last_name
from customer
natural join rental
natural join inventory
natural join film
natural join film_category
natural join category
where name = 'Action'
except
select distinct first_name, last_name
from customer
natural join rental 
natural join inventory
natural join film
natural join film_category
natural join category
where name = 'Comedy' or name = 'Classics'*/
-- Query 3 END ---------------------------------------------------------------------------------------------------

