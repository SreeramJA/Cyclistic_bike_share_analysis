/* =========================================================
	PROJECT  - Cyclistic Bike Share Analysis
    SCRIPT   - 02_data_cleaning.sql
	PURPOSE  - Data Cleaning, Transformation & Validation
    AUTHOR   - Sreeram J Anand
    DATABASE - MySQL
    ======================================================== */


/* == STAGE 1 - DATA TRANSFORMATION == */

-- ==DATA PROTECTION==
/* Copying the imported raw data into a new table for data security. 
   This step is performed so that the original data is unchanged and protected. */
CREATE TABLE IF NOT EXISTS bike_share_25 AS
SELECT * FROM bike_share_2025_raw ;

/* Preview of the new table */
SELECT * FROM bike_share_25 LIMIT 10;
SELECT COUNT(*) FROM bike_share_25;
DESCRIBE bike_share_25;

-- ==DATA TYPE CONVERSION==
/* Converting the columns having date & time values into a datetime format. */
ALTER TABLE bike_share_25
MODIFY started_at DATETIME,
MODIFY ended_at DATETIME;

-- ==DATA TRANSFORMATION==
/* Inserting a new column to display the RIDE DURATION / LENGTH for each ride (ended_at - started_at). */
ALTER TABLE bike_share_25
ADD COLUMN ride_length INT;

UPDATE bike_share_25
SET ride_length = TIMESTAMPDIFF(minute,started_at,ended_at);
-- The ride length is displayed in minutes format for ease of aggregation.

/* Inserting a new column to display the DAY OF THE WEEK for each ride. */
ALTER TABLE bike_share_25
ADD COLUMN day_of_week VARCHAR(50);

UPDATE bike_share_25
SET day_of_week = DAYNAME(started_at);
-- The day of the week is important to understand the behavourial pattern of customers during weekdays & weekends. 

/* Inserting a new column to display the MONTH NAME for each ride. */
ALTER TABLE bike_share_25
ADD COLUMN month_of_ride VARCHAR(50);

UPDATE bike_share_25
SET month_of_ride = MONTHNAME(started_at);
-- The month of ride can be used to identify seasonal trends and patterns.


/* == STAGE 2 - DATA CLEANING & VALIDATION == */
-- Note - The data provided in the comments may change when data is cleaned later on at the end of the script


-- ==NULL/BLANK CHECKS== 
/* Initial inspection of .csv files brought forward missing val6ues in the form of blanks rather than nulls. */
-- Performing blank/null checks 
SELECT 
	SUM(ride_id IS NULL OR TRIM(ride_id) = '') AS missing_ride_id,
	SUM(rideable_type IS NULL OR TRIM(rideable_type) = '') AS missing_rideable_type,
    SUM(started_at IS NULL) AS missing_started_at,
    SUM(ended_at IS NULL) AS missing_ended_at,
    SUM(start_station_name IS NULL OR TRIM(start_station_name) = '') AS missing_start_station_name,
    SUM(start_station_id IS NULL OR TRIM(start_station_id) = '') AS missing_start_station_id,
    SUM(end_station_name IS NULL OR TRIM(end_station_name) = '') AS missing_end_station_name,
    SUM(end_station_id IS NULL OR TRIM(end_station_id) = '') AS missing_end_station_id,
    SUM(start_lat IS NULL) AS missing_start_lat,
    SUM(start_lng IS NULL) AS missing_start_lng,
    SUM(end_lat IS NULL) AS missing_end_lat,
    SUM(end_lng IS NULL) AS missing_end_lng,
	SUM(member_casual IS NULL OR TRIM(member_casual) = '') AS missing_member_casual
FROM bike_share_25;
/* Approximately 1.18 million records (~21%) contain missing start station data (start_station_name & start_station_id) and,
   Approximately 1.23 million records (~22%) contain missing end station data (end_station_name & end_station_id). 
   The blanks will be converted into nulls and the records will be kept as it is for the convenience of the case study */

-- ==DATA CONVERSION==
/* Converting blank values present in the table into null's for ensuring data integrity & accurate aggregation */
UPDATE bike_share_25
SET start_station_name = NULL 
WHERE start_station_name = ''; 

UPDATE bike_share_25 
SET start_station_id = NULL 
WHERE start_station_id = '';

UPDATE bike_share_25
SET end_station_name = NULL
WHERE end_station_name = '';

UPDATE bike_share_25
SET end_station_id = NULL
WHERE end_station_id = '';
/* All the blanks identified have been converted into null's */

-- ==MISSING VALUE DETECTION==
/* Checking for missing values in latitudes & longitudes */
SELECT COUNT(*)
FROM bike_share_25
WHERE start_lat = '' 
	OR start_lng = ''
    OR end_lat = ''
    OR end_lng = '';
/* Exactly 5535 records were blank for the latitude & longitudes.
   They will be converted to null's and kept as it is due to it's irrelevance in the objectives of the case study */

-- ==DATA CONVERSION==
/* The invalid data found in latitudes & longitudes were found to be in the form of 0's rather than blanks/nulls.
   Converting invalid 0 values into nulls to ensure data integrity & accurate aggregation */
UPDATE bike_share_25 
SET start_lat = NULL 
WHERE start_lat = 0;

UPDATE bike_share_25
SET start_lng = NULL
WHERE start_lng = 0;

UPDATE bike_share_25
SET end_lat = NULL 
WHERE end_lat = 0;
 
UPDATE bike_share_25
SET end_lng = NULL
WHERE end_lng = 0;
-- The 0 values have been converted into null's. 

-- ==DUPLICATE DETECTION== 
/* Checking for duplicates if any for ride_id (primary key) */
SELECT COUNT(*) - COUNT(DISTINCT ride_id) AS unique_ride_id
FROM bike_share_25;
-- no duplicate ride id's found.

-- ==DATA INTEGRITY CHECK== 
/* Checking for inaccuracies in ride_id (primary key) by calculating their character length */
SELECT COUNT(*) AS inaccurate_ride_id
FROM bike_share_25
WHERE LENGTH(ride_id) <> 16;
-- The records in ride_id are consistent. 

-- ==DATA VALIDATION==
/* Validating the records for key analysis fields */
SELECT DISTINCT member_casual FROM bike_share_25;
SELECT DISTINCT rideable_type FROM bike_share_25;
-- No outliers detected

/* Validating the values in ride length (checking for outliers) */
SELECT MIN(ride_length) , MAX(ride_length) FROM bike_share_25;
-- Significant Outliers detected 

/* Calculating the count of potential outliers */
SELECT COUNT(*) FROM bike_share_25 
WHERE ride_length < 1 OR ride_length > 1440;
-- Exactly 152508 records (~3%) are potentially outliers. 
-- These records have ride length of less than a minute & more than 1440 minutes (24 hours).
-- They shall be removed to maintain data integrity and consistency in this analysis.

-- ==REMOVAL OF OUTLIERS== 
/* The records in ride length having values less than 1 minute & greater than 1440 minutes shall be considered as time window for maintenance & repair of bikes.
   However, the outliers detected in ride length can potentially distort the analysis.
   Thereby, the outliers shall be removed for the analysis */
DELETE FROM bike_share_25
WHERE ride_length < 1 OR
      ride_length > 1440;
-- Exactly 152508 records containing the outliers were removed. 
-- The total count of records is now 5400486. 


/* ============================= END OF SCRIPT ================================= */