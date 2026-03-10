# ============================================================
# Project - Cyclistic Bike Share Analysis
# Script  - 03_data_analysis.R
# Tools   - R, tidyverse, skimr
# Purpose - Data Analysis
# Author  - Sreeram J Anand
# ============================================================

# Setting up my environment
library(tidyverse)
library(skimr)

# Importing the cleaned data from the csv file
bike_share_25 <- read_csv("divvy_bike_share_cleaned_2025.csv")

# Data Preview
head(bike_share_25)
str(bike_share_25)
skim_without_charts(bike_share_25)

# Adding column names to each column
colnames(bike_share_25) <- c(
  "ride_id",
  "rideable_type",
  "started_at",
  "ended_at",
  "start_station_name",
  "start_station_id",
  "end_station_name",
  "end_station_id",
  "start_lat",
  "start_lng",
  "end_lat",
  "end_lng",
  "member_casual",
  "ride_length",
  "day_of_week",
  "month_of_ride"
)

# Data Overview
colnames(bike_share_25)
View(bike_share_25)


# Setting up the day of the week as an ordered factor
bike_share_25$day_of_week <- factor(
  bike_share_25$day_of_week,
  levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"),
  ordered = TRUE
)

# Setting up the month of ride as an ordered factor
bike_share_25$month_of_ride <- factor(
  bike_share_25$month_of_ride,
  levels = c("January","February","March","April","May","June","July","August",
             "September","October","November","December"),
  ordered = TRUE
)


# KEY METRICS OF CYCLISTIC BIKE SHARE DATA
key_metrics <- bike_share_25 %>% 
  summarise(total_rides = n(),
            avg_ride_length = round(mean(ride_length, na.rm = TRUE),2),
            min_ride_length = min(ride_length, na.rm = TRUE),
            max_ride_length = max(ride_length, na.rm = TRUE),
            median_ride_length = median(ride_length, na.rm = TRUE))

print(key_metrics)   


# USER TYPE DISTRIBUTION
user_type_distribution <- bike_share_25 %>% 
                              group_by(member_casual) %>% 
                              summarise(total_rides = n()) %>% 
                              mutate(percentage_of_rides = round(total_rides/sum(total_rides) * 100, 2))

print(user_type_distribution)


# USER TYPE BEHAVIOR ANALYSIS
user_type_behavior <- bike_share_25 %>% 
  group_by(member_casual) %>% 
  summarise(min_ride_duration = min(ride_length, na.rm = TRUE),
            max_ride_duration = max(ride_length, na.rm = TRUE),
            avg_ride_duration = round(mean(ride_length, na.rm = TRUE),2),
            median_ride_duration = median(ride_length, na.rm = TRUE))

print(user_type_behavior)


# BIKE TYPE DISTRIBUTION
bike_type_distribution <- bike_share_25 %>% 
  group_by(rideable_type) %>% 
  summarise(total_rides = n()) %>% 
  mutate(percentage_of_rides = round(total_rides/sum(total_rides) * 100,2))

print(bike_type_distribution)


# BIKE TYPE PREFERENCE ANALYSIS
bike_type_preference <- bike_share_25 %>% 
  group_by(rideable_type,member_casual) %>% 
  summarise(total_rides = n(),
            avg_ride_duration = round(mean(ride_length, na.rm = TRUE),2),
            median_ride_duration = median(ride_length, na.rm = TRUE)) %>% 
  arrange(desc(total_rides))

print(bike_type_preference)


# WEEKLY RIDING BEHAVIOUR ANALYSIS
weekly_usage_pattern <- bike_share_25 %>% 
  group_by(day_of_week, member_casual) %>% 
  summarise(total_rides = n(),
            avg_ride_duration = round(mean(ride_length, na.rm = TRUE),2)) 
 
print(weekly_usage_pattern)


# MONTHLY RIDING BEHAVIOUR ANALYSIS 
monthly_usage_pattern <- bike_share_25 %>% 
  group_by(month_of_ride, member_casual) %>% 
  summarise(total_rides = n(),
            avg_ride_duration = round(mean(ride_length, na.rm = TRUE),2))
            
print(monthly_usage_pattern)


# PEAK DAYS ANALYSIS (SEGMENTED)
peak_days <- bike_share_25 %>% 
  group_by(day_of_week, member_casual) %>% 
  summarise(total_rides = n()) %>% 
  arrange(desc(total_rides))

print(peak_days)

# PEAK MONTHS ANALYSIS (SEGMENTED)
peak_months <- bike_share_25 %>% 
  group_by(month_of_ride,member_casual) %>% 
  summarise(total_rides = n()) %>% 
  arrange(desc(total_rides))

print(peak_months)


# ------------ END OF DATA ANALYSIS SCRIPT ------------