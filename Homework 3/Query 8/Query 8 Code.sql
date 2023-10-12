use homeworkthree;
SELECT table1.*
FROM (SELECT shipping_method as "Company", AVG(shipping_cost) as "Average_Cost"
		FROM orders
		GROUP BY shipping_method) AS table1,
        
        (SELECT MIN(Average_Cost) as min_Average
			FROM (SELECT shipping_method as "Company", AVG(shipping_cost) as "Average_Cost"
					FROM orders
					GROUP BY shipping_method) AS table2) AS table3
WHERE table1.Average_Cost = table3.min_Average