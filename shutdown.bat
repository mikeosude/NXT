@echo off
if not (%1)==() goto SHUT
for /F "tokens=1-4" %%a in (PCs.txt) do call %0 %%a %%b %%c %%d
goto QUIT
:
:SHUT
echo ShutDown: %1
shutdown /s /t 20 /m \\%1 /c "System shutting down, Please save your work, Good-Bye"
:
:QUIT
rem -- exit


