#!/bin/bash
#Define the IP address for the cassandra cluster
host_addr=ip1,ip2,ip3
read_consistency=ONE
write_consistency=QUORUM
workload_name=workloads/$3
thread_count=$2
dir="cluster/"
if [ $1 = "load" ]; then
  read_consistency=ALL
  write_consistency=ALL
fi;
echo $1$2$3
./bin/ycsb $1 cassandra-cql \
-P $workload_name \
-threads $thread_count \
-p cassandra.readconsistencylevel=$read_consistency \
-p cassandra.writeconsistencylevel=$write_consistency \
-p hosts=$host_addr -s > $dir$1$2$3$read_consistency
