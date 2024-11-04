--- Output a list of staff who were working in the Neurology Ward on 1 June 2024 giving
--- their full names written as “[first name] [surname]” without repetition.

SELECT DISTINCT
	people.people_id,
	"[" || people.people_first_name || "]"  || "[" || people.people_surname || "]"  AS full_name,
	allocation_date,
	allocation_ward,
	ward.ward_specialty
FROM
	allocation
LEFT JOIN
	people
	ON people.people_id = allocation_people_id
LEFT JOIN
	ward
	ON allocation.allocation_ward = ward.ward_id
WHERE ward.ward_specialty ="Neurology" AND allocation_date = "2024-06-01"

	

