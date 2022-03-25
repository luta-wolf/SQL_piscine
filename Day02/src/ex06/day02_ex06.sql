WITH table1 AS (
SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name, person.name AS person_name, person.gender as gender
	FROM person_order
	LEFT JOIN person ON person.id = person_id
	LEFT JOIN menu ON menu.id = menu_id
	LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
)
SELECT pizza_name, pizzeria_name
FROM table1
WHERE person_name = 'Denis' AND pizza_name IN (SELECT pizza_name FROM table1 WHERE person_name = 'Anna')
OR person_name = 'Anna' AND pizza_name IN (SELECT pizza_name FROM table1 WHERE person_name = 'Denis')
ORDER BY pizza_name, pizzeria_name;
