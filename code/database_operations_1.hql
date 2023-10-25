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

-- Add data to a created table
sql insert into table test1.mytable values(1, "testuser1");
-- or
sql insert into table test1.mytable SELECT 2, "testuser2";
-- Add more than 1 data at once to a created table
sql insert into table test1.mytable values(3, "testuser3", "testuser3@example.com"),(4, "testuser4", "testuser4@example.com");

-- Change the name of a created table
alter table mytable rename to test1.mytable_renamed;
-- Add column to a created table
alter table test1.mytable_renamed add columns (added_col int, added_col2 string);
-- Change the name of a column
alter table test1.mytable_renamed change name username string;
-- Change a property of a created table
alter table test1.mytable_renamed SET TBLPROPERTIES ('comment' = 'this edit by altertable');

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


-- Create an external table
create external table if not exists test1.adv_ext like test1.advertising location 'HDFS_Location';

