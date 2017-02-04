
-- Query 1
--


SELECT `lease_agreement`.`monthly_duration` , `lease_agreement`.`start_date`
FROM lease_agreement
WHERE (
 (
     `lease_agreement`.`monthly_duration` >=4
 )
AND (
   `lease_agreement`.`start_date` = '2016-11-09'
 )
)
LIMIT 0, 30;


-- Query 2
--

SELECT COUNT(apart_no)
FROM apartment
WHERE (
area_sq_feet > 500
);

-- Query 3
--

SELECT `employee`.`monthly_salary` , `technician`.`tech_id` , `tech_skills`.`skills` 
FROM employee 
NATURAL JOIN technician 
NATURAL JOIN tech_skills 
WHERE ( 
( 
`employee`.`monthly_salary` >2000 
) 
AND ( 
`tech_skills`.`skills` LIKE '%elec%' 
) 
) 
GROUP BY `technician`.`tech_id` 
LIMIT 0 , 30;

-- Query 4
--

SELECT `apartment`.`apart_no` , `apartment`.`bedroom_no`  
FROM apartment 
WHERE `apartment`.`bedroom_no` > (  
SELECT AVG( `bedroom_no` )  
FROM apartment );


