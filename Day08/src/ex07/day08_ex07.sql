-- запускаем сначала сессию 1, затем сессию 2
-- начинаем работу в с1 и с2
-- изменяем рейтинг на 4 пиццерии Pizza Hut в с1
BEGIN;
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- изменяем рейтинг на 3 пиццерии Dominos в с2
BEGIN;
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';
-- изменяем рейтинг на 4 пиццерии Dominos в с1
UPDATE pizzeria SET rating = 4 WHERE name = 'Dominos';
-- изменяем рейтинг на 3 пиццерии Pizza Hut в с2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
-- В сессии 1 опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- В сессии 2 опубликуем свои изменения для всех параллельных сессий.
COMMIT;