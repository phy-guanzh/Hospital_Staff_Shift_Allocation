WITH personal_salary AS (
	SELECT 
		allocation.allocation_people_id,
		COUNT(allocation_shift) AS times,
		people_specialty,
		people_band,
		band_salary,
		ROUND(band_salary/230,4)  AS band_salary_pershift 
	FROM 
		allocation
	LEFT JOIN
		people
		ON people.people_id = allocation.allocation_people_id
	LEFT JOIN
		band
		ON band.band_id = people.people_band
	GROUP BY
		allocation.allocation_people_id )
		
SELECT 
	personal_salary.people_specialty,
    SUM( personal_salary.times*personal_salary.band_salary_pershift) AS total_expenses
FROM 
	personal_salary
 GROUP BY 
	personal_salary.people_specialty