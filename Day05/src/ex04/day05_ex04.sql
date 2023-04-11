CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT * FROM menu where pizzeria_id = 5 and  pizza_name = 'pepperoni pizza';

DROP INDEX idx_menu_unique;