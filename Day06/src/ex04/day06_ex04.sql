alter table person_discounts
    add constraint ch_nn_person_id check (person_id is not NULL),
    add constraint ch_nn_pizzeria_id check (pizzeria_id is not NULL),
    add constraint ch_nn_discount check (discount is not NULL),
    alter column discount set default 0,
    add constraint ch_range_discount check (discount >= 0 and discount <= 100)
