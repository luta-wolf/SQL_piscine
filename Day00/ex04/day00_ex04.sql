SELECT
	concat(name, ' (age:', age, ', gender:‘', gender, '’, address:‘', address,'’)')
	AS person_information FROM person
Order by person_information;
