BEGIN; --session1

BEGIN; --session2

update person  set age=55 where id=1; --session1

update person  set age=22 where id=2; --session2

update person  set age=55 where id=2; --session1

update person  set age=22 where id=1; --session2

commit; --session1

commit; --session2
