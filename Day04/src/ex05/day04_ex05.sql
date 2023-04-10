create view v_price_with_discount as
    select name, m.pizza_name, m.price, (m2.price - m2.price * 0.1) as discount_price  from person_order
        join person p on person_order.person_id = p.id
        join menu m on person_order.menu_id = m.id
        join menu m2 on m2.id = person_order.menu_id
    order by name, m.pizza_name;
