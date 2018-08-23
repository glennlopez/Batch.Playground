@echo off
SET taskname=firefox.exe

:loop
tasklist /nh /fi "imagename eq %taskname%" | find /i "%taskname%" >nul && (
echo Process is running
timeout /t 5 /nobreak >nul
goto :loop
) || (
echo Process is not running
@PAUSE
)
