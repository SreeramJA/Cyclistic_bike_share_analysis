Introduction
Welcome to the Cyclistic bike-share analysis case study! This case study is part of the Google Data Analytics Professional Certificate – Capstone Project, where the objective is to apply the end-to-end data analysis process to a real-world dataset.
In this case study, I take on the role of a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. along with some key team members. The goal of this analysis is to answer key business questions that will support the marketing team in designing strategies to convert casual riders into annual members, thereby driving long term growth for the company.
 In order to answer the business questions, I will be following the data analyst process framework: Ask, Prepare, Process, Analyse, Share, and Act. This structured framework ensures that the analysis remains systematic, transparent and aligned with the business objectives.
Stakeholders & Team
•	Lily Moreno – Director of Marketing: Lily Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels. 
•	Cyclistic marketing analytics team: A team of data analysts who are responsible for collecting, analysing, and reporting data that helps guide Cyclistic marketing strategy. I am part of such a team. 
•	Cyclistic executive team: The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program. 
About the company
Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day. Cyclistic offers flexibility to its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 



Tools & Technologies used
	SQL (MySQL) 
o	Data Import 
o	Data Cleaning & Transformation
	R Programming Language
o	Data Analysis
o	Data Visualisation
	R packages 
o	tidyverse (dplyr, ggplot2)
o	lubridate
o	skimr
	Github
o	Project documentation & Portfolio presentation

Stage 1 - ASK:
Statement of Problem
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. However, there was an active opportunity to increase profitability & drive future growth of the company. Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. The director of marketing believes that maximizing the number of annual members will be key to future growth. For this purpose, the data analyst team must understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. The director of marketing and her team are also interested in analysing the Cyclistic’s historical bike trip data to identify trends. 
From the insights of the analysis, the team will Design marketing strategies aimed at converting casual riders into annual members. But first, Cyclistic executives must approve the recommendations, so they must be backed up with compelling data insights and professional data visualisations.
Business Task 
The core business question for this case study is – How do casual riders and annual members differ? By analysing Cyclistic’s historic trip data, the objective is to generate insights that will help the marketing team design strategies to encourage casual riders to transition into annual members. The findings from this analysis will help inform a targeted marketing approach aimed at increasing annual memberships and supporting Cyclistic’s long-term growth. The analysis will be presented in a report, which will include documentation of data sources, data cleaning and transformation steps, core analysis, data visualizations, key findings, and recommendations based on the analysis.
Stage 2 - PREPARE:
Data Sources & Collection
The dataset used in this analysis was extracted from the Cyclistic’s archived trip data. This data can be obtained through the divvy-tripdata source and has been made available by Motivate International Inc. under this license. For the purpose of this project, I used the data within the timeframe of Jan 2025 to Dec 2025 (Past 1 year data) to analyse and identify trends. This public data covers one full year of bike-share activity and can be used to explore how different user segments are using Cyclistic bikes. 
1.	Data timeframe - January 2025 to December 2025
2.	Source data description –
I.	The data contains of 12 individual CSV files, each representing one month of trip data.
II.	Each file contains trip data and they share consistent column structures.
3.	Personally Identifiable Information (PII) were excluded from the dataset, ensuring compliance with privacy standards.
4.	After preliminary assessments, the data meets the ROCCC (Reliable, Original, Comprehensive, Current and Cited) standards.

Stage 3 - PROCESS:
Data Processing Workflow: -
The data processing phase consisted of the following steps
•	Data Import - Data importing & combining
•	Data Cleaning & Transformation – Data Cleaning, transformation & validation
The data was cleaned, transformed and validated in the course of these phases ensuring data integrity and consistency.
The first step for any data process is to explore the original data in order to identify the key metrics and parameters. It is crucial to get a feel of the data and understand what each fields mean and why they matter.
Data Import 
The 12 individual CSV files were imported & combined into a single table named `bike_share_2025_raw`.
The table ultimately contains the aggregate of all records from the 12 individual CSV files holding the Cyclistic bike share data.
SQL queries were used to merge the data and validate all records.
Data Cleaning & Transformation
Here, the data was cleaned & transformed to ensure reliability, integrity & consistency.
Key tasks included:
o	Data type conversion
o	Data type validation & integrity check
o	Creation of derived variables required for analysis	
o	Identifying and removing inconsistent records and outliers from the dataset
These data cleaning tasks ensured that the dataset was ready for analytical exploration.

STAGE 4- ANALYSE
The analyse stage focuses on identifying patterns, trends, and behavioural differences between Cyclistic’s two user segments.
The cleaned dataset was exported to CSV and analysed in R Programming language.
To improve interpretability, the day of the week and month variables were converted into ordered factors. This allowed the data to be analysed and visualised with more clarity and ensured the chronological order was preserved in the charts.
During this stage: 
o	Key metrics were calculated
o	User behaviour patterns were examined
o	Comparative analysis between user segments were performed
These analyses help reveal how casual riders and annual members interact differently with the bike-share service.
STAGE-5-SHARE
Once the analysis was completed, the insights were communicated through data visualisations. Visualisations play a critical role in making complex data easier to understand and interpret for stakeholders.
The charts in the Data visualisation script were created using ggplot2 in R, focusing on clarity and business relevance.
The visualisations highlight patterns such as:
o	Differences in ride duration
o	Variations in weekday vs weekend usage
o	Seasonal riding trends
o	Bike type preferences

	R script for visualisations
Each visualisation was designed with a user-centric approach, ensuring that the findings could be easily understood and interpreted by decision-makers.
Key Findings:
	Annual members generated the majority of total rides, indicating that the annual subscribers form the core user base of Cyclistic platform.
	Casual riders recorded longer average ride durations compared to annual members suggesting that casual riders primarily utilise the service for leisure or recreational purposes.
	Annual members recorded shorter but more frequent ride patterns, suggesting that their usage is more likely associated with routine travel or commuting.
	Electric bikes accounted for the majority of total rides made by both the user segments. This is true on an individual and combined user segment basis.
	Classic bikes recorded longer average ride durations than electric bikes. This is true for both the user segments.
	Weekly riding behaviour showed clear differences between user segments:
o	Annual members displayed consistent weekday usage patterns.
o	Casual riders showed higher weekend activity.
	Seasonal trends were evident in monthly ride activity, with significantly higher ride volumes observed during summer and lower activity during winter. This pattern is applicable to both the user segments.
	Daily bike ride frequency differs across user segments:	
o	Annual members show noticeable peaks during typical commuting hours.
o	Casual riders display higher activity during midday and evening periods.
o	These findings strengthen the initial assessment that annual members may utilise the service for routine travel / commuting and casual riders for leisure or recreational purposes.

STAGE 6 - ACT
Based on the patterns and trends identified during the analysis, several strategic opportunities emerge for Cyclistic to encourage casual riders to transition into annual members.

	Target Casual riders with membership incentives for longer rides in particular or in relation to leisure or recreational activities.
	Launch marketing campaigns during peak leisure periods, particularly weekends where casual rider activity is at its highest.
	Promote the benefit, convenience and long-term value of membership, especially to casual riders who take frequent trips.
	Leverage peak season demand by introducing various membership schemes during high activity months.
	Implement targeted membership promotional campaigns offering incentives to casual riders who frequently use classic bikes for longer trips. These schemes can highlight the health and fitness benefits of cycling while encouraging continued usage and potentially motivating these riders to transition into annual memberships.
Conclusion
Overall, the analysis reveals distinct behavioural differences between Casual riders and Annual members. Casual riders tend to take longer, leisure-oriented bike trips, while Annual members demonstrate shorter and more consistent ride patterns, likely associated with daily commuting. 
By leveraging these insights and recommendations, Cyclistic can implement targeted marketing strategies that encourage casual riders to transition into annual members, ultimately supporting the long term growth and customer retention.
Limitations
1.	The dataset does not include demographic data or PII’s, limiting deeper analysis on customer segments.
2.	The analysis is based on historical data and does not capture customer motivations behind ride behaviour.
3.	The project does not include geographical analysis of the dataset, limiting insights on the geographical aspects of trip data.
More data on customer segments, rider profiles etc can open doors to a deeper analysis and welcome more insights needed for decision-making.

