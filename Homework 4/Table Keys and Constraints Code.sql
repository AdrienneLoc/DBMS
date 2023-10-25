use homeworkfour;
set foreign_key_checks = 0;
set sql_safe_updates = 0;
-- declaring the primary keys of each table
alter table actor
add primary key(actor_id);

-- address primary key
alter table address
add primary key(address_id);

-- category primary key
alter table category
add primary key(category_id);

-- city primary key
alter table city
add primary key(city_id);

-- country primary key
alter table country
add primary key(country_id);

-- customer primary key
alter table customer
add primary key(customer_id);

-- film primary key
alter table film
add primary key(film_id);

-- inventory primary key
alter table inventory
add primary key(inventory_id);

-- language primary key
alter table language
add primary key(language_id);

-- payment primary key
alter table payment
add primary key(payment_id);

-- rental primary key
alter table rental
add primary key(rental_id);

-- staff primary key
alter table staff
add primary key(staff_id);

-- store primary key
alter table store
add primary key(store_id);

-- adding foreign keys and constraints

alter table address
add foreign key(city_id) references city(city_id);

alter table category
add constraint name_constraint check(name in ('Animation', 'Comedy', 'Family', 'Foreign', 'Sci-Fi', 
												'Travel', 'Children', 'Drama', 'Horror', 
                                                'Action', 'Classics', 'Games', 'New', 'Documentary', 'Sports', 'Music'));

alter table city 
add foreign key(country_id) references country(country_id);


alter table customer
add foreign key(store_id) references store(store_id),
add foreign key(address_id) references address(address_id),
add constraint active_constraint check(active = 0 or active = 1);


alter table film
add foreign key(language_id) references language(language_id),
add constraint special_features_constraint check(special_features in ('Behind the Scenes', 'Commentaries', 'Deleted Scenes', 'Trailers')),
add constraint rental_duration_constraint check(rental_duration between 2 and 8),
add constraint rental_rate_constraint check(rental_rate between 0.99 and 6.99),
add constraint length_constraint check(length between 30 and 200),
add constraint rating_constraint check(rating in ('PG', 'G', 'NC-17', 'PG-13', 'R')),
add constraint replacement_cost_constraint check(replacement_cost between 5.00 and 100.00);

alter table film_actor
add foreign key(actor_id) references actor(actor_id),
add foreign key(film_id) references film(film_id);

alter table film_category
add foreign key(film_id) references film(film_id),
add foreign key(category_id) references category(category_id);

alter table inventory
add foreign key(film_id) references film(film_id),
add foreign key(store_id) references store(store_id);

alter table payment
add foreign key(customer_id) references customer(customer_id),
add foreign key(staff_id) references staff(staff_id),
add foreign key(rental_id) references rental(rental_id),
add constraint amount_constraint check(amount >= 0);

alter table rental
add foreign key(inventory_id) references inventory(inventory_id),
add foreign key(customer_id) references customer(customer_id),
add foreign key(staff_id) references staff(staff_id),
add unique(rental_date, inventory_id, customer_id);

alter table staff
add foreign key(address_id) references address(address_id),
add foreign key(store_id) references store(store_id);

alter table store
add foreign key(address_id) references address(address_id);