INSERT INTO  person_discounts (id, person_id, pizzeria_id, discount)
SELECT
    row_number() over () as id,
    person_id,
    m.pizzeria_id,
    case
        when count(*) = 1 then 10.5
        when count(*) = 2 then 22
        else 30
    end as discount
FROM  person_order inner join menu m on m.id = person_order.menu_id
GROUP BY person_id, m.pizzeria_id;