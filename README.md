# YCSB_MongoDB_Cassandra
This repository contains google cloud shell scripts that automate large scale benchmark for MongoDB and Cassandra.

This shell script is general enough that after each rounnd of experiment, it shuts down the original database and clean up the data and log directtory, and then rrestart the experiment again.

This shell script can run different workloads with varing parameters, which needs to be specified by the users.


## Assumption:
1. Cassandra has been setup correctly
2. MongoDB has been setup correctly
3. YCSB has been setup correctly
4. Have some basic knowledge in shell scripts
5. Need to walkthrough each shell scripts, and change the corresponding parameters you want to benchmark

## Cloud shell Terminal:
Acts like a central monitor that controlls all the Distributed Database and YCSB Server.

We have written three shell scripts for cloud shell terminal, one for Cassandra (cass-template.sh), one for MongoDB (mongo-cluster-template.sh), and one for MongoDB shards (mongo-shard-template.sh).
#### Parameters
###### threadsList: A list of threads number that you want to benchmark onn
###### workloadList: A list of workload file name that you want to use
###### restartShellPath: the path in your database server that contains the restart.sh script
###### ycsbPath: the path in your ycsb server that contains the action script
###### ycsbServerList: a list of google cloud ycsb servers in the format of [user]@VM-NAME --zone=[the zone your vm is located at]
###### databaseServerList: a list of google cloud database servers in the format of [user]@VM-NAME --zone=[the zone your vm is located at]

## Cassandra Benchmark Setup
#### Cassandra Server
1. mv cassandra/restart.sh [database destination path]
#### YCSB Server
1. mv ycsb/cassandra/cassAction.sh into [ycsb directory]
#### Google cloud Shell terminal
1. mv cass-template.sh into [google cloud shell terminal]
2. ./cass-template.sh

## MongoDB Cluster/Standalone Benchmark Setup
#### MongoDB Server
1. mv mongoDB/cluster/restart.sh into [database destination path]
2. mv mongoDB/cluster/setupReplica.sh into [database destination path]
#### YCSB Server
1. mv ycsb/mongo-cluster/mongoAction.sh into [ycsb dirrectory]
#### Google Cloud Shell
1. mv mongo-cluster-template.sh into [google cloud shell terminal]
2. ./mongo-cluster-template.sh

## MongoDb Shard Benchmark Setup
#### Config Server
1. mv mongodb/shard/configServer/restart.sh into [mongodb config server path]
2. mv mongodb/shard/configServer/createShard.sh into [mongodb config server path]
#### Mongos
1. mv mongodb/shard/mongos/ into [mongodb mongos path]
#### MongoDB sharded Server
1. mv mongodb/shard/shardServer/ into [mongodb sharded server path]
#### YCSB
1. mv ycsb/mongo-shard/mongoAction.sh into [ycsb dirrectory]
#### Google cloud Shell terminal
1. mv cass-shard-template.sh into [google cloud shell terminal]
2. ./cass-shard-template.sh
