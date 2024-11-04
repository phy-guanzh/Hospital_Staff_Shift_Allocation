--- The hospital spotted suspicious behaviour on the Orthopaedic Wards (OR1 and OR2)
--- on the following shifts: evening 19 January 2024; morning 7 April 2024; morning 21
--- June 2024; evening 27 August 2024. Return the name(s) of any staff members who have
--- worked on all four of these shifts in either OR1 or OR2. Do not return the names of
--- staff members who have only worked on one or two of these shifts.

SELECT 
	people.people_id,
	"[" || people.people_first_name || "]"  || "[" || people.people_surname || "]"  AS full_name,
	ward.ward_specialty,
	COUNT(
	DISTINCT CASE
		WHEN (allocation_date = "2024-01-19" AND allocation_shift = "Evening")  THEN "2024-01-19_Evening"
		WHEN (allocation_date = "2024-04-07" AND allocation_shift = "Morning") THEN "2024-04-07_Morning"
		WHEN (allocation_date = "2024-06-21" AND allocation_shift = "Morning") THEN "2024-06-21_Morning"
		WHEN (allocation_date = "2024-08-27" AND allocation_shift = "Evening") THEN "2024-08-27_Evening"
	END) AS total_days
FROM
	allocation
LEFT JOIN
	people
	ON allocation.allocation_people_id = people.people_id
LEFT JOIN
	ward
	ON ward.ward_id = allocation.allocation_ward
WHERE 
	((allocation_date = "2024-01-19" AND allocation_shift = "Evening") 
	OR (allocation_date = "2024-04-07" AND allocation_shift = "Morning")
	OR (allocation_date = "2024-06-21" AND allocation_shift = "Morning")
	OR (allocation_date = "2024-08-27" AND allocation_shift = "Evening")) 
	AND ward.ward_specialty = "Orthopaedics"
GROUP BY
	people.people_id
HAVING
	total_days ==4



	

	
	
