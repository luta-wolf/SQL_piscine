SELECT order_date AS action_date, person.name AS person_name FROM person_order
JOIN person ON person_id = person.id
INTERSECT
SELECT visit_date, person.name AS person_name FROM person_visits
JOIN person ON person_id = person.id
ORDER BY action_date, person_name DESC


-- SELECT action_date, person.name AS person_name FROM
-- 	(SELECT order_date AS action_date, person_id FROM person_order
-- 	INTERSECT
-- 	SELECT visit_date, person_id FROM person_visits) AS t1
-- INNER JOIN person
-- ON person.id = person_id
-- ORDER BY action_date ASC, person_name DESC;

