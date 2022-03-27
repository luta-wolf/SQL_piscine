INSERT INTO person_visits
SELECT *, '2022-02-24'::date as visit_date
FROM
(SELECT max(id) + 2 FROM person_visits) as id,
(SELECT id FROM person WHERE name = 'Irina') asperson_id,
(SELECT id FROM pizzeria WHERE name = 'Dominos') as pizzeria_id
UNION
SELECT *, '2022-02-24'::date as visit_date
FROM
(SELECT max(id) + 1 FROM person_visits) as id,
(SELECT id FROM person WHERE name = 'Denis') asperson_id,
(SELECT id FROM pizzeria WHERE name = 'Dominos') as pizzeria_id;
