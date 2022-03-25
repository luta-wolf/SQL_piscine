SELECT pizza_name, name AS pizzeria_name, price FROM menu
INNER JOIN pizzeria
ON menu.pizzeria_id = pizzeria.id
WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza'
ORDER BY pizza_name, pizzeria_name;
