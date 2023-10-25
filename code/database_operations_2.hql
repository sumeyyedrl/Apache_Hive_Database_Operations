-- ! hotels table created by the data called Hotel_Reviews.csv.gz

-- Change the format of the data's file
create table hotels_orc stored as orc as select * from test1.hotels;

-- PARTITIONING

-- Create a partitioned table that is suitable for the data
create partitioned table 
create table if not exists test1.hotels_prt (
 Hotel_Address string,
 Review_Date Date,
 Additional_Number_of_Scoring int,
 Average_Score double,
 Hotel_Name string,
 Reviewer_Nationality string,
 Negative_Review string,
 Review_Total_Negative_Word_Counts int,
 Total_Number_of_Reviews int,
 Positive_Review string,
 Review_Total_Positive_Word_Counts int,
 Total_Number_of_Reviews_Reviewer_Has_Given int,
 Reviewer_Score double,
 days_since_review string,
 lat string,
 lng string,
 Tags string
 ) 
 partitioned by (review_year int, review_month int)
 stored as orc;

-- Add the data to tha table
INSERT into table test1.hotels_prt PARTITION(review_year, review_month) select Hotel_Address,
 from_unixtime(unix_timestamp(review_date , 'MM/dd/yyyy')) as Review_Date,
 Additional_Number_of_Scoring,
 Average_Score,
 Hotel_Name,
 Reviewer_Nationality,
 Negative_Review,
 Review_Total_Negative_Word_Counts,
 Total_Number_of_Reviews,
 Positive_Review,
 Review_Total_Positive_Word_Counts,
 Total_Number_of_Reviews_Reviewer_Has_Given,
 Reviewer_Score,
 days_since_review,
 lat,
 lng,
 Tags,
 YEAR(from_unixtime(unix_timestamp(review_date , 'MM/dd/yyyy'))) as review_year,
 MONTH(from_unixtime(unix_timestamp(review_date , 'MM/dd/yyyy'))) as review_month
from test1.hotels;


-- BUCKETING

-- Create a table that is suitable for bucketing
create table if not exists test1.hotels_bucket (
 Hotel_Address string,
 Review_Date string,
 Additional_Number_of_Scoring int,
 Average_Score double,
 Hotel_Name string,
 Reviewer_Nationality string,
 Negative_Review string,
 Review_Total_Negative_Word_Counts int,
 Total_Number_of_Reviews int,
 Positive_Review string,
 Review_Total_Positive_Word_Counts int,
 Total_Number_of_Reviews_Reviewer_Has_Given int,
 Reviewer_Score double,
 days_since_review string,
 lat string,
 lng string,
 Tags string
 )
 clustered by (Hotel_Name) into 8 buckets 
row format delimited 
fields terminated by ',' 
lines terminated by '\n' 
stored as orc;

-- Load the data into tha table
insert into test1.hotels_bucket select * from test1.hotels;

