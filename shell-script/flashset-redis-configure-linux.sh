#!/bin/bash

source ./node-configuration-linux.sh

# Configuration
#=======================================================================================================
# Add the slots to the cluster. Number of masters are configured in config file
i=0 
# Loop upto size of array 
# starting from index, i=0 
while [ $i -lt $masterLen ] 
do
    # To print index, ith 
    # element 
	j=${masterSlotFrom[$i]}
	while [ $j -le ${masterSlotTo[$i]} ] 
	do
	echo $j
		redis-cli -h  ${masterIp[$i]} -p  ${masterPort[$i]}} CLUSTER ADDSLOTS $j;
		j=`expr $j + 1` 
	done

    #echo for slot in {$masterSlotFrom..$masterSlotTo}; do redis-cli -h  $masterIp -p  $masterPort} CLUSTER ADDSLOTS $slot; done;  

    # Increment the i = i + 1 
    i=`expr $i + 1` 
done

#=======================================================================================================
# Master: Redis nodes (running in cluster mode) should be connected together by CLUSTER MEET command
i=0 
# Loop upto size of array 
# starting from index, i=0 
while [ $i -lt $masterLen ] 
do

if [ $i == 0 ]
then
	baseIp=${masterIp[$i]}
	basePort=${masterPort[$i]}	
else
	redis-cli -h $baseIp -p $basePort CLUSTER MEET  ${masterIp[$i]}  ${masterPort[$i]}
fi
# Increment the i = i + 1 
i=`expr $i + 1` 
done


#=======================================================================================================
# Slave: Redis nodes (running in cluster mode) should be connected together by CLUSTER MEET command
i=0 
# Loop upto size of array 
# starting from index, i=0 
while [ $i -lt $slaveLen ] 
do
	#CLUSTER MEET command
	redis-cli -h  $baseIp -p $basePort CLUSTER MEET  ${slaveIp[$i]}  ${slavePort[$i]}

    # Increment the i = i + 1 
    i=`expr $i + 1` 
done

#=======================================================================================================
# #To configure the replication, the new CLUSTER REPLICATE command should be executed on each Redis slave by providing master Node ID (name).

# Slave: CLUSTER REPLICATE command
i=0 
# Loop upto size of array 
# starting from index, i=0 
while [ $i -lt $slaveLen ] 
do	
	slaveMasterIp=${slaveMasterIp[$i]}
	slaveMasterPort=${slaveMasterPort[$i]}

	masternodeid=$(redis-cli -h  $slaveMasterIp -p  $slaveMasterPort CLUSTER NODES | grep myself | cut -d" " -f1)
	sleep 10
	redis-cli -h ${slaveIp[$i]} -p  ${slavePort[$i]} CLUSTER REPLICATE $masternodeid
	i=`expr $i + 1`
done

#=======================================================================================================
# END
