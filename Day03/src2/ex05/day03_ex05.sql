SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits pv on pizzeria.id = pv.pizzeria_id
JOIN person p on pv.person_id = p.id
JOIN person_order po on p.id = po.person_id
WHERE p.name = 'Andrey' AND pv.visit_date != po.order_date