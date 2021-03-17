workload=workloads/$3
threads=$2
#output file directory
dir="single/"
url="mongodb://ip1:port,ip2:port,ip3:port/ycsb?w=2&replicaSet=rs0"
./bin/ycsb $1 mongodb-async -s  \
-P $workload \
-p mongodb.url=$url \
-threads $threads > $dir$1$2$3
