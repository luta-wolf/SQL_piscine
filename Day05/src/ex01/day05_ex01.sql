SET enable_seqscan = OFF;
explain analyze 

select pizza_name,
				    (select name from pizzeria 
					 where pizzeria.id = menu.pizzeria_id) as pizzeria_name
					 from menu where pizzeria_id > 0;