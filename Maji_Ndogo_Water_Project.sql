-- PART1
USE `md_water_services`;

-- Some of the field surveyors had marked wells as Clean in
-- the results column because the description had the word “Clean” in it, even though they have a biological contamination. So we need
-- to find all the results that have a value greater than 0.01CFU/mL in the biological column and have been set to Clean in the results column
SELECT * 
FROM well_pollution
WHERE results LIKE '%clean%'
AND biological >0.01

-- We need to update the results column from Clean to Contaminated: Bi
-- ological where the biological column has a value greater than 0.01CFU/mL. 
-- The source Ids were obtained from the query above.
UPDATE well_pollution
SET results='Contaminated Biological'
WHERE source_id IN ('AkRu08936224',
'SoRu38011224',
'AkKi00955224',
'KiHa22929224',
'AkLu02307224',
'AmAb09197224',
'AkRu08599224',
'AkKi01423224',
'AkRu08367224',
'HaSe21137224',
'KiRu29323224',
'AkKi00919224',
'SoBa31600224',
'SoRu36080224',
'AmRu13112224',
'AkLu01944224',
'AkRu04015224',
'AkRu06169224',
'HaDe16475224',
'AkRu07663224',
'AkRu03813224',
'KiAm22599224',
'AkRu08317224',
'SoIl32332224',
'AkRu07715224',
'AmDa11377224')
AND biological>0.01
-- Confirm no records have the word “Clean” in the results, even though they have a biological contamination(>0.01CFU/mL).
SELECT * 
FROM well_pollution
WHERE results LIKE '%clean%'
AND biological >0.01

-- PART2
-- We need to fill the email address table for the emmployees. 
-- We can determine the email address for each employee by: 
-- selecting the employee_name column
-- replacing the space with a full stop
-- make it lowercase and stitch it all together
SELECT
CONCAT(LOWER(REPLACE(employee_name, ' ','.')),'@ndogowater.gov') AS new_email
FROM
employee;
 
-- Update the Employee table and fill the email column
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),'@ndogowater.gov')
WHERE isnull(assigned_employee_id)=0

-- confirm emails have been added correctly
SELECT email
FROM employee
LIMIT 5;

-- The phone numbers should be 12 characters long, consisting of the plus sign, 
-- area code (99), and the phone number digits. However, when we use
-- the LENGTH(column) function, it returns 13 characters,
-- indicating there's an extra character.
SELECT LENGTH(phone_number)
FROM employee
LIMIT 10

-- correcting the issue
UPDATE employee
SET phone_number=RTRIM(phone_number) ;

-- Finding out how Many  of the employees live in each town
SELECT DISTINCT town_name,
COUNT(employee_name) OVER (PARTITION BY town_name) AS num_employees
FROM employee
ORDER BY town_name;

-- Extracting the top 3 employees based on most location visits
SELECT assigned_employee_id,visit_count AS number_of_visits
FROM visits
ORDER BY visit_count DESC
LIMIT 3;

-- Extracting the details of the top 3 employees including their names, email, phone number
SELECT employee_name,phone_number,email
FROM employee
WHERE assigned_employee_id IN(30,10,46);

-- Extracting number of records per town 
SELECT DISTINCT town_name,count(town_name) AS records_per_town
FROM location
GROUP BY town_name;

-- Extracting number of records per province
SELECT DISTINCT province_name,count(province_name) AS records_per_province
FROM location
GROUP BY province_name;
-- From above, Most of the water sources in the survey are situated in small rural communities


-- Extracting number of records grouped in both province and town
SELECT DISTINCT province_name,town_name,count(town_name) AS records_per_town
FROM location
GROUP BY province_name,town_name;

-- Extracting number of records for each location type
SELECT DISTINCT location_type,count(location_type) AS num_sources
FROM location
GROUP BY location_type;
-- From above,60% of our water sources are in rural communities across Maji Ndogo


-- Number of people we surveyed in total
SELECT SUM(Number_of_people_served) AS total_people_served
FROM water_source
-- From above there are about 27.6 million people

-- How many wells, taps and rivers there are
SELECT DISTINCT type_of_water_source, count(type_of_water_source) AS count_of_water_sources
FROM water_source
GROUP BY type_of_water_source;

-- Number of people that share a particular types of water sources on average
SELECT DISTINCT type_of_water_source, ROUND(AVG(Number_of_people_served),0) AS avg_people_served
FROM water_source
GROUP BY type_of_water_source;

-- Number of people getting water from each type of source
SELECT DISTINCT type_of_water_source,SUM(Number_of_people_served) AS sum_people_served
FROM water_source
GROUP BY type_of_water_source;

-- To calculate the percentages using the total we just got
SELECT DISTINCT type_of_water_source,ROUND(((SUM(Number_of_people_served)/27628140)*100),0) AS pct_people_served
FROM water_source
GROUP BY type_of_water_source;

-- Adding a rank based on population served
SELECT DISTINCT type_of_water_source,SUM(Number_of_people_served) AS sum_people_served,RANK() OVER (ORDER BY SUM(Number_of_people_served)DESC)AS rank_of_watersouce
FROM water_source
GROUP BY type_of_water_source;

-- Finding out which shared taps or wells should be fixed first. We add a priority rank
SELECT  source_id,type_of_water_source,number_of_people_served,DENSE_RANK() OVER(ORDER BY Number_of_people_served DESC)AS priority_rank
FROM water_source
LIMIT 20;

-- Finding out How long the survey took
SELECT  TIMESTAMPDIFF(DAY,'2021-01-01 09:10:00','2023-07-14 13:53:00') as survey_time
FROM VISITS
LIMIT 1;
-- From above the survey took 924 days about 2.5 years

 -- The average total queue time for water
SELECT ROUND(AVG(time_in_queue),0) AS avg_queue_time
FROM visits
WHERE time_in_queue<>0;
-- From above average queuing time for water is 123 min about 2hrs

-- The average queue time on different days
SELECT DISTINCT DAYNAME(time_of_record),ROUND(AVG(time_in_queue))  AS avg_queue_time 
FROM visits
WHERE time_in_queue<>0
GROUP BY DAYNAME(time_of_record);
-- From above, Saturdays have much longer queue times compared to the other days


 -- What time during the day people collect water. 
SELECT DISTINCT TIME_FORMAT(TIME(time_of_record),'%H:00' )AS hour_of_day,ROUND(AVG(time_in_queue))  AS avg_queue_time 
FROM visits
WHERE time_in_queue<>0  -- exludes other sources with 0 queue times
GROUP BY TIME_FORMAT(TIME(time_of_record),'%H:00' )
ORDER BY ROUND(AVG(time_in_queue))DESC ;
 -- From above, Mornings and evenings are the busiest? It looks like people collect water before and after work.


-- Breaking down the queue times for each hour of each day
SELECT
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END
 ),0) AS Sunday,
 ROUND(AVG(
 CASE
 WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
 ELSE NULL
 END
 ),0) AS Monday,
 ROUND(AVG(
 CASE
 WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
 ELSE NULL
 END
 ),0) AS Tuesday,
 ROUND(AVG(
 CASE
 WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
 ELSE NULL
 END
 ),0) AS Wednesday,
 ROUND(AVG(
 CASE
 WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
 ELSE NULL
 END
 ),0) AS Thursday,
 ROUND(AVG(
 CASE
 WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
 ELSE NULL
 END
 ),0) AS Friday,
 ROUND(AVG(
 CASE
 WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
 ELSE NULL
 END
 ),0) AS Saturday
 FROM
 visits
 WHERE
 time_in_queue != 0 -- this excludes other sources with 0 queue times
 GROUP BY
 hour_of_day
 ORDER BY
 hour_of_day;
 
-- From the query above we see that:
-- Queues are very long on a Monday morning and Monday evening as people rush to get water.
-- Wednesday has the lowest queue times, but long queues on Wednesday evening.
-- People have to queue pretty much twice as long on Saturdays compared to the weekdays. 
-- It looks like people spend their Saturdays queueing for water, perhaps for the week's supply.
-- The shortest queues are on Sundays, and this is a cultural thing. 
-- The people of Maji Ndogo prioritise family and religion, so Sundays are spent with family and friends