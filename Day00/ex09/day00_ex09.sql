SELECT
	(SELECT name FROM person WHERE person.id = t1.person_id) AS person_name ,  -- this is an internal query in a main SELECT clause
	(SELECT name FROM pizzeria WHERE pizzeria.id = t1.pizzeria_id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT person_id, pizzeria_id, visit_date FROM person_visits) AS t1 -- this is an internal query in a main FROM clause
WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09'
ORDER BY person_name ASC, pizzeria_name DESC;
