create materialized view mv_dmitriy_visits_and_eats
as
    select p2.name from person_visits
    join person p on person_visits.person_id = p.id
    join pizzeria p2 on person_visits.pizzeria_id = p2.id
    join menu m on p2.id = m.pizzeria_id
where p.name = 'Dmitriy' and  visit_date = '2022-01-08' and price < 800 ;