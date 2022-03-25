SELECT DISTINCT person_name1, person_name2, common_address FROM
	(SELECT DISTINCT person.name AS person_name1, address, ID AS id1 FROM person)
	AS t2
LEFT JOIN
	(SELECT person.name AS person_name2, address AS common_address, ID AS id2 FROM person)
	AS t1 ON common_address = t2.address
WHERE id1 > id2
ORDER BY 1, 2, 3;
