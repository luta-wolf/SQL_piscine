SELECT  pizza_name, price, pizzeria.name FROM
	(SELECT pizzeria_id, pizza_name, price FROM  menu
	WHERE  NOT EXISTS
	(SELECT person_order.id FROM  person_order
	WHERE  menu.id = person_order.menu_id)) AS t1
INNER JOIN pizzeria ON t1.pizzeria_id = pizzeria.id
ORDER BY 1, 2;


-- SELECT pizza_name, price, pizzeria.name FROM menu
-- LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
-- WHERE menu.id NOT IN (SELECT menu_id FROM person_order)
-- ORDER BY 1, 2
