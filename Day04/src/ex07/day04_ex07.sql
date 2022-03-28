with t2 as
(select pizzeria.id  from menu
	left join pizzeria on menu.pizzeria_id = pizzeria.id
 where menu.price < 800 and pizzeria.name not in
	(SELECT DISTINCT piz_name FROM
		(SELECT pizzeria.name as piz_name, pizzeria_id as piz_id
		FROM person_visits
		LEFT JOIN person ON person.id = person_id
		LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
		WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08') AS t1
	LEFT JOIN menu ON menu.pizzeria_id = t1.piz_id
	WHERE menu.price < 800)
	limit 1
)
insert into person_visits (id, person_id, pizzeria_id, visit_date)
select (select (count(*) + 1) from person_visits) as id,
	(select person.id from person where name = 'Dmitriy') as person_id,
	(select * from t2),
	'2022-01-08' as visit_date;
refresh materialized view mv_dmitriy_visits_and_eats;
