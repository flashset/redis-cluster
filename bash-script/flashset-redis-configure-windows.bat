@echo on;

::@echo on
setlocal enableDelayedExpansion

call node-configuration-windows.bat
set i=0

:: Configuration


::=======================================================================================================
:: Master: Redis nodes (running in cluster mode) should be connected together by CLUSTER MEET command
:masterMeetloop
if %i% equ %masterLen% set i=0 & goto slaveMeetloop
 
for /f "usebackq delims==. tokens=1,2*" %%j in (`set master[%i%]`) do (
	set "%%k=%%l"
)

if %i% equ 0 set baseIp=%Ip% & set basePort=%Port% & set /a i=%i%+1 & goto masterMeetloop

::CLUSTER MEET command
redis-cli -h %baseIp% -p %basePort% CLUSTER MEET %Ip% %Port%

set /a i=%i%+1

goto masterMeetloop

::=======================================================================================================
:: Slave: Redis nodes (running in cluster mode) should be connected together by CLUSTER MEET command
:slaveMeetloop
if %i% equ %slaveLen% set i=0 & goto replicateloop
 
for /f "usebackq delims==. tokens=1,2*" %%j in (`set slave[%i%]`) do (
	set "%%k=%%l"
)

::CLUSTER MEET command
redis-cli -h %baseIp% -p %basePort% CLUSTER MEET %Ip% %Port%

set /a i=%i%+1
goto slaveMeetloop

::=======================================================================================================
:: #To configure the replication, the new CLUSTER REPLICATE command should be executed on each Redis slave by providing master Node ID (name).


:: Slave: CLUSTER REPLICATE command
:replicateloop
redis-cli -h %baseIp% -p %basePort% CLUSTER NODES > temp-node-list.txt 

if %i% equ %slaveLen% goto :eof
 
for /f "usebackq delims==. tokens=1,2*" %%j in (`set slave[%i%]`) do (
	set "%%k=%%l"
)
echo please wait...
timeout 10
set getMasterCommand='findstr %MasterPort% temp-node-list.txt'
for /f "tokens=1" %%j in (%getMasterCommand%) do set masternodeid=%%j
redis-cli -h %Ip% -p %Port% CLUSTER REPLICATE %masternodeid%

set /a i=%i%+1
goto replicateloop

::=======================================================================================================
:: END
