# Apache_Hive_Database_Operations
How to use Apache Hive to create, update and delete database, table and data
## Getting Started
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
