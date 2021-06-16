echo Starting Redis Server

::start Redis master nodes
::start redis-server redis.master1.conf
start redis-server redis.master2.conf
start redis-server redis.master3.conf

::Start all 3 slaves
start redis-server redis.slave1.conf
start redis-server redis.slave2.conf
start redis-server redis.slave3.conf
:: read EXITCOMMAND