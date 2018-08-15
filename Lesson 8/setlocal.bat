@echo off

:: https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/setlocal
setlocal enabledelayedexpansion

:: start of file
set Message= Hello
echo %Message%
pause
:: end of file

:: start of code
@echo off
set Status=Problem
if "%Status%"=="Problem" ( REM is a string so " " is required
    set Status=No Problem
    echo %Status%
)
pause
:: end of code