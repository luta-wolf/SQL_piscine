WITH male AS (SELECT pizzeria.name
				FROM pizzeria
				JOIN person_visits AS visit
				ON pizzeria.id = visit.pizzeria_id
				JOIN person on person.id = visit.person_id
				WHERE gender = 'male'
			   ),
	female AS (SELECT pizzeria.name
			   FROM pizzeria
			   JOIN person_visits AS visit
			   ON pizzeria.id = visit.pizzeria_id
			   JOIN person
			   ON person.id = visit.person_id
			   WHERE gender = 'female'
			  ),
 only_male AS (SELECT name
			   FROM male
			   EXCEPT ALL
			   SELECT name
			   FROM female
			  ),
only_female AS (SELECT name
				FROM female
				EXCEPT ALL
				SELECT name
				FROM male
			   )
SELECT name AS pizzeria_name
FROM only_male
UNION ALL
SELECT name
FROM only_female
ORDER BY 1;


    --   (select p2.name as pizzeria_name
    --   from person p inner join person_visits pv on p.id = pv.person_id
    --       inner join pizzeria p2 on p2.id = pv.pizzeria_id
    --   where p.gender = 'female'
    --   except all
    --   select p2.name
    --   from person p inner join person_visits pv on p.id = pv.person_id
    --       inner join pizzeria p2 on p2.id = pv.pizzeria_id
    --   where p.gender = 'male')
    --   union all
    --   (select p2.name
    --   from person p inner join person_visits pv on p.id = pv.person_id
    --       inner join pizzeria p2 on p2.id = pv.pizzeria_id
    --   where p.gender = 'male'
    --   except all
    --   select p2.name
    --   from person p inner join person_visits pv on p.id = pv.person_id
    --       inner join pizzeria p2 on p2.id = pv.pizzeria_id
    --   where p.gender = 'female')
    --   order by 1;



