@echo on

:: Master Ip & Port configuration
set masterLen=3 
set master[0].Ip=172.16.3.28
set master[0].Port=6379
set master[0].SlotFrom=0
set master[0].SlotTo=5400

set master[1].Ip=172.16.3.169
set master[1].Port=6380
set master[1].SlotFrom=5401
set master[1].SlotTo=10800

set master[2].Ip=172.16.3.169
set master[2].Port=6381
set master[2].SlotFrom=10801
set master[2].SlotTo=16383

:: Slave IP and Port Configuration
set slaveLen=3
set slave[0].Ip=172.16.3.169
set slave[0].Port=7379
set slave[0].MasterIp=172.16.3.28
set slave[0].MasterPort=6379

set slave[1].Ip=172.16.3.169
set slave[1].Port=7380
set slave[1].MasterIp=172.16.3.169
set slave[1].MasterPort=6380

set slave[2].Ip=172.16.3.169
set slave[2].Port=7381
set slave[2].MasterIp=172.16.3.169
set slave[2].MasterPort=6381