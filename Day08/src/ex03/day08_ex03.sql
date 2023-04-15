-- запускаем сначала сессию 1, затем сессию 2
-- проверяем уровень изоляции в с1 и с2 (должен быть read committed)
SHOW TRANSACTION ISOLATION LEVEL;
-- начинаем работу в с1 и с2
-- проверяем рейтинг пиццерии Pizza Hut в с1 и с2
BEGIN;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- изменяем рейтинг на 3.6 в с2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
-- В сессии 2 опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- проверяем рейтинг пиццерии Pizza Hut в с1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- В сессии 1 опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Проверяем значения в обоих сессиях
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';