@echo off

echo [!] Case sensitive
set /p FILENAME= File name to check: 

if EXIST %FILENAME% (
    echo %FILENAME% exists!
)

if NOT EXIST %FILENAME% (
    echo %FILENAME% file does NOT exist.
)

pause