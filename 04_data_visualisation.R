# ============================================================
# Project - Cyclistic Bike Share Analysis
# Script  - 04_data_visualisation.R
# Tools   - R, tidyverse, ggplot2, lubridate
# Purpose - Data Visualisation
# Author  - Sreeram J Anand
# ============================================================


# Setting up the environment
library(tidyverse)
library(lubridate)

# Importing the cleaned data from the csv file
bike_share_25 <- read_csv("divvy_bike_share_cleaned_2025.csv")

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

# Data Preview
colnames(bike_share_25)
head(bike_share_25)
View(bike_share_25)

# Setting the day of the week as an ordered factor
bike_share_25$day_of_week <- factor(
  bike_share_25$day_of_week,
  levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"),
  ordered = TRUE
)

# Setting the month of ride as an ordered factor
bike_share_25$month_of_ride <- factor(
  bike_share_25$month_of_ride,
  levels = c("January","February","March","April","May","June","July","August",
             "September","October","November","December"),
  ordered = TRUE
)


# DATA VISUALISATIONS 


# 1) USER TYPE DISTRIBUTION GRAPH
user_type_graph <- bike_share_25 %>%
  group_by(member_casual) %>% 
  summarise(total_rides = n()/1000) %>% 
  ggplot(aes(x = member_casual, y = total_rides)) + geom_col(aes(fill = member_casual)) +
  labs(title = "Ride Distribution by User Segment", 
       subtitle = "Comparison of ride volume between casual riders and annual members",
       caption =  "Data Source: Divvy Bike Share 2025",
       fill = "User Segment",
       x = "User Segment",
       y =  "Total Rides (in 1000's)") +
  theme_classic()

print(user_type_graph)
# Annual members make up the core majority of user segments


# 2) AVERAGE RIDE DURATION GRAPH
ride_duration_graph <- bike_share_25 %>% 
  group_by(member_casual) %>% 
  summarise(avg_ride_duration = round(mean(ride_length),2)) %>% 
  ggplot(aes(x = member_casual, y = avg_ride_duration)) + geom_col(aes(fill = member_casual)) +
  labs(title = "Average Ride Duration by User Segment",
       subtitle = "Comparison of average ride duration between casual riders and annual members",
       caption = "Data Source: Divvy Bike Share 2025",
       fill = "User Segment",
       x = "User Segment",
       y = "Avg Ride Duration (min)") +
  theme_classic()

print(ride_duration_graph)    
# Casual riders display a higher average ride duration over annual members


# 3) BIKE TYPE PREFERENCE GRAPH
bike_type_preference_graph <- bike_share_25 %>% 
  group_by(rideable_type, member_casual) %>% 
  summarise(total_rides = n()/1000) %>% 
  ggplot(aes(x = member_casual, y = total_rides)) + geom_col(aes(fill = rideable_type), position = "dodge") + 
  labs(title = "Bike Type Preference Across User Segments",
       subtitle = "Segment wise comparison of bike type adoption between casual riders and annual members",
       caption = "Data Source: Divvy Bike Share 2025",
       fill = "Bike Type",
       x = "User Segment",
       y = "Total Rides (in 1000's)") + 
  theme_classic()

print(bike_type_preference_graph)
# Both the user segments made the most rides with electric bikes


# 4) AVERAGE RIDE DURATION AMONG BIKE TYPE GRAPH
bike_type_ride_time_graph <- bike_share_25 %>% 
  group_by(member_casual, rideable_type) %>% 
  summarise(avg_ride_duration = round(mean(ride_length),2)) %>% 
  ggplot(aes(x = member_casual, y = avg_ride_duration)) + 
  geom_col(aes(fill = rideable_type), position = "dodge") +
  labs(title = "Average Ride Duration by User Segment Across Bike Types",
       subtitle = "Highlights differences in avg ride duration between user segments across bike types",
       fill = "Bike Type",
       caption = "Data Source: Divvy Bike Share 2025",
       x = "User Segment",
       y = "Avg Ride Duration (min)") + 
  theme_classic() 

print(bike_type_ride_time_graph)
# Classic bikes used by both the user segments have a higher avg ride duration than electric bikes-
# used by the same.


# 5) WEEKLY RIDE PATTERN
weekly_ride_pattern_graph <- bike_share_25 %>% 
  group_by(day_of_week, member_casual) %>% 
  summarise(total_rides = n()/1000) %>% 
  ggplot(aes(x = day_of_week, y = total_rides)) + 
  geom_line(aes(colour = member_casual, group = member_casual)) +
  geom_point(size = 1.5) +
  labs(title = "Weekly Ride Patterns by User Segment",
       subtitle = "Comparison of ride activity across days of the week between casual riders and annual members",
       caption = "Dated: Jan 2025 - Dec 2025",
       colour = "User Segment",
       x = "Day of Week",
       y = "Total Rides (in 1000's)") +
  theme_minimal()

print(weekly_ride_pattern_graph)
# Annual members display constant ride activity during weekdays
# Casual riders show increased ride activity during weekends


# 6) MONTHLY RIDE PATTERN
monthly_ride_pattern_graph <- bike_share_25 %>% 
  group_by(month_of_ride, member_casual) %>% 
  summarise(total_rides = n()/1000) %>% 
  ggplot(aes(x = month_of_ride, y = total_rides)) + 
  geom_line(aes(colour = member_casual, group = member_casual)) +
  geom_point(size = 1.5) +
  labs(title = "Monthly Ride Trends by User Segment",
       subtitle = "Comparison of monthly ride activities between casual riders and annual members",
       caption = "Dated: Jan 2025 - Dec 2025",
       x = "Month",
       y = "Total Rides (in 1000's)",
       colour = "User Segment") + 
  theme_minimal()

print(monthly_ride_pattern_graph)
# Both the user segments show increased ride activity during summer and a dip in ride activity during winter 


# 7) BIKE RIDE FREQUENCY
bike_ride_frequency_graph <- bike_share_25 %>% 
  group_by(start_hour = hour(started_at),member_casual) %>% 
  summarise(total_rides = n()/1000) %>% 
  ggplot(aes(x = start_hour, y = total_rides)) + 
  geom_line(aes(colour = member_casual, group = member_casual)) +
  labs(title = "Bike Ride Frequency Chart",
       subtitle = "Volume of bike rides distributed on the hours of the day",
       caption = "Dated: Jan 2025 - Dec 2025",
       x = "Hours of the day",
       y = "Total Rides (in 1000's)",
       colour = "User Segment") +
  theme_minimal()

print(bike_ride_frequency_graph)


sessionInfo()
# ------------ END OF DATA VISUALISATION SCRIPT ------------  

