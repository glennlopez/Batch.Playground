@ECHO off
setlocal enabledelayedexpansion

:: Hook this script to exe shortcut using "&&"
SET logDir=C:\Users\Instructor_03\Desktop
SET logName=usageLog.csv

:: Get User Name

:: Start Time
SET StartTime=%time%
rem Get start time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
   set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

@PAUSE
:: Monitor for IOS proccess in the background, Continue when proccess no longer exists

:: End Time
SET EndTime=%time%
rem Get end time:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
   set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)

:: Calc Total
::SET TotalTime=999

rem Get elapsed time:
set /A elapsed=end-start

rem Show elapsed time:
set /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
if %mm% lss 10 set mm=0%mm%
if %ss% lss 10 set ss=0%ss%
if %cc% lss 10 set cc=0%cc%
SET TotalTime=%hh%:%mm%:%ss%.%cc%

:: Log -> Date, Name, Start Time, End Time, Total
echo %date%, Script Evaluation, %StartTime%, %EndTime%, %TotalTime%  >> %logDir%/%logName%