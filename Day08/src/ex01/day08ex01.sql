begin; --start the session 1
select * from pizzeria where name  = 'Pizza Hut';
UPDATE pizzeria set rating = 4 where name = 'Pizza Hut'; -- updating info in column name
commit ; -- commiting the changes
select * from pizzeria where name  = 'Pizza Hut';


begin; -- start the session 2
select * from pizzeria where name  = 'Pizza Hut';
UPDATE pizzeria set rating = 3.6 where name = 'Pizza Hut'; UPDATE pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';
