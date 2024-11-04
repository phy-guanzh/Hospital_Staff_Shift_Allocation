--- Output the total number of hours worked by each type of staff member (health care
--- assistant, nurse, doctor, consultant) for each month from January to August 2024.

---  Here we apply a Common Table Expression which has better readability and maintainability compared to Nested Query

WITH  computed_hours AS (
    SELECT
	    allocation.allocation_ID,
	    CASE
		WHEN  shift.shift_end > shift.shift_start  
		THEN ( strftime("%H",shift.shift_end)- strftime("%H",shift.shift_start))  --- Here we use strftime to get the corresponding time for SQLite, which can also be used in 
		ELSE  ( strftime("%H",shift.shift_end)+24 - strftime("%H",shift.shift_start))  --- the next question7. eg hours -> %H,minites -> %M, year ->%y, month ->%m, day -> %d
	    END AS hours
	FROM   allocation
    LEFT JOIN
    shift
	ON shift.shift_id = allocation.allocation_shift
)

SELECT
	--- people.people_band,
	band.band_type,
	strftime("%m",allocation_date) AS months,
	SUM(hours) AS total_hours
FROM
    allocation
LEFT JOIN
    people
	ON allocation.allocation_people_id =  people.people_id
LEFT JOIN
    band
	ON band.band_id = people.people_band
LEFT JOIN
    shift
	ON shift.shift_id = allocation.allocation_shift
LEFT JOIN
    computed_hours
	ON computed_hours.allocation_ID = allocation.allocation_ID
GROUP BY
    band.band_type,months
ORDER BY            ---- define the order to meet the requirement of question
    CASE band_type 
		WHEN "Health care assistant" THEN 1
		WHEN "Nurse" THEN 2
		WHEN "Doctor" THEN 3
		WHEN "Consultant" THEN 4
	END
	