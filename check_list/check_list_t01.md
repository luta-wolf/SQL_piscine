## About
### Introduction
The methodology of School 21 makes sense only if peer-to-peer reviews are done seriously. Please read all guidelines carefully before starting the review.
- Please, stay courteous, polite, respectful and constructive in all communications during this review.
- Highlight possible malfunctions of the work done by the person and take the time to discuss and debate it.
- Keep in mind that sometimes there can be differences in interpretation of the tasks and the scope of features. Please, stay open-minded to the vision of the other.
- If you have not finished the project yet, it is compulsory to read the entire instruction before starting the review.

### Guidelines
- Evaluate only the files that are in src folder on the GIT repository of the student or group.
- Ensure to start reviewing a group project only when the team is present in full.
- Use special flags in the checklist to report, for example, an “empty work” if repository does not contain the work of the student (or group) in the src folder of the develop branch, or “cheat” in case of cheating or if the student (or group) are unable to explain their work at any time during review as well as if one of the points below is not met. However, except for cheating cases, you are encouraged to continue reviewing the project to identify the problems that caused the situation in order to avoid them at the next review.
- Doublecheck that the GIT repository is the one corresponding to the student or the group.
- Meticulously check that nothing malicious has been used to mislead you.
- In controversial cases, remember that the checklist determines only the general order of the check. The final decision on project evaluation remains with the reviewer.

## Main part
### Exercise 00
Checks for the exercise 00
- The next command

        select coalesce(u.name,'not defined') as name,
            coalesce(u.lastname,'not defined') as lastname,
            t1.type,
            t1.volume,
            coalesce(c.name,'not defined') as currency_name,
            coalesce((select rate_to_usd from currency c1 where c1.id = c.id and c1.updated = c.last_updated),
                        1) as last_rate_to_usd,
            t1.volume::numeric * coalesce((select rate_to_usd
            from currency c1 where c1.id = c.id and c1.updated = c.last_updated),1) as total_volume_in_usd
        from (
        select user_id, type, currency_id, sum(money) as volume
        from  balance b
        group by user_id,type, currency_id) as t1
        full join "user" u on u.id = t1.user_id
        full join (select id,name,max(updated) as last_updated from currency c group by id, name) as c on c.id = t1.currency_id
        order by 1 desc,2,3;

- The result is below

      "Петр"	"not defined"	"2"	"203"	"not defined"	"1"	"203"
      "Иван"	"Иванов"	"1"	"410"	"EUR"	"0.9"	"369"
      "not defined"	"not defined"	"0"	"120"	"JPY"	"0.0087"	"1.044"
      "not defined"	"not defined"	"1"	"120"	"USD"	"1"	"120"
      "not defined"	"Сидоров"	"0"	"50"	"EUR"	"0.9"	"45"
      "not defined"	"Сидоров"	"1"	"500"	"USD"	"1"	"500"
      "not defined"	"Сидоров"	"2"	"500"	"JPY"	"0.0087"	"4.35"

### Exercise 01
Checks for the exercise 01
- The next command

        select t1.name,
            t1.lastname,
            currency_name,
            money * rate_to_usd as currency_in_usd
        from (
        select coalesce(u.name,'not defined') as name,
            coalesce(u.lastname,'not defined') as lastname,
            c.name as currency_name,
            money,
            coalesce((select rate_to_usd
            from currency c where b.currency_id = c.id and c.updated < b.updated order by  c.updated desc limit 1),
                    (select rate_to_usd
                    from currency c where b.currency_id = c.id and c.updated > b.updated order by  c.updated asc limit 1)) as rate_to_usd
        from balance b inner join
            (select c.id, c.name from currency c group by c.id,c.name) as c on c.id = b.currency_id
            left join "user" u on u.id = b.user_id) as t1
        order by 1 desc,2,3;

- The result is below

      "Иван"	"Иванов"	"EUR"	"150.1"
      "Иван"	"Иванов"	"EUR"	"17"
      "Иван"	"Иванов"	"EUR"	"158"
      "not defined"	"not defined"	"JPY"	"0.948"
      "not defined"	"not defined"	"USD"	"120"
      "not defined"	"Сидоров"	"EUR"	"39.5"
      "not defined"	"Сидоров"	"JPY"	"3.95"
      "not defined"	"Сидоров"	"USD"	"500"
