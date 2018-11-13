@echo off
if not (%1)==() goto WAKE
for /F "tokens=2-4" %%a in (PCs.txt) do call %0 %%a %%b %%c
goto QUIT
:
:WAKE
echo WOL: %1 %2 %3
wolcmd %1 %2 %3
:
:QUIT
rem -- exit