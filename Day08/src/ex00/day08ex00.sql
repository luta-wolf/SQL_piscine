
--Session1;
BEGIN; --starting a transation 
UPDATE pizzeria set rating = 5 where name = 'Pizza Hut'; -- changing data 
Commit; --setting the transaction 

--Session2;
select * from pizzeria where name  = 'Pizza Hut'; 
