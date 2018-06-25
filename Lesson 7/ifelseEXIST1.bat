@echo off

echo [!] Case sensitive
set /p FILENAME= File name to check: 

REM Open the file if it exists, if it doesnt it will create it
if EXIST %FILENAME% (
    start %FILENAME%
) else echo. > %FILENAME%

pause