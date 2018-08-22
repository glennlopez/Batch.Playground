@ECHO off&prompt :&mode con cols=50 lines=10
SETLOCAL enabledelayedexpansion
REM Automatically logs run-time of target proccess in CSV

::SET logDir=C:\Users\Instructor_03\Desktop
SET logDir=Z:\GitHub\Batch.Playground\Sandbox
SET logName=usageLog.csv
SET taskName=firefox.exe
SET userName=%COMPUTERNAME%

REM Get User Name
::SET userName=
REM TODO - Add this function after script evaluation is done

REM Record Start Time
SET StartTime=%time%
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
   SET /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

REM Monitor for IOS proccess
ECHO Waiting for %taskName% ...
TIMEOUT /t 3 /nobreak >nul
ECHO Don't close this window.
ECHO This will close Automatically.
:loop
TASKLIST /nh /fi "imagename eq %taskName%" | find /i "%taskName%" >nul && (
::ECHO Process is running
TIMEOUT /t 5 /nobreak >nul
goto :loop
) || (
ECHO Process is not running
)

REM Record End Time
SET EndTime=%time%
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
   SET /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

REM Calculate Total Time
SET /A elapsed=end-start
SET /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
if %mm% lss 10 SET mm=0%mm%
if %ss% lss 10 SET ss=0%ss%
if %cc% lss 10 SET cc=0%cc%
SET TotalTime=%hh%:%mm%:%ss%.%cc%

:: Log -> Date, Name, Start Time, End Time, Total
ECHO %date%, %userName%, %StartTime%, %EndTime%, %TotalTime%  >> %logDir%/%logName%