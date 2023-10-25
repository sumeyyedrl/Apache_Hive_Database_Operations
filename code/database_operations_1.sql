-- Create a new database
sql create database test1;
-- Comments can be added while creating a new database
sql create database test1 comment 'This is for training';

-- Describe an existing database (If comments added it can be shown here)
sql describe database test1;

-- Drop an existing database
sql drop database test1;


-- Create a new table
sql create table if not exists mytable(id int, name string);

-- Describe an existing table
sql describe mytable;
-- Detailed informations about existing table
sql describe formatted mytable;

--Drop an existing database
sql drop table mytable;


-- Create a table that is suitable for Hive schema
sql create table test1.advertising (ID int,TV float ,Radio float, Newspaper float ,Sales float)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile 
tblproperties('skip.header.line.count'='1');


-- Load data to an empty table
sql load data inpath '/data/advertising.csv' into table test1.advertising;
-- Load data to a full table
sql load data inpath '/data/advertising.csv' overwrite into table test1.advertising;


-- Get a created table's Hive schema code
sql show create table mytable;

