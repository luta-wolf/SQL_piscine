-- запускаем сначала сессию 1, затем сессию 2
-- проверяем уровень изоляции в с1 и с2 (должен быть read committed)
SHOW TRANSACTION ISOLATION LEVEL;
-- начинаем работу в с1 и с2
-- находим суммарный рейтинг пиццерий в с1 и с2
BEGIN;
SELECT SUM(rating) FROM pizzeria;
-- устанавливаем рейтинг пиццерии Pizza Hut = 1 в с2
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
-- В сессии 2 опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- находим суммарный рейтинг пиццерий в с1
SELECT SUM(rating) FROM pizzeria;
-- В сессии 1 опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Проверяем значения в обоих сессиях
SELECT SUM(rating) FROM pizzeria;