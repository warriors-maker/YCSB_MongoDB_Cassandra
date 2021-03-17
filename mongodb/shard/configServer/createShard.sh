mongo --host 10.128.0.39 --port 27017 --eval 'sh.addShard("ss1/mongo-shard-2:27017")'
sleep 5
mongo --host 10.128.0.39 --port 27017 --eval 'sh.addShard("ss2/mongo-shard-3:27017")'
sleep 5
mongo --host 10.128.0.39 --port 27017 --eval 'sh.addShard("ss3/mongo-shard-4:27017")'
sleep 5
mongo --host 10.128.0.39 --port 27017 --eval 'sh.enableSharding("ycsb")'
sleep 5
mongo --host 10.128.0.39 --port 27017 --eval 'sh.shardCollection("ycsb.usertable", { _id } )'
sleep 5
mongo --host 10.128.0.39 --port 27017 --eval 'sh.status()'
