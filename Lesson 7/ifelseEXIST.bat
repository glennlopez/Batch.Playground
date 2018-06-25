@echo off

echo [!] Case sensitive
set /p FILENAME= File name to check: 

if EXIST %FILENAME% (
    echo %FILENAME% exists!
) else echo ERROR: %FILENAME% does not exist.

pause