SELECT
	concat(name, ' (age:', age, ', gender:‘', gender, '’, address:‘', address,'’)')
	AS person_information FROM person
Order by person_information;


SELECT
    name || ' (age:' || age || ', gender:''' || gender || ''', address:''' || address || ''')' AS person_information
FROM
    person
ORDER BY
    person_information ASC;
