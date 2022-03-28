CREATE VIEW v_price_with_discount AS
SELECT person.name,
	menu.pizza_name, menu.price,
	FLOOR(menu.price * 0.9) AS discount_price
FROM person
	JOIN person_order ON person.id = person_order.person_id
	JOIN menu ON person_order.menu_id = menu.id
ORDER BY name, pizza_name;


create view v_price_with_discount as (
select
	person.name as name,
	pizza_name,
	price,
	round(price * 0.9) as discount_price
from person_order
join person on person.id = person_id
join menu on menu.id = menu_id
order by 1, 2);
