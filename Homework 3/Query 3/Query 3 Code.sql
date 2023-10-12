use homeworkthree;
select count(*) customers
from customers
inner join place on customers.cid = place.cid
inner join orders on orders.oid = place.oid
inner join contain on contain.oid = orders.oid
inner join products on products.pid = contain.pid
where (((contain.pid = 4) or (contain.pid = 5))
and (customers.cid not in(select customers.cid
		from customers
		inner join place on customers.cid = place.cid
		inner join orders on orders.oid = place.oid
		inner join contain on contain.oid = orders.oid
		inner join products on products.pid = contain.pid
        where products.name = 'Router')))




	

    


