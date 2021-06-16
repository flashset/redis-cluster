DEL nodes-6379.conf
DEL nodes-6380.conf
DEL nodes-6381.conf
DEL nodes-7379.conf
DEL nodes-7380.conf
DEL nodes-7381.conf

DEL dump-6379.rdb
DEL dump-6380.rdb
DEL dump-6381.rdb
DEL dump-7379.rdb
DEL dump-7380.rdb
DEL dump-7381.rdb

DEL temp-node-list.txt

start redis-cli -h 127.0.0.1 -p 6379 FLUSHALL 
start redis-cli -h 127.0.0.1 -p 6380 FLUSHALL
start redis-cli -h 127.0.0.1 -p 6381 FLUSHALL
start redis-cli -h 127.0.0.1 -p 7379 FLUSHALL
start redis-cli -h 127.0.0.1 -p 7380 FLUSHALL
start redis-cli -h 127.0.0.1 -p 7381 FLUSHALL

start redis-cli -h 127.0.0.1 -p 6379 CLUSTER RESET 
start redis-cli -h 127.0.0.1 -p 6380 CLUSTER RESET
start redis-cli -h 127.0.0.1 -p 6381 CLUSTER RESET
start redis-cli -h 127.0.0.1 -p 7379 CLUSTER RESET
start redis-cli -h 127.0.0.1 -p 7380 CLUSTER RESET
start redis-cli -h 127.0.0.1 -p 7381 CLUSTER RESET


