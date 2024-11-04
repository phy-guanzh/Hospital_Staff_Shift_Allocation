--- Output the total number of hours that the staff member with ID number 10566 has
--- worked in the given time period. You can assume that each shift lasts for 8 hours.

SELECT
		allocation_people_id AS peopleID,
		COUNT(allocation_ID) AS allocation_times,
		COUNT(allocation_ID)* 8  AS allocation_hours
FROM 
		allocation
WHERE 
		allocation_people_id = 10566
GROUP BY
		allocation_people_id
		
		