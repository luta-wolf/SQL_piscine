WITH table1 AS
	(SELECT pizzeria.name AS name, person.gender AS gender FROM person_order
	JOIN menu ON menu_id = menu.id
	JOIN person ON person_id = person.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 	)

SELECT DISTINCT name AS pizzeria_name FROM table1 WHERE gender = 'male' AND name NOT IN (SELECT name FROM table1 WHERE gender = 'female')
UNION ALL
SELECT DISTINCT name FROM table1 WHERE gender = 'female' AND name NOT IN (SELECT name FROM table1 WHERE gender = 'male')
ORDER BY 1;
