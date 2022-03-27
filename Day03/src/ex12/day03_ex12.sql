INSERT INTO person_order
SELECT t2 + (SELECT max(id) FROM person_order), person.id, t1.id, '2022-02-25' as order_date
FROM
generate_series(1, (SELECT max(id) FROM person), 1) as t2
LEFT JOIN (SELECT id FROM menu WHERE pizza_name = 'greek pizza') as t1 ON t1 = t1
LEFT JOIN person ON t2 = person.id;
