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
Checks for the file day03_ex00.sql
- The SQL script looks like below.

      select pizza_name, price, p.name as pizzeria_name, pv.visit_date
      from menu inner join pizzeria p on p.id = menu.pizzeria_id
      inner join person_visits pv on p.id = pv.pizzeria_id
      inner join person p2 on p2.id = pv.person_id
      where price between 800 and 1000 and p2.name = 'Kate'
      order by 1,2,3

- The result is below (raw ordering should be the same like on a screen below)

      "cheese pizza"	"950"	"DinoPizza"	"2022-01-04"
      "pepperoni pizza"	"800"	"Best Pizza"	"2022-01-03"
      "pepperoni pizza"	"800"	"DinoPizza"	"2022-01-04"
      "sausage pizza"	"1000"	"DinoPizza"	"2022-01-04"
      "supreme pizza"	"850"	"Best Pizza"	"2022-01-03"

### Exercise 01
Checks for the file day03_ex01.sql
- The SQL script looks like below.

      select id as menu_id
      from menu
      except
      select menu_id
      from person_order
      order by 1

- The result is below (raw ordering should be the same like below)

      "5"
      "10"
      "11"
      "12"
      "15"

### Exercise 02
Checks for the file day03_ex02.sql
- The SQL script looks like below.

      select pizza_name, price, p.name
      from (
      select id as menu_id
      from menu
      except
      select menu_id
      from person_order) as t1 inner join menu on t1.menu_id = menu.id
      inner join pizzeria p on p.id = menu.pizzeria_id
      order by 1,2

- The result is below (raw ordering should be the same like below)

      "cheese pizza"	"700"	"Papa Johns"
      "cheese pizza"	"780"	"DoDo Pizza"
      "cheese pizza"	"950"	"DinoPizza"
      "sausage pizza"	"950"	"Papa Johns"
      "supreme pizza"	"850"	"DoDo Pizza"

### Exercise 03
Checks for the file day03_ex03.sql
- The SQL script looks like below.

      (select p2.name as pizzeria_name
      from person p inner join person_visits pv on p.id = pv.person_id
          inner join pizzeria p2 on p2.id = pv.pizzeria_id
      where p.gender = 'female'
      except all
      select p2.name
      from person p inner join person_visits pv on p.id = pv.person_id
          inner join pizzeria p2 on p2.id = pv.pizzeria_id
      where p.gender = 'male')
      union all
      (select p2.name
      from person p inner join person_visits pv on p.id = pv.person_id
          inner join pizzeria p2 on p2.id = pv.pizzeria_id
      where p.gender = 'male'
      except all
      select p2.name
      from person p inner join person_visits pv on p.id = pv.person_id
          inner join pizzeria p2 on p2.id = pv.pizzeria_id
      where p.gender = 'female')
      order by 1

- The result is below (raw ordering should be the same like below)

      "Best Pizza"
      "Dominos"
      "Papa Johns"

### Exercise 04
Checks for the file day03_ex04.sql
- The SQL script looks like below.

      (select p2.name as pizzeria_name
      from person p inner join person_order pv on p.id = pv.person_id
          inner join menu on menu.id = pv.menu_id
          inner join pizzeria p2 on p2.id = menu.pizzeria_id
      where p.gender = 'female'
      except
      select p2.name
      from person p inner join person_order pv on p.id = pv.person_id
          inner join menu on menu.id = pv.menu_id
          inner join pizzeria p2 on p2.id = menu.pizzeria_id
      where p.gender = 'male')
      union
      (select p2.name
      from person p inner join person_order pv on p.id = pv.person_id
          inner join menu on menu.id = pv.menu_id
          inner join pizzeria p2 on p2.id = menu.pizzeria_id
      where p.gender = 'male'
      except
      select p2.name
      from person p inner join person_order pv on p.id = pv.person_id
          inner join menu on menu.id = pv.menu_id
          inner join pizzeria p2 on p2.id = menu.pizzeria_id
      where p.gender = 'female')
      order by 1

- The result is below (raw ordering should be the same like below)

        "Papa Johns"

### Exercise 05
Checks for the file day03_ex05.sql
- The SQL script looks like below.

       select p2.name
      from person_visits inner join person p on p.id = person_visits.person_id
          inner join pizzeria p2 on p2.id = person_visits.pizzeria_id
      where p.name = 'Andrey'
      except
      select p2.name
      from person_order inner join person p on p.id = person_order.person_id
          inner join menu m on m.id = person_order.menu_id
          inner join pizzeria p2 on p2.id = m.pizzeria_id
      where p.name = 'Andrey'
      order by 1

- The result is below (raw ordering should be the same like below)

       "Pizza Hut"

### Exercise 06
Checks for the file day03_ex06.sql
- The SQL script looks like below.

        select m1.pizza_name, p1.name as pizzeria_name_1, p2.name as pizzeria_name_2, m1.price
          from menu m1 inner join  menu m2 on m1.id <> m2.id and m1.price = m2.price and m1.pizzeria_id > m2.pizzeria_id and
          m1.pizza_name = m2.pizza_name
          inner join  pizzeria p1 on m1.pizzeria_id = p1.id
          inner join  pizzeria p2 on m2.pizzeria_id = p2.id
          order by 1

- The result is below (raw ordering should be the same like below)

    cheese pizza	Best Pizza	Papa Johns	700
    pepperoni pizza DinoPizza Best Pizza  800
    supreme pizza	Best Pizza	DoDo Pizza	850


### Exercise 07
Checks for the file day03_ex07.sql
- The SQL script looks like below.

       insert into  menu(id,pizzeria_id,pizza_name,price) values (19,2, 'greek pizza', '800')

- The check script is below.

       select count(*)=1 as check
       from menu
       where id = 19 and pizzeria_id=2 and pizza_name = 'greek pizza' and price=800

- The result is below

      true

### Exercise 08
Checks for the file day03_ex08.sql
- The SQL script looks like below.

      insert into  menu(id,pizzeria_id,pizza_name,price) values
      ((select max(id)+1 from menu),(select id from pizzeria where name = 'Dominos'), 'sicilian pizza' ,900)

- The check script is below.

       select count(*)=1 as check
       from menu
       where id = 20 and pizzeria_id=2 and pizza_name = 'sicilian pizza' and price=900

- The result is below

      true

### Exercise 09
Checks for the file day03_ex09.sql
- The SQL script looks like below.

      insert into  person_visits(id, person_id, pizzeria_id, visit_date) values
      ((select max(id)+1 from person_visits), (select id from person where name = 'Denis'),
      (select id from pizzeria where name = 'Dominos'), '2022-02-24')
      insert into  person_visits(id, person_id, pizzeria_id, visit_date) values
      ((select max(id)+1 from person_visits), (select id from person where name = 'Irina'),
      (select id from pizzeria where name = 'Dominos'), '2022-02-24')

- The check script is below.

       select count(*)=2 as check
       from person_visits
       where visit_date = '2022-02-24' and person_id in (6,4) and pizzeria_id=2;

- The result is below

       true

### Exercise 10
Checks for the file day03_ex10.sql
- The SQL script looks like below.

      insert into  person_order(id, person_id, menu_id, order_date) values
      ((select max(id)+1 from person_order), (select id from person where name = 'Denis'),
      (select id from menu where pizza_name = 'sicilian pizza'), '2022-02-24')

      insert into  person_order(id, person_id, menu_id, order_date) values
      ((select max(id)+1 from person_order), (select id from person where name = 'Irina'),
      (select id from menu where pizza_name = 'sicilian pizza'), '2022-02-24')

- The check script is below.

       select count(*)=2 as check
       from person_order
       where order_date = '2022-02-24' and person_id in (6,4) and menu_id=(select id from menu where pizza_name = 'sicilian pizza')

- The result is below

       true

### Exercise 11
Checks for the file day03_ex11.sql
- The SQL script looks like below.

      update menu
      set price = price-price*0.1
      where pizza_name ='greek pizza'

- The check script is below.

       select (800-800*0.1) = price as check
       from menu
       where pizza_name ='greek pizza'

- The result is below (raw ordering should be the same like below)

       true

### Exercise 12
Checks for the file day03_ex12.sql
- The SQL script looks like below.

      insert into person_order(id,person_id,menu_id,order_date)
      select
          g+(select max(id) from person_order) as id,
          id as person_id,
          (select id from menu where pizza_name = 'greek pizza') as menu_id,
          '2022-02-25' as order_date
      from person inner join
      generate_series(1,(select count(*) from person)) as g on g= person.id

- The check script is below.

       select count(*)=9 as check
       from person_order
       where order_date='2022-02-25' and menu_id = (select id from menu where pizza_name = 'greek pizza')

- The result is below

       true

### Exercise 13
Checks for the file day03_ex13.sql
- The SQL script looks like below.

      delete from person_order where order_date = '2022-02-25';
      delete from menu where pizza_name = 'greek pizza';

- The check script is below.

       select count(*)=0 as check
       from person_order
       where order_date='2022-02-25' and menu_id = (select id from menu where pizza_name = 'greek pizza')

- The result is below

       true

- The check script is below.

       select count(*)=0 as check
       from menu
       where pizza_name = 'greek pizza'

- The result is below

       true
