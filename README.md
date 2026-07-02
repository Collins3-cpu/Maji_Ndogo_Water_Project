**Maji Ndogo Water Project (Maji_Ndogo_Water_Project.sql)**
Uses the Raw Database File md_water_services.sql that contains the database from which the Analysis queries were made.
   
Project Overview

This is a full-cycle SQL data analysis project that simulates a real-world humanitarian data challenge:
Helping the government and NGO of the fictional country Maji Ndogo solve its severe water access crisis using a database of 60,000+ field survey records.
Working as a data analyst on President Aziza Naledi’s task force, I used MySQL to clean, explore, and derive actionable insights
from the md_water_services database (tables: location, visits, water_source, well_pollution, employee, etc.).
The goal was not just to query data, but to transform raw survey results into prioritized recommendations that would determine where infrastructure upgrades should be made first.
The project scope encompassed both Part 1 (Exploratory Analysis & Data Cleaning) and Part 2 (Honouring Workers, Location Analysis, Queue Behaviour, and Strategic Insights).
The Story & Business Impact
Maji Ndogo has 27.6 million citizens relying on wells, rivers, shared taps, and taps in homes.
Many sources are broken, contaminated, or cause hours-long queues, especially in rural areas (60% of all sources).


By systematically analysing the survey data, I uncovered:

•	Which water sources serve the most people (and should be fixed first)

•	Where contamination is hidden behind incorrect "Clean" labels

•	How queue times vary by day and hour — revealing cultural and behavioural patterns

•	Which field workers visited the most sites (to recognise top performers)

•	Geographic distribution of water sources across provinces and rural vs urban areas

•	Practical recommendations for infrastructure improvement priorities
The final insights were compiled into a data-driven story that can be presented directly to decision-makers.

Key Skills Demonstrated

•	Data Cleaning & Integrity → Corrected misclassified well pollution records (biological > 0.01 but labelled "Clean"),
 Generated 200+ employee email addresses programmatically, fixed malformed phone numbers with RTRIM()
 
•	Advanced SQL Techniques → Window functions (RANK(), DENSE_RANK(), OVER (PARTITION BY ...)),
  Dynamic email generation using CONCAT(), LOWER(), REPLACE(), Complex date/time analysis with DAYNAME(), TIME_FORMAT(), TIMESTAMPDIFF(),
  Pivot-style reports using CASE statements, Aggregation, grouping, and subqueries.
  
•	Exploratory Data Analysis & Insight Generation → Population served by source type (with % of total),
 Prioritization ranking of infrastructure upgrades, Queue time heatmaps by day and hour (revealed Saturday queues are ~2× longer than weekdays),
 Rural vs urban water access disparity
 
•	Communication & Storytelling → Turned technical queries into clear, actionable insights for non-technical stakeholders (president, auditors, engineers)


 Key Insights 
 
a)Rural dominance:  

b)Shared taps dominate:

c)Hidden contamination:	 

d)Queue patterns:	             

 Key Findings
 
a)60% of water sources are rural. 

b)43% of the population relies on shared taps. 

c)26 wells marked "Clean" despite biological contamination.

d)Saturday queues average 2× longer; peak at 06:00 & 17:00–18:00.

 Recommendations
 
a)Focus improvement budget on rural infrastructure

b)The highest improvement ROI comes from upgrading high-traffic shared taps

c)Corrected records → prevented health risks

d)Consider weekend water tankers or staggered collection schedules



