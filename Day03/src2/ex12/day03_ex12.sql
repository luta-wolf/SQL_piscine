INSERT INTO person_order
SELECT person_id + (SELECT MAX(id) FROM person_order), person_id, menu.id, '2022-02-25'
FROM GENERATE_SERIES(1, (SELECT MAX(id) FROM person)) AS person_id
JOIN menu ON pizza_name = 'greek pizza'