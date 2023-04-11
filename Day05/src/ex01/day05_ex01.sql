SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT pizza_name, name  AS pizzeria_name
FROM menu JOIN pizzeria p on menu.pizzeria_id = p.id




-- DROP INDEX idx_person_visits_person_id;
-- DROP INDEX idx_person_visits_pizzeria_id;
-- DROP INDEX idx_menu_pizzeria_id;
-- DROP INDEX idx_person_order_person_id;
-- DROP INDEX idx_person_order_menu_id;