--- Output a list of staff members who were born in 1957, ordered from oldest to youngest,
--- giving their full names written as “[first name] [surname]” and their dates of birth.

SELECT
		people_id,
		"[" || people_first_name || "]"  || "[" || people_surname || "]"  ,
		people_email,
		people_telephone,
		people_dob,
		people_band,
		people_specialty
FROM 
		people
WHERE 
		DATE(people_dob) BETWEEN "1957-01-01" AND "1957-12-31" 
ORDER BY
		DATE(people_dob)
		
		
