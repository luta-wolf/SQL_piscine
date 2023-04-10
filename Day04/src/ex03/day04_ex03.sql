select generated_date as missing_date from v_generated_dates
except all
select visit_date as missing_date from person_visits
order by 1;