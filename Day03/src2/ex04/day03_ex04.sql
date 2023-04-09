(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu m ON pizzeria.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
WHERE p.gender = 'male'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu m ON pizzeria.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
WHERE p.gender = 'female')
UNION
(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu m ON pizzeria.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
WHERE p.gender = 'female'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu m ON pizzeria.id = m.pizzeria_id
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
WHERE p.gender = 'male')
ORDER BY 1