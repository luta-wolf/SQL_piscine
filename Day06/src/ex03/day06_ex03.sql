create unique index idx_person_discounts_unique on person_discounts(person_id,pizzeria_id)
set enable_seqscan =off;

explain analyse
select * from person_discounts
where person_id = 1 and pizzeria_id=12;