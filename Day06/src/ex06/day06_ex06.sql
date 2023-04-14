drop sequence if exists seq_person_discounts cascade;

create sequence seq_person_discounts start WITH 1;
select setval('seq_person_discounts', (SELECT max(id) FROM person_discounts));
alter table person_discounts
alter column id set default nextval('seq_person_discounts');

insert into person_discounts (person_id, pizzeria_id, discount)
values (4, 4, 12);


