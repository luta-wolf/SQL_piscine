UPDATE menu
SET price = (SELECT price FROM menu WHERE pizza_name = 'sicilian pizza') - 0.1 * (SELECT price FROM menu WHERE pizza_name = 'sicilian pizza')
WHERE id = ((SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'))