Ip=172.16.2.52

DEL temp-node-list.txt

redis-cli -h $Ip -p 6379 FLUSHALL 
redis-cli -h $Ip -p 6380 FLUSHALL
redis-cli -h $Ip -p 6381 FLUSHALL
redis-cli -h $Ip -p 7379 FLUSHALL
redis-cli -h $Ip -p 7380 FLUSHALL
redis-cli -h $Ip -p 7381 FLUSHALL

redis-cli -h $Ip -p 6379 CLUSTER RESET 
redis-cli -h $Ip -p 6380 CLUSTER RESET
redis-cli -h $Ip -p 6381 CLUSTER RESET
redis-cli -h $Ip -p 7379 CLUSTER RESET
redis-cli -h $Ip -p 7380 CLUSTER RESET
redis-cli -h $Ip -p 7381 CLUSTER RESET


