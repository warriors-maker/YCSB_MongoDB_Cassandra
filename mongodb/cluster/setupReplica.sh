echo "Initializing replicaset"
mongo --eval "rs.initiate()"
sleep 1
echo "Add replicaset"
mongo --eval 'rs.add("10.128.0.33:27017")'
mongo --eval 'rs.add("10.128.0.34:27017")'
sleep 5
mongo --eval "rs.status()"
