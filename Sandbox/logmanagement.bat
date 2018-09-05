@ECHO off
SET appliance=PCT
TITLE %appliance% Uselog Management

REM Timestamps for filename
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set datestamp=%dt:~0,8%
set timestamp=%dt:~8,6%
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%
set HH=%dt:~8,2%
set Min=%dt:~10,2%
set Sec=%dt:~12,2%
set copyDateStamp=%YYYY%-%MM%-%DD%

SET origLogName=usageLog.csv
SET newLogName=%computername%.%copyDateStamp%.%appliance%.csv*
SET emptyLogFile=TODO.TXT
::SET copyToDir=Z:\GitHub\Batch.Playground\Sandbox
SET copyToDir="%homedrive%\%homepath%\Desktop\"

:: %homedrive%\%homepath%\Desktop\%origLogName%
:: Z:\GitHub\Batch.Playground\Sandbox\%origLogName%


REM DEBUG--

REM \\REMOTE FOLDER NAME WILL CHANGE
xcopy "%homedrive%\%homepath%\Desktop\%origLogName%" %copyToDir%\%newLogName% /y /z /k /w

REM DEBUG--

REM xcopy and rename logSource log-file to copyToDir log-directory
REM + PCTUSELOG.2018-09-04.zip
REM     - IOS01.2018-09-04.PCT.csv 
REM     - IOS02.2018-09-04.PCT.csv 
REM     - IOS03.2018-09-04.PCT.csv 
REM     - SDARR.2018-09-04.PCT.csv 

REM Remove %copyToDir% log-file

REM Ask user if they want to clean the logfile
REM IF YES: Copy %emptyLogFile% to copyToDir


@PAUSE