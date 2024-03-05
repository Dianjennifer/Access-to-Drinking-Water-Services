# Access-to-Drinking-Water-Services
This project investigates access to safe and affordable drinking water, focusing on inequalities in service levels between different countries and regions.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Data Source](#data-source)
3. [Data Preparation and Cleaning](#data-preparation-and-cleaning)
4. [Data Analysis](#data-analysis)
5. [Key Insights](#key-insights)
6. [Recommendations](#recommendations)

## Project Overview
### United Nations SDGs Overview
The Sustainable Development Goals (SDGs) are an ongoing global call to action to end poverty, ensure prosperity and peace for all people, and protect our planet. There are 17 goals relating to poverty, health, education, basic services, inequality, climate, peace, and partnership.

### UN SDG 6: Clean Water and Sanitation
United Nations Sustainable Development Goal 6 aims to ensure availability and sustainable management of water and sanitation for all. Due to changes in our climate, droughts are becoming more prevalent, and water supplies are decreasing worldwide. This not only affects access to drinking water but also sanitation and hygiene, often resulting in unnecessary diseases and death. To ensure greater access to water and sanitation, communities across the world need to assist each other in developing and managing water resources.

## Data Source
The data used in this project is sourced from the WHO/UNICEF Joint Monitoring Programme for water supply, sanitation, and hygiene (JMP). The JMP dataset estimates household access to drinking water services between 2000 and 2020 to assess progress toward achieving the sixth SDG

## Data Preparation and Cleaning
The dataset was cleaned using Google Sheets to ensure consistency and remove any irrelevant or erroneous data. The cleaning process involved tasks such as:

* Removing duplicate entries
* Handling missing values
* Standardizing data formats
* Correcting data inconsistencies
* Checking for outlier

## Data Analysis
The cleaned dataset was subjected to various data analysis techniques to extract insights related to access to drinking water. The analysis included:

+ Descriptive statistics to summarize key metrics such as population served, access levels, and disparities.
  Tool used: Google Sheets
![image](https://github.com/Dianjennifer/Access-to-Drinking-Water-Services/assets/127655054/3c4eeb65-aac4-46da-a0a4-c49e0377c42f)

+ Comparative analysis to identify differences in access levels among different countries and regions.
  Tool used: SQL
```sql
SELECT * FROM `sql-project-416009.use_of_water.Estimate of the use of water` ;

--determining the rural population
SELECT *, 
    ((pop_n-pop_u/pop_n)*100) AS pop_r
FROM `sql-project-416009.use_of_water.Estimate of the use of water`;

-- country with the highest national population in 2020
SELECT 
     name, 
     pop_n 
FROM `sql-project-416009.use_of_water.Estimate of the use of water`
   WHERE year= 2020
   ORDER BY pop_n DESC;

--Countries where access to basic water services in the urban region is less tha in the rural in the urban region
SELECT 
    name,
    wat_bas_u,
    wat_bas_r 
FROM `sql-project-416009.use_of_water.Estimate of the use of water`
   WHERE wat_bas_u < wat_bas_r
      AND wat_bas_r IS NOT NULL
      AND year = 2020
      ORDER BY wat_bas_r DESC;

---Water access improvemnt in rural area
SELECT name,wat_unimp_r,wat_unimp_u,
    CASE 
        WHEN wat_unimp_r > wat_unimp_u THEN 'Improved'
        WHEN wat_unimp_r = wat_unimp_u THEN 'No Change'
        ELSE 'Declined'
    END AS water_access_improvement
FROM 
    `sql-project-416009.use_of_water.Estimate of the use of water`
  WHERE year=2015;
```

+ Visualization techniques such as charts and graphs to illustrate trends and patterns in the data.
  Tool used for Visualization: Tableau
![image](https://github.com/Dianjennifer/Access-to-Drinking-Water-Services/assets/127655054/b25f5ba2-92f4-4574-857d-e76dce66ab54)
  
## Key Insights
* Disparities between Urban and Rural Access: The analysis reveals disparities in access to basic water services between urban and rural areas, with some countries exhibiting higher access levels in rural regions. Understanding such disparities is crucial for designing equitable interventions and policies.

* Global Population Trends: SQL queries identified countries with the highest national populations and assessed urban versus rural population growth over time. These insights aid in understanding demographic shifts and their implications for water resource management and service provision.

* Improvements in Water Access: By assessing changes in water access between 2015 and subsequent years, the analysis highlights countries where improvements in access have occurred, stagnated, or declined. This information is vital for monitoring progress towards SDG 6 targets and identifying areas requiring additional support.

## Recommendations
* Investment in Infrastructure: Allocate resources towards improving water infrastructure, particularly in underserved rural areas where access to safe drinking water is limited. This could involve building or upgrading water treatment plants, distribution networks, and storage facilities.
* Targeted Interventions for Vulnerable Groups: Implement targeted programs to address the specific needs of vulnerable groups such as women, children, and marginalized communities who may face greater barriers to accessing safe drinking water. This could involve providing subsidies for water services or implementing special outreach programs.


