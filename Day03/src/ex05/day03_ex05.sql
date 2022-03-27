SELECT DISTINCT pizzeria.name
FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE person.name = 'Andrey'
ORDER BY 1;
