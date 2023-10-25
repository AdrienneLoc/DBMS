use homeworkfour;
-- Query 1 -------------------------------------------------------------------------------------------------------
select name, avg(length) as "Average Film Length"
from film
natural join film_category 
natural join category
group by name
order by name asc;
-- Query 1 END ---------------------------------------------------------------------------------------------------

-- Query 2 -------------------------------------------------------------------------------------------------------
select name, avg(length) as "average_film_length"
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
order by name asc;
-- Query 2 END ---------------------------------------------------------------------------------------------------

-- Query 3 -------------------------------------------------------------------------------------------------------
select distinct first_name, last_name              -- getting people who rented action movies
from customer
natural join rental
natural join inventory
natural join film
natural join film_category
natural join category
where name = 'Action'
except
select distinct first_name, last_name                 -- removing people who rented comedy or classic movies
from customer
natural join rental 
natural join inventory
natural join film
natural join film_category
natural join category
where name = 'Comedy' or name = 'Classics'
-- Query 3 END ---------------------------------------------------------------------------------------------------

-- Query 4 -------------------------------------------------------------------------------------------------------
select a.first_name, a.last_name, b.english_film_count as "english_film_count" 
from actor a, (select actor_id, count(actor_id) as "english_film_count"     -- tables getting count for all actors
				from actor
				natural join film_actor
				natural join film
				natural join language
				where name = 'English'
				group by actor_id) b
where a.actor_id = b.actor_id and english_film_count >= all(select count(actor_id)    -- getting max from english film count
                                                              from actor
                                                              natural join film_actor
                                                              natural join film
                                                              natural join language
                                                              where name = 'English'
                                                              group by actor_id);
-- Query 4 END ---------------------------------------------------------------------------------------------------