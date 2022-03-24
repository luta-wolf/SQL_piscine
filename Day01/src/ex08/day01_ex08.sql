SELECT order_date,
	concat(name, ' (age:', age, ')') AS person_information
FROM
	(SELECT person_id AS id, order_date FROM person_order) AS t1
NATURAL JOIN person
ORDER BY order_date , person_information;
