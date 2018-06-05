@echo off

:start
set /p MATH=Equasion:  
set /a RESULTS=%MATH%

echo %RESULTS%

if %RESULTS% == 5 start notepad.exe

pause 
cls

goto start
