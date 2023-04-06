SELECT DISTINCT pv2.visit_date AS missing_date FROM person_visits pv2
LEFT JOIN person_visits pv1 ON pv1.visit_date=pv2.visit_date
AND (pv1.person_id =1 OR pv1.person_id =2)
WHERE pv1.person_id IS NULL
ORDER BY 1;

-- SELECT DISTINCT visit_d as missing_date
-- FROM (SELECT gs::date AS visit_d
-- FROM generate_series('2022-01-01', '2022-01-10','1 day'::interval) AS gs) t
-- LEFT JOIN (SELECT visit_date FROM person_visits WHERE (person_id = 1 OR person_id = 2 )) t1
-- ON t1.visit_date = visit_d
-- WHERE visit_date is null
-- ORDER BY visit_d;
