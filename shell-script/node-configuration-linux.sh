#!/bin/bash

# Master Ip & Port configuration
masterLen=3 
masterIp[0]=127.0.0.1
masterPort[0]=6379
masterSlotFrom[0]=0
masterSlotTo[0]=5400

masterIp[1]=127.0.0.1
masterPort[1]=6380
masterSlotFrom[1]=5401
masterSlotTo[1]=10800

masterIp[2]=127.0.0.1
masterPort[2]=6381
masterSlotFrom[2]=10801
masterSlotTo[2]=16383

# Slave IP and Port Configuration
slaveLen=3
slaveIp[0]=127.0.0.1
slavePort[0]=7379
slaveMasterIp[0]=127.0.0.1
slaveMasterPort[0]=6379

slaveIp[1]=127.0.0.1
slavePort[1]=7380
slaveMasterIp[1]=127.0.0.1
slaveMasterPort[1]=6380

slaveIp[2]=127.0.0.1
slavePort[2]=7381
slaveMasterIp[2]=127.0.0.1
slaveMasterPort[2]=6381