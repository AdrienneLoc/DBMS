use homeworkthree;
select table1.*
from (select merchants.name as "company", customers.fullname as customer, sum(price) as "amount_spent"
		from  merchants 
		inner join sell on merchants.mid = sell.mid
		inner join products on products.pid = sell.pid
		inner join contain on contain.pid = products.pid
		inner join orders on orders.oid = contain.oid
		inner join place on place.oid = orders.oid
		inner join customers on place.cid = customers.cid
		group by company, customer
        order by company) as table1,
        
        (select company, max(amount_spent) as "maximum", min(amount_spent) as "minimum"
			from (select merchants.name as "company", customers.fullname as customer, sum(price) as "amount_spent"
					from  merchants 
					inner join sell on merchants.mid = sell.mid
					inner join products on products.pid = sell.pid
					inner join contain on contain.pid = products.pid
					inner join orders on orders.oid = contain.oid
					inner join place on place.oid = orders.oid
					inner join customers on place.cid = customers.cid
					group by company,customer) as table2
                    group by company) as table3
where table1.company = table3.company and (table1.amount_spent = table3.maximum or table1.amount_spent = table3.minimum)
group by company, customer
        
        


