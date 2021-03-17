#stop Cassandra
echo "Stopping Cassandra"
sudo service cassandra stop
sleep 5
echo "Clearing Cache, log and data"
cd /var/lib/cassandra/
rm -rf *
sleep 2
#start cassandra
echo "Starting Cassandra, this step will take approximately 2 minutes to make sure Cassandra is running"
sudo service cassandra start
sleep 120
echo "Checking Cassandra Node status"
nodetool status
echo "Creating Cassandra Table"
#create Cassandra table
cqlsh -e "create keyspace ycsb WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 3 };"
sleep 1;
cqlsh -e "create table ycsb.usertable (
    y_id varchar primary key,
    field0 varchar,
    field1 varchar,
    field2 varchar,
    field3 varchar,
    field4 varchar,
    field5 varchar,
    field6 varchar,
    field7 varchar,
    field8 varchar,
    field9 varchar);"
