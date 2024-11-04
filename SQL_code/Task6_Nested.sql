--- Output the total number of hours worked by each type of staff member (health care
--- assistant, nurse, doctor, consultant) for each month from January to August 2024.

SELECT
    sub.band_type,
	sub.month,
    SUM(sub.hours) AS total_hours
FROM (
    SELECT
        band.band_type,
		strftime("%m",allocation.allocation_date) AS month,
        CASE
            WHEN shift.shift_end > shift.shift_start  
            THEN (strftime("%H", shift.shift_end)-strftime("%H", shift.shift_start))
            ELSE (strftime("%H", shift.shift_end)+ 24 - strftime("%H", shift.shift_start))
        END AS hours
	FROM
        allocation
	LEFT JOIN
        people ON allocation.allocation_people_id = people.people_id
    LEFT JOIN
        band ON band.band_id = people.people_band
    LEFT JOIN
        shift ON shift.shift_id = allocation.allocation_shift
) AS sub
GROUP BY
    sub.band_type, sub.month
ORDER BY            ---- define the order to meet the requirement of question
    CASE band_type 
		WHEN "Health care assistant" THEN 1
		WHEN "Nurse" THEN 2
		WHEN "Doctor" THEN 3
		WHEN "Consultant" THEN 4
	END
	
	
