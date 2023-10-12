use homeworkthree;
select *
from merchants
inner join sell on merchants.mid = sell.mid
inner join products on products.pid = sell.pid
where (merchants.name = 'HP' and products.category = 'Networking');
update products
inner join sell on products.pid = sell.pid
inner join merchants on merchants.mid = sell.mid
set price = price - (price*0.20)
where (merchants.name = 'HP' and products.category = 'Networking');
select *
from merchants
inner join sell on merchants.mid = sell.mid
inner join products on products.pid = sell.pid
where (merchants.name = 'HP' and products.category = 'Networking');






	

    


