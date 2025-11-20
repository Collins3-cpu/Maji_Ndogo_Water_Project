📁 Project Files Overview
1. Maji Ndogo Water Project
Project Overview
This is a full-cycle SQL data analysis project that simulates a real-world humanitarian data challenge:
Helping the government and NGO of the fictional country Maji Ndogo solve its severe water access crisis using a database of 60,000+ field survey records.
Working as a data analyst on President Aziza Naledi’s task force, I used MySQL to clean, explore, and derive actionable insights
from the md_water_services database (tables: location, visits, water_source, well_pollution, employee, etc.).
The goal was not just to query data, but to transform raw survey results into **prioritized recommendations that would determine where infrastructure upgrades should be made first. **
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

Skills Demonstrated
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

 Finding
a)60% of water sources are rural.  
b)43% of the population relies on shared taps. 
c)26 wells marked "Clean" despite biological contamination.
d)Saturday queues average 2× longer; peak at 06:00 & 17:00–18:00.

 Recommendation
a)Focus improvement budget on rural infrastructure
b)The highest improvement ROI comes from upgrading high-traffic shared taps
c)Corrected records → prevented health risks
d)Consider weekend water tankers or staggered collection schedules



2. 🔍 Data Cleaning in SQL
File: Data Cleaning in SQL.sql
Dataset: National Housing (PortfolioProject.dbo.[National Housing])

Key Tasks:

Convert SaleDate to a proper ConvertedDate format.

Fill in missing PropertyAddress using ParcelID matches.

Split PropertyAddress and OwnerAddress into structured columns.

Standardize SoldAsVacant values from 'Y/N' to 'Yes/No'.

Remove duplicates based on key columns.

Drop unused columns (OwnerAddress, PropertyAddress, SaleDate, TaxDistrict).

3. 🦠 COVID Portfolio Project
File: COVID Portfolio Project.sql
Datasets: CovidDeaths$ and CovidVaccinations$

Analyses Performed:

Kenya: Death rate, infection percentage.

Global: Highest infection rates, total deaths by continent and country.

Vaccination trends using CTEs.

Prebuilt views for visualization:

deaths_vs_cases, cases_vs_population

countries_infection_rate, countries_death_count

Deaths_by_Continents, global_numbers

4. 🔗 Data Correlation in Python
File: Data Correlation in Python.ipynb
Dataset: movies.csv

Analysis Includes:

Load and inspect data with pandas.

Use of numpy, seaborn, matplotlib for visualizations.

Compute and plot correlation matrix (Pearson).

Key Insights:

budget vs gross: 0.74

votes vs gross: 0.63

Visuals: Heatmaps, scatter plots.

5. 📊 Power BI Data Visualization
File: Power Bi Data Visualization..pbip

Description:
A Power BI report file showcasing interactive data dashboards (dataset referenced in .Report file). Auto-recovery enabled.

6. 🧾 Embu County Business Permit Revenue Analysis
File: Embu County Business Permit Revenue Analysis.ipynb

Objectives:

Analyze business permit revenues over time.

Identify top sectors and regional trends.

Deliver policy-relevant insights via visualizations.

Tools Used:

Python (pandas, numpy)

Visuals with matplotlib, seaborn

Interactive analysis via Jupyter Notebook

Visual Outputs:

Revenue trends by sector and region

Growth comparison charts

Heatmaps of permit distribution

Potential Applications:

Support evidence-based policy on licensing

Guide investment and planning decisions

7. 🚴‍♂️ Bike Sales Analysis Project
File: Excel Project - Colins.xlsx

Excel Sheets Breakdown:

bike_buyers: Raw data (demographics, lifestyle, bike purchases)

Work sheet: Cleaned data with age brackets (Adolescent, Middle Aged, Old)

Pivot Table: Insights including:

Income vs bike purchases by gender

Commute distance and purchase rate

Age group breakdown of buyers

Dashboard: Placeholder for visual representation (charts to be created)

🚀 How to Use This Repository
✅ SQL Scripts
Requirements: SQL Server or compatible DBMS with PortfolioProject schema

How to Run: Open in SSMS or Azure Data Studio and execute script

Output: Cleaned datasets, analytical views for reporting

✅ Python Notebook
Requirements: Python 3.12+, Jupyter Notebook, pandas, numpy, matplotlib, seaborn

How to Run: Open .ipynb in Jupyter and run cell-by-cell

Output: Correlation matrices, insights, charts

✅ Power BI Report
Requirements: Power BI Desktop

How to Run: Open .pbip file to interact with dashboards

Output: Visual exploration of dataset

✅ Excel Project
Requirements: Microsoft Excel

How to Use: Explore pivot tables and build visual dashboard

Output: Summary insights on buyer behavior and demographics

📬 Contact
Feel free to reach out for collaborations, feedback, or project discussions.
