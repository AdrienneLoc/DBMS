use homeworkthree;
SELECT table1.*
FROM (SELECT merchants.name AS "company", category, SUM(price) AS total_bought
		FROM merchants
		INNER JOIN sell ON merchants.mid = sell.mid
		INNER JOIN products ON products.pid = sell.pid
		INNER JOIN contain ON contain.pid = products.pid
		INNER JOIN orders ON orders.oid = contain.oid
		GROUP BY company, category
		ORDER BY company) AS table1,
        
		(SELECT company, MAX(total_bought) AS "Max"
			FROM (SELECT merchants.name AS "company", category, SUM(price) AS total_bought
					FROM merchants
					INNER JOIN sell ON merchants.mid = sell.mid
					INNER JOIN products ON products.pid = sell.pid
					INNER JOIN contain ON contain.pid = products.pid
					INNER JOIN orders ON orders.oid = contain.oid
					GROUP BY company, category
					ORDER BY company) AS table2
			GROUP BY company) AS table3
WHERE table1.total_bought = table3.Max
