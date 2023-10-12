use homeworkthree;
select total.*
from (select merchants.name as merchant, year(order_date) as year, sum(price) as revenue
		from merchants
		inner join sell on merchants.mid = sell.mid
		inner join products on products.pid = sell.pid
		inner join contain on contain.pid = products.pid
		inner join orders on orders.oid = contain.oid
		inner join place on place.oid = orders.oid
		group by merchant, year) as total,
        
        (select max(revenue) as max_revenue
			from (select merchants.name as merchant, year(order_date) as year, sum(price) as revenue
					from merchants
					inner join sell on merchants.mid = sell.mid
					inner join products on products.pid = sell.pid
					inner join contain on contain.pid = products.pid
					inner join orders on orders.oid = contain.oid
					inner join place on place.oid = orders.oid
					group by merchant, year) as total2) as total3
where total.revenue = total3.max_revenue










	

    


