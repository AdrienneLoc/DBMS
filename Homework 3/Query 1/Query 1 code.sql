use homeworkthree;
select merchants.name, products.name, quantity_available
from merchants
inner join sell on merchants.mid = sell.mid
inner join products on sell.pid = products.pid
where quantity_available = 0








