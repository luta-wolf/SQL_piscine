INSERT INTO menu
VALUES ((SELECT max(id) FROM menu) + 1, (SELECT id FROM pizzeria WHERE pizzeria.name = 'Dominos'), 'sicilian pizza', 900)