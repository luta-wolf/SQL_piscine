SELECT order_date,
	concat(name, ' (age:', age, ')') AS person_information
FROM person
INNER JOIN person_order ON person.id = person_id
ORDER BY order_date , person_information;
