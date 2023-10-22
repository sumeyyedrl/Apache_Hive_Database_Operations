# Apache_Hive_Database_Operations
How to connect Apache Hive and create, update and delete database, table and data
## Getting Started
Apache hive is not a database! It creates a schema on HDFS data and run queries on it. However Hive is not preferable to run interactive queries and insert, delete, update operations because there is better and faster options for that. It's good to display data and run analitic queries not to change the existing data. It does the job that MapReduce does but Hive is easier to use in terms of coding.
### Connecting Hive
First thing first Hadoop and Hive services need to be started. In order to connect Hive, using Beeline is a new and secure way to use.
```
#Starting Hadoop service
start-all.sh

#Connecting Beeline
beeline -u jdbc:hive2://localhost:10000
```
To check the Hive service run the codes below. If a pip number shown, Hive service is ready to use. 
```
pgrep -f org.apache.hive.service.server.HiveServer2
```
```
pgrep -f org.apache.hadoop.hive.metastore.HiveMetaStore
```

### Database Operations
Apache Hive supports a language that closely resembles SQL. That's why it's way easier to use than MapReduce.
```
# Create a new database
sql create database test1;
# Comments can be added while creating a new database
sql create database test1 comment 'This is for training';

# Describe an existing database (If comments added it can be shown here)
sql describe database test1;

#Drop an existing database
sql drop database test1;
```

```
# Create a new table
sql create table if not exists mytable(id int, name string);

# Describe an existing table
sql describe mytable;
# Detailed informations about existing table
sql describe formatted mytable;

#Drop an existing database
sql drop table mytable;
```
