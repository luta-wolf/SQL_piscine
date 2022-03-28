CREATE VIEW  v_symmetric_union AS
SELECT * FROM person_visits
WHERE visit_date = '2022-01-02'
AND person_id NOT IN (SELECT  person_id FROM person_visits
WHERE visit_date = '2022-01-06')
union
SELECT * FROM person_visits
WHERE visit_date = '2022-01-06'
AND person_id NOT IN (SELECT  person_id FROM person_visits
WHERE visit_date = '2022-01-02')
ORDER BY person_id;
