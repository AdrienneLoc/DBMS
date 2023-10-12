use homeworkthree;
select merchants.name as "Company Name", year(order_date) as year, count(orders.oid) as "Number of Orders"
from merchants
inner join sell on merchants.mid = sell.mid
inner join products on products.pid = sell.pid
inner join contain on contain.pid = products.pid
inner join orders on orders.oid = contain.oid
inner join place on place.oid = orders.oid
group by merchants.name, year







	

    


