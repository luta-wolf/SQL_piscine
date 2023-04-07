(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'male'
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'female')
UNION ALL
(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'female'
EXCEPT ALL
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.gender = 'male')
ORDER BY 1