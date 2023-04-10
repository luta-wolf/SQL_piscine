insert into person_visits (id, person_id, pizzeria_id, visit_date)
    VALUES (
            (select max(id)  from person_visits) + 1,
            (select id from person where name = 'Dmitriy'),
            (select  pizzeria_id  from menu
                join pizzeria on menu.pizzeria_id = pizzeria.id  where price < 800
            except
                (select  id from pizzeria join mv_dmitriy_visits_and_eats on pizzeria.name = mv_dmitriy_visits_and_eats.name)
                    order by 1 limit 1),
            '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
