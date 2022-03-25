SELECT
	COALESCE(P.name, '-') AS person_name,
	visit_date,
	COALESCE(V.name, '-') AS pizzeria_name
FROM person AS P
FULL JOIN
	(SELECT * FROM
		(SELECT * FROM person_visits
		WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
		AS V
	FULL JOIN
		pizzeria AS P ON P.id = V.pizzeria_id)
		AS V ON P.id = V.person_id
ORDER BY person_name, visit_date, pizzeria_name;
