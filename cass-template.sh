#Specify an array of threads that you want to benchmark
threadsList=(4 8 16 32 64)
#Specify an array of the workload files you want to benchmark
workloadList=("workloada" "workloadb" "workloadc")
#Specify the path where your restart script is located at (in your database server)
restartShellPath="/home/yiw079"
#Specify the ycsb path in your ycsb server
ycsbPath="/home/yiw079/ycsb-0.17.0"
#Specify an array of ycsb server;
ycsbServerList=(
    "root@ycsb-2 --zone=us-central1-a"
    )
#Specify an array of database server
databaseServerList=("root@cass-cluster-3 --zone=us-central1-a" "root@cass-cluster-2 --zone=us-central1-a" "root@cass-cluster-1 --zone=us-central1-a")

for workload in ${workloadList[@]}; do
    for threads in ${threadsList[@]}; do
        echo $threads
        echo $workload

        for dbIndex in ${!databaseServerList[@]}; do
          if [ $dbIndex -eq $(( ${#databaseServerList[@]} - 1 )) ]
          then
            sleep 10
            gcloud compute ssh ${databaseServerList[$dbIndex]} --command="cd ${restartShellPath}; ./restart.sh" 
          else
            gcloud compute ssh ${databaseServerList[$dbIndex]} --command="cd ${restartShellPath}; ./restart.sh" > /dev/null &
          fi
        done

        #load phase
        for ycsbIndex in ${!ycsbServerList[@]}; do
          gcloud compute ssh ${ycsbServerList[$ycsbIndex]} --command="cd ${ycsbPath}; ./cassAction.sh load ${threads} ${workload}" >/dev/null
        done
        
        #run phase
        for ycsbIndex in ${!ycsbServerList[@]}; do
          if [ $ycsbIndex -eq $(( ${#ycsbServerList[@]} - 1 )) ]
          then
            gcloud compute ssh ${ycsbServerList[$ycsbIndex]} --command="cd ${ycsbPath}; ./cassAction.sh run ${threads} ${workload}" >/dev/null 
          else
            gcloud compute ssh ${ycsbServerList[$ycsbIndex]} --command="cd ${ycsbPath}; ./cassAction.sh run ${threads} ${workload}" >/dev/null &
          fi
        done
    done
done
