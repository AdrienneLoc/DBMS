use homeworkthree;
select products.name, category, description, price, fullname, merchants.name
from products
natural join place
natural join orders
natural join contain
natural join customers
natural join sell
inner join merchants on merchants.mid = sell.mid
where(merchants.name = 'Acer' and customers.fullname = 'Uriel Whitney')






	

    


