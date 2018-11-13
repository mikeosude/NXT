@echo off
if "%1"=="" (
 for /F "tokens=1-4" %%a in (PCs.txt) do call %0 %%a %%b %%c %%d
) else (
 echo Sending a WOL packet to %1 (%2 %3 %4)...
 wolcmd %2 %3 %4

 echo Waiting for the system to come up...
 ping -n 60 -w 1000 0.0.0.1 >NUL 2>&1

 echo Running commands on system
 rem *** add whatever commands here
 
 echo Shutting down %1
 shutdown /s /t 20 /m \\%1 /c "System shutting down, Please save your work, Good-Bye"
)