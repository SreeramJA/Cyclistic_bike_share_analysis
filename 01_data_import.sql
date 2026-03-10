/* =========================================================
	PROJECT  - Cyclistic Bike Share Analysis
    SCRIPT   - 01_data_import.sql
	PURPOSE  - Data Import & Data combining
    AUTHOR   - Sreeram J Anand
    DATABASE - MySQL
    ======================================================== */


-- ==DATABASE CREATION== 
CREATE DATABASE IF NOT EXISTS bike_share_db_2025;
USE bike_share_db_2025;

-- ==TABLE CREATION==
/*Creating a new table for importing data */
CREATE TABLE IF NOT EXISTS bike_share_01 (
    ride_id VARCHAR(50),
    rideable_type VARCHAR(50),
    started_at VARCHAR(60),
    ended_at VARCHAR(60),
    start_station_name VARCHAR(150),
    start_station_id VARCHAR(50),
    end_station_name VARCHAR(150),
    end_station_id VARCHAR(50),
    start_lat DECIMAL(10,6),
    start_lng DECIMAL(10,6),
    end_lat DECIMAL(10,6),
    end_lng DECIMAL(10,6),
    member_casual VARCHAR(50)
);

-- ==DATA IMPORT== 
/* Importing the data from a csv file using load data local infile */
-- january 01 file import
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202501-divvy-tripdata.csv'
INTO TABLE bike_share_01 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

/* Verifying import */
SELECT * FROM bike_share_01;
SELECT COUNT(*) FROM bike_share_01;

/* Repeating the above steps to import the remaining .csv files */

-- Creating different tables for the import 
CREATE TABLE bike_share_02 LIKE bike_share_01;
CREATE TABLE bike_share_03 LIKE bike_share_01;
CREATE TABLE bike_share_04 LIKE bike_share_01;
CREATE TABLE bike_share_05 LIKE bike_share_01;
CREATE TABLE bike_share_06 LIKE bike_share_01;
CREATE TABLE bike_share_07 LIKE bike_share_01;
CREATE TABLE bike_share_08 LIKE bike_share_01;
CREATE TABLE bike_share_09 LIKE bike_share_01;
CREATE TABLE bike_share_10 LIKE bike_share_01;
CREATE TABLE bike_share_11 LIKE bike_share_01;
CREATE TABLE bike_share_12 LIKE bike_share_01;

-- Importing data
-- february 02 file import
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202502-divvy-tripdata.csv'
INTO TABLE bike_share_02 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- march 03 file import
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202503-divvy-tripdata.csv'
INTO TABLE bike_share_03 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- april 04 file import
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202504-divvy-tripdata.csv'
INTO TABLE bike_share_04 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- may 05 file import 
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202505-divvy-tripdata.csv'
INTO TABLE bike_share_05 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- june 06 file import 
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202506-divvy-tripdata.csv'
INTO TABLE bike_share_06 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- july 07 file import 
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202507-divvy-tripdata.csv'
INTO TABLE bike_share_07 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- august 08 file import 
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202508-divvy-tripdata.csv'
INTO TABLE bike_share_08 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- september 09 file import 
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202509-divvy-tripdata.csv'
INTO TABLE bike_share_09 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- october 10 file import 
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202510-divvy-tripdata.csv'
INTO TABLE bike_share_10 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- november 11 file import
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202511-divvy-tripdata.csv'
INTO TABLE bike_share_11 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- december 12 file import
LOAD DATA LOCAL INFILE 'C:\\Home\\Sreeram\\GOOGLE DATA ANALYTICS\\Case studies\\Datasets\\Project_dataset\\202512-divvy-tripdata.csv'
INTO TABLE bike_share_12 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

-- verifying import
SELECT * FROM bike_share_01 LIMIT 10;
SELECT COUNT(*) FROM bike_share_01;

SELECT * FROM bike_share_02 LIMIT 10;
SELECT COUNT(*) FROM bike_share_02;

SELECT * FROM bike_share_03 LIMIT 10;
SELECT COUNT(*) FROM bike_share_03;

SELECT * FROM bike_share_04 LIMIT 10;
SELECT COUNT(*) FROM bike_share_04;

SELECT * FROM bike_share_05 LIMIT 10;
SELECT COUNT(*) FROM bike_share_05;

SELECT * FROM bike_share_06 LIMIT 10;
SELECT COUNT(*) FROM bike_share_06;

SELECT * FROM bike_share_07 LIMIT 10;
SELECT COUNT(*) FROM bike_share_07;

SELECT * FROM bike_share_08 LIMIT 10;
SELECT COUNT(*) FROM bike_share_08;

SELECT * FROM bike_share_09 LIMIT 10;
SELECT COUNT(*) FROM bike_share_09;

SELECT * FROM bike_share_10 LIMIT 10;
SELECT COUNT(*) FROM bike_share_10;

SELECT * FROM bike_share_11 LIMIT 10;
SELECT COUNT(*) FROM bike_share_11;

SELECT * FROM bike_share_12 LIMIT 10;
SELECT COUNT(*) FROM bike_share_12;

-- ==DATA COMBINING==
/* Combining all the imported data on individual tables into a single table */
CREATE TABLE IF NOT EXISTS bike_share_2025_raw AS (
SELECT * FROM bike_share_01 
UNION ALL 
SELECT * FROM bike_share_02
UNION ALL
SELECT * FROM bike_share_03
UNION ALL 
SELECT * FROM bike_share_04
UNION ALL
SELECT * FROM bike_share_05
UNION ALL 
SELECT * FROM bike_share_06
UNION ALL 
SELECT * FROM bike_share_07
UNION ALL 
SELECT * FROM bike_share_08
UNION ALL
SELECT * FROM bike_share_09
UNION ALL 
SELECT * FROM bike_share_10 
UNION ALL 
SELECT * FROM bike_share_11
UNION ALL 
SELECT * FROM bike_share_12
);
-- The table contains exactly 5552994 rows of data, which is the aggregate of all the records present in the individual CSV files.

/* Verification of Data in the new table */
SELECT * FROM bike_share_2025_raw;
SELECT COUNT(*) FROM bike_share_2025_raw;


/* ============================= END OF SCRIPT ================================= */