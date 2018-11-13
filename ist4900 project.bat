@echo off
@echo off
title Calculator
color 0a
echo Welcome to The NXT Open sourse Project
echo Made By Osude Michael Ifesinachi
echo For the IST4900 
echo Lecturer Dalton Ndirangu
echo semester Spring 2015
ping localhost -n 3 >nul

:LOADING
cls
echo Please wait Loading.
ping localhost -n 2 >nul
cls
echo Please wait Loading..
ping localhost -n 2 >nul
cls
echo Please wait Loading...
ping localhost -n 2 >nul
cls
echo Please wait Loading....
ping localhost -n 2 >nul
cls
echo Please wait Loading.....
ping localhost -n 2 >nul
ping localhost -n 2 >nul
color 0a

:START
cls
echo Welcome to The NXT Project, this is an app designed to
echo simplify the lives of the very active IT administrator
echo please if you need any help please send me an email on
echo mikeosude@msn.com
echo.
echo.
echo this ap has the following functions
echo network management, and diagnostics,
echo remote shutdown, reboot, and abort
echo wake on lan from all sleep states
echo backup network shared folders

:TOP
CLS
eCHO Choose functions
echo Networking = N
echo Management = M
echo Wake on LAN = W
echo Backup = B
set /p T=
if '%T%' == 'N' goto :NET
if '%T%' == 'n' goto :NET
if '%T%' == 'M' goto :MGT
if '%T%' == 'm' goto :MGT
if '%T%' == 'W' goto :WOL
if '%T%' == 'w' goto :WOL
if '%T%' == 'B' goto :BKP
if '%T%' == 'b' goto :BKP
:MGT
CLS
ECHO PRESS 1 FOR SHUTDOWN
ECHO PRESS 2 FOR REBOOT
ECHO PRESS 3 FOR ABORT
ECHO PRESS 4 FOR BACK TO TOP
SET /P R=
if '%R%' == '1' goto :SDN
if '%R%' == '2' goto :RBT
if '%R%' == '3' goto :ABT
if '%R%' == '4' goto :TOP

:SDN
CLS
ECHO PRESS S FOR SINGLE SHUTDOWN
ECHO PRESS M FOR MULTIPLE SHUTDOWN
SET /P T=
IF '%T%' == 'S' GOTO :GDN
IF '%T%' == 's' GOTO :GDN
IF '%T%' == 'M' GOTO :MDN
IF '%T%' == 'm' GOTO :MDN

:MDN
CLS
REM --- Parse list of servers
for /f %%a in (PCn.txt) do CALL :RbtMe %%a
goto :TOP

:RbtMe
REM --- Restarting remote system.
shutdown -r -t 300 -c "All systems are being shutdown now, please save your work" -f -m %1
GOTO :TOP
:GDN
CLS
echo Enter the ipaddress of the computer you want to shutdown
set /p R=
ECHO IP ADDRESS OF THE MACHINE IS %R%
ECHO.
ECHO REASON FOR THE SHUTDOWN
SET /P T=
ECHO RESON IS: %T%
ECHO.
ECHO WAIT TIME?
SET /P H=
ECHO WAIT TIME IS %H%
PAUSE
CLS
ECHO.
ECHO SHUTTING DOWN %R%
ECHO BECAUSE OF %T%
ECHO TIME BEFORE SHUTDOWN IS %H%
PAUSE
SHUTDOWN -S -F -M %R% -T %H% -C %T%
GOTO :TOP
:RBT
CLS
echo Enter the ipaddress of the computer you want to REBOOT
set /p R=
ECHO IP ADDRESS OF THE MACHINE IS %R%
ECHO.
ECHO REASON FOR THE REBOOT
SET /P T=
ECHO RESON IS: %T%
ECHO.
ECHO WAIT TIME?
SET /P H=
ECHO WAIT TIME IS %H%
PAUSE
CLS
ECHO.
ECHO REBOOTING DOWN %R%
ECHO BECAUSE OF %T%
ECHO TIME BEFORE REBOOT IS %H%
PAUSE
SHUTDOWN -R -F -M %R% -T %H% -C %T%
GOTO :TOP
:ABT
CLS
ECHO IP ADDRESS OF THE MACHINE IS %R%
ECHO.
ECHO REASON FOR THE REBOOT
PAUSE
SHUTDOWN -A -M %R%
CLS
ECHO MGT
PAUSE
GOTO :TOP
:NET
CLS
ECHO NET
echo ping = P
echo View Network Computers = V
echo Network Adapter configuration = A
echo Network Statistic = S
echo Active Connections = C
set /p N=
if '%N%' == 'P' goto :PING
if '%N%' == 'p' goto :PING
if '%N%' == 'V' goto :VNC
if '%N%' == 'v' goto :VNC
if '%N%' == 'A' goto :NAC
if '%N%' == 'a' goto :NAC
if '%N%' == 'S' goto :NTS
if '%N%' == 's' goto :NTS
if '%N%' == 'C' goto :ACC
if '%N%' == 'c' goto :ACC
:PING
cls
ECHO INPUT THE ADDRESS OR IP ADDRESS TO PING
SET /P Q=
start cmd.exe /k PING %Q%
PAUSE
GOTO :TOP
:VNC
echo view network computers 
start cmd.exe /k net view
PAUSE
GOTO :TOP
:NAC
echo network adapter configuration
start cmd.exe /k ipconfig /all
PAUSE
GOTO :TOP
:NTS
echo view network statistic
start cmd.exe /k netstat -e
PAUSE
GOTO :TOP
:ACC
echo View Active Network Connections, 
start cmd.exe /k netstat -n -o
PAUSE
GOTO :TOP
:WOL
CLS
ECHO FOR SINGLE WAKE UP PRESS S
ECHO FOR MULTIPLE WOL PRESS M
SET /P T=
IF '%T%' == 'S' GOTO :SWOL
IF '%T%' == 's' GOTO :SWOL
IF '%T%' == 'B' GOTO :BWOL
IF '%T%' == 'b' GOTO :BWOL
:SWOL
echo this is the sinle wake on LAN
echo make sure you have the MAC address
echo of the machine you would like to wake
echo enter the mac address
set /p A=
echo Mac Adress of the machine is %A%
echo.
echo enter the ip address
set /p B=
echo the IP address of the machine is %B%
echo.
echo enter subnet mask
set /p C=
echo the SUBnet mask is %C%
echo.
echo enter the port number (default is 7)
set /p D=
echo the port number is %D%
pause
WOLCMD.exe %A% %B% %C% %D%
pause
goto :TOP
:BWOL
if "%1"=="" (
 for /F "tokens=1-4" %%a in (PCs.txt) do call %0 %%a %%b %%c %%d
) else (
 echo Sending a WOL packet to %1 (%2 %3 %4)...
 wolcmd %2 %3 %4

 echo Waiting for the system to come up...
 ping -n 60 -w 1000 0.0.0.1 >NUL 2>&1
PAUSE
GOTO :TOP
:BKP
CLS
ECHO BKP
NET USE Z:"\\192.168.204.45\SHARE"
/USER:YOURNAME
IF EXIST "Z:\" XCOPY "Z:\"
"C:\USERS\PETERNETWORK DRIVE" /MIR
PAUSE
GOTO :TOP
shutdown -m %a% -s -f -c %b% -t %c%
shutdown -m %a% -r -f -c %b% -t %c%
wolcmd [mac address] [ip address] [subnet mask] [port number]
PING 1.1.1.1 -n 1 -w 300000 >NUL

mstsc /v: YouComputerNameHere