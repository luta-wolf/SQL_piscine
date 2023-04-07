SELECT t1.pizza_name AS Pizza_name, t1.name AS pizzeria_name_1, t2.name as pizzeria_name_2, t1.price
FROM (SELECT name, pizza_name, price, pizzeria_id
      FROM menu
      JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) AS t1
JOIN (SELECT name, pizza_name, price, pizzeria_id
      FROM menu
      JOIN pizzeria ON menu.pizzeria_id = pizzeria.id) AS t2 ON t1.price = t2.price AND t1.pizza_name = t2.pizza_name
WHERE t1.pizzeria_id > t2.pizzeria_id
ORDER BY 1