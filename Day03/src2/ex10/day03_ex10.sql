INSERT INTO person_order
VALUES ((SELECT max(id) FROM person_visits) + 1, (SELECT id FROM person WHERE name = 'Denis'), (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24'),
       ((SELECT max(id) FROM person_visits) + 2, (SELECT id FROM person WHERE name = 'Irina'), (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24')
