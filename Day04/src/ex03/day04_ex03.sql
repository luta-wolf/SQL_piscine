SELECT generate_date AS missing_date FROM
(SELECT gs::date AS generate_date
	FROM generate_series('2022-01-01', '2022-01-31','1 day'::interval) AS gs) AS t1
LEFT JOIN person_visits ON t1.generate_date = person_visits.visit_date
WHERE visit_date IS null
ORDER BY 1;
