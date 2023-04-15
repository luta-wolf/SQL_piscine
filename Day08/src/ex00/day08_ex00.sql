-- запускаем сессию 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria;
-- видим изменения значений
-- начинаем работу в сессии 2 и смотрим на измененное в сессии 1 значение
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Значение осталось без изменения
-- В сессии 1 опубликуем свои изменения для всех параллельных сессий.
COMMIT;
-- Проверяем измененное значение в сессии 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
