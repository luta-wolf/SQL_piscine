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
Checks for the file day00_ex00.sql
- The SQL script looks like below.

      select name,age from person where address = 'Kazan'

- The result is below (raw ordering should be the same like on a screen below)

      "Kate"	"33"
      "Denis"	"13"
      "Elvira"	"45"

### Exercise 01
Checks for the file day00_ex01.sql
- The SQL script looks like below.

      select name,age from person where address = 'Kazan' and gender = 'female' order by name

- The result is below (raw ordering should be the same like below)

      "Elvira"	"45"
      "Kate"	"33"

### Exercise 02
Checks for the file day00_ex02.sql
- The SQL script looks like below.

      select name, rating from pizzeria where rating >= 3.5 and rating <= 5 order by rating

The result is below (raw ordering should be the same like below)

      "DinoPizza"	"4.2"
      "Dominos"	"4.3"
      "Pizza Hut"	"4.6"
      "Papa Johns"	"4.9"

- The SQL script looks like below (to use BETWEEN keyword).

      select name, rating from pizzeria where rating between 3.5 and 5 order by rating

The result is below (raw ordering should be the same like on a screen below)

      "DinoPizza"	"4.2"
      "Dominos"	"4.3"
      "Pizza Hut"	"4.6"
      "Papa Johns"	"4.9"


### Exercise 03
Checks for the file day00_ex03.sql
- The SQL script looks like below.

      select  distinct person_id
      from person_visits
      where visit_date between '2022-01-06' and '2022-01-09'
      or pizzeria_id = 2
      order by person_id desc

- The result is below (raw ordering should be the same like below)

      9
      8
      7
      6
      5
      4
      2

### Exercise 04
Checks for the file day00_ex04.sql
- The SQL script looks like below.

      select name|| ' (age:'||age::varchar||',gender:'''||gender ||''',address:'''|| address || ''')' as person_information
      from person
      order by person_information

- The 2nd case of the solution looks like below.

      select concat(name, ' (age:',age::varchar,',gender:''',gender ,''',address:''', address , ''')') as person_information
      from person
      order by person_information

- The result is below (raw ordering should be the same like below)

        Andrey (age:21,gender:'male',address:'Moscow')
        Anna (age:16,gender:'female',address:'Moscow')
        Denis (age:13,gender:'male',address:'Kazan')
        Dmitriy (age:18,gender:'male',address:'Samara')
        Elvira (age:45,gender:'female',address:'Kazan')
        Irina (age:21,gender:'female',address:'Saint-Petersburg')
        Kate (age:33,gender:'female',address:'Kazan')
        Nataly (age:30,gender:'female',address:'Novosibirsk')
        Peter (age:24,gender:'male',address:'Saint-Petersburg')

### Exercise 05
Checks for the file day00_ex05.sql
- The SQL script looks like below.

       select (select name from person p where p.id = po.person_id) as name
       from person_order po
       where (menu_id = 13 or menu_id = 14 or menu_id = 18) and order_date = '2022-01-07'

- The result is below (raw ordering should be the same like below)

       "Denis"
       "Nataly"

### Exercise 06
Checks for the file day00_ex06.sql
- The SQL script looks like below.

        select (select name from person p where p.id = po.person_id) as name,
        (select name from person p where p.id = po.person_id) = 'Denis' as check_name
        from person_order po
        where (menu_id = 13 or menu_id = 14 or menu_id = 18) and order_date = '2022-01-07'

- The result is below (raw ordering should be the same like below)

    Denis	true
    Nataly	false

### Exercise 07
Checks for the file day00_ex07.sql
- The SQL script looks like below.

       select id,name,
          case
             when age between 10 and 20 then 'interval #1'
             when age > 20 and age < 24 then 'interval #2'
              else 'interval #3'
          end as interval_info
        from person
        order by 3

- The result is below (raw ordering should be the same like below)

      "1"	"Anna"	"interval #1"
      "4"	"Denis"	"interval #1"
      "9"	"Dmitriy"	"interval #1"
      "6"	"Irina"	"interval #2"
      "2"	"Andrey"	"interval #2"
      "8"	"Nataly"	"interval #3"
      "5"	"Elvira"	"interval #3"
      "7"	"Peter"	"interval #3"
      "3"	"Kate"	"interval #3"

### Exercise 08
Checks for the file day00_ex08.sql
- The SQL script looks like below.

      select *
      from person_order
      where id % 2 =0
      order by id;

- The result is below (raw ordering should be the same like below)

      "2"	"1"	"2"	"2022-01-01"
      "4"	"2"	"9"	"2022-01-01"
      "6"	"4"	"16"	"2022-01-07"
      "8"	"4"	"18"	"2022-01-07"
      "10"	"4"	"7"	"2022-01-08"
      "12"	"5"	"7"	"2022-01-09"
      "14"	"7"	"3"	"2022-01-03"
      "16"	"7"	"4"	"2022-01-05"
      "18"	"8"	"14"	"2022-01-07"
      "20"	"9"	"6"	"2022-01-10"

### Exercise 09
Checks for the file day00_ex09.sql
- The SQL script looks like below.

      select (select name from person p where p.id = pv.person_id) as person_name,
         (select name from pizzeria p where p.id = pv.pizzeria_id) as pizzeria_name
      from (select *
         from person_visits pv
          where visit_date between '2022-01-07' and '2022-01-09') as pv
      order by 1 asc, 2 desc

- The result is below (raw ordering should be the same like below)

       "Denis"	"DinoPizza"
       "Denis"	"Best Pizza"
       "Dmitriy"	"Papa Johns"
       "Dmitriy"	"Best Pizza"
       "Elvira"	"Dominos"
       "Elvira"	"DinoPizza"
       "Irina"	"Dominos"
       "Nataly"	"Papa Johns"
