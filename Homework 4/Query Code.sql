use homeworkfour;
-- Query 1 -------------------------------------------------------------------------------------------------------
-- What is the average length of films in each category? List the results in alphabetic order of categories. 
select name, avg(length) as "Average Film Length"
from film
natural join film_category 
natural join category
group by name
order by name asc;
-- Query 1 END ---------------------------------------------------------------------------------------------------

-- Query 2 -------------------------------------------------------------------------------------------------------
-- Which categories have the longest and shortest average film lengths?
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
-- Which customers have rented action but not comedy or classic movies?
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
-- Which actor has appeared in the most English-language movies?
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

-- Query 5 -------------------------------------------------------------------------------------------------------
-- How many distinct movies were rented for exactly 10 days from the store where Mike works?
select distinct count(film_id) as "Number of Distinct Films"
from rental
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join store on inventory.store_id = store.store_id
inner join staff on store.store_id = staff.store_id
where first_name = 'Mike' and (abs(datediff(rental_date, return_date)) = 10); -- getting staff with name mike and 10 day difference
-- Query 5 END ---------------------------------------------------------------------------------------------------

-- Query 6 -------------------------------------------------------------------------------------------------------
-- Alphabetically list actors who appeared in the movie with the largest cast of actors.
select first_name, last_name
from actor
natural join film_actor
-- filtering so that film_id is the same as the film_id with max actors
where film_id = (select film_id
				 from film_actor
				 group by film_id
                 -- getting list of number of actors for each film and then getting the max
				 having count(actor_id) >= all(select count(actor_id)
											   from film_actor
											   group by film_id))
order by first_name, last_name asc
-- Query 6 END ---------------------------------------------------------------------------------------------------