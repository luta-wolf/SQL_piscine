SELECT
	menu.pizza_name,
	menu.price,
	pizzeria.name AS pizzeria_name,
	person_visits.visit_date
	FROM  person_visits
INNER JOIN person
	ON person_visits.person_id = person.id
INNER JOIN pizzeria
	ON  person_visits.pizzeria_id = pizzeria.id
INNER JOIN menu
	ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND price BETWEEN  800 AND 1000
ORDER BY 1, 2, 3;
