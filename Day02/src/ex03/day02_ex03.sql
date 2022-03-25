WITH my_table (missing_date)
	AS (SELECT gs::date AS visit_d
	FROM generate_series('2022-01-01', '2022-01-10','1 day'::interval) AS gs)
	SELECT missing_date FROM my_table
	LEFT JOIN
	(SELECT visit_date FROM person_visits WHERE (person_id = 1 OR person_id = 2 )) t1
ON t1.visit_date = missing_date
WHERE visit_date is null
ORDER BY missing_date;
