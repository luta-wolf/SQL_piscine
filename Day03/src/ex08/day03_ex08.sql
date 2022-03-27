INSERT INTO menu
SELECT (SELECT (max(menu.id) + 1) FROM menu) AS id, pizzeria, 'sicilian pizza' AS pizza_name, 900 as price FROM
(SELECT pizzeria.id as pizzeria FROM pizzeria
WHERE pizzeria.name = 'Dominos') AS pizzeria_id;
