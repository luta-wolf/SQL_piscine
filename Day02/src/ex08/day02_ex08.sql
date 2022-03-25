SELECT person.name FROM person_order
LEFT JOIN person ON person_id = person.id
LEFT JOIN menu ON menu_id = menu.id
WHERE (person.address = 'Moscow' or person.address = 'Samara')
	AND (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza')
	AND person.gender = 'male'
ORDER BY name DESC;
