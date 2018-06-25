@echo off
set /p num= Set a number: 

REM For batch, you cannot use < or >
REM See for proper syntax: http://ss64.com/nt/if.html 
if %num% LSS 10 (
    echo %num% is less than 10.
)
if %num% GTR 10 (
    echo %num% is greater than 10.
)
pause