SELECT DISTINCT visit_d as missing_date
FROM (SELECT gs::date AS visit_d
FROM generate_series('2022-01-01', '2022-01-10','1 day'::interval) AS gs) t
LEFT JOIN (SELECT visit_date FROM person_visits WHERE (person_id = 1 OR person_id = 2 )) t1
ON t1.visit_date = visit_d
WHERE visit_date is null
ORDER BY visit_d;
