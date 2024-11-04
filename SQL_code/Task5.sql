--- Output the number of each staff type (consultant, doctor, health care assistant, nurse)
--- working each shift for the emergency department ward (ED) on 1 May 2024.

SELECT 
	people.people_band,
	band.band_type,
	allocation.allocation_date,
	allocation.allocation_ward,
	COUNT(band.band_type) AS num_of_staff
FROM
    people
LEFT JOIN
    band
	ON band.band_id = people.people_band
LEFT JOIN
    allocation
	ON
	allocation.allocation_people_id = people.people_id
WHERE
    allocation.allocation_ward = "ED"
	AND allocation.allocation_date = "2024-05-01"
GROUP BY
    band.band_type
ORDER BY
    CASE    band.band_type    --- in general, to make the order consistent with the question described, 
	    WHEN  "Consultant" THEN 1 --- we may use CASE command.
		WHEN  "Doctor" THEN 2  --- to make it easier, we can also use alphabetic order aka
		WHEN  "Health Care Assistant"  THEN 3 --- " band.band_type  ASC"
		ELSE 4
	END

	
		
	
    

	