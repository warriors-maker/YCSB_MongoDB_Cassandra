workload=workloads/$3
threads=$2
#output directory
dir="shards/"
url=mongodb://mongosIP:mongosPort/ycsb?w=1
./bin/ycsb $1 mongodb-async -s  \
-P $workload \
-p mongodb.url=$url \
-threads $threads > $dir$1$2$3
