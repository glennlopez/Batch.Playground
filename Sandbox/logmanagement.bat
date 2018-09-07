@ECHO off
SET appliance=PCT
TITLE %appliance% Uselog Management

REM TIMESTAMP VARIABLES - DO NOT TOUCH
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
SET datestamp=%dt:~0,8%
SET timestamp=%dt:~8,6%
SET YYYY=%dt:~0,4%
SET MM=%dt:~4,2%
SET DD=%dt:~6,2%
SET HH=%dt:~8,2%
SET Min=%dt:~10,2%
SET Sec=%dt:~12,2%
SET copyDateStamp=%YYYY%-%MM%-%DD%

REM FILENAMES - EDIT AS NEEDED
SET origLogName=%appliance%usageLog.csv
SET emptyLogName=CHANGE THIS FILENAME
SET masterLogName=MASTERLOG.%copyDateStamp%.%appliance%.csv

REM DIRECTORIES - EDIT AS NEEDED
SET masterLogDir=CHANGE THIS IF NEEDED
SET emptyLogDir=CHANGE THIS IF NEEDED
SET copyFromDir=CHANGE THIS IF NEEDED
SET copyToDir=\\pct-fs\C\logs\PCT\%copyDateStamp%
SET archiveToDir=\\pct-fs\C\logs\ARCHIVES

REM COPY USELOG TO FILESERVER - EDIT AS NEEDED
xcopy "\\10.100.1.103\c\Users\Instructor_03\Desktop\%origLogName%" %copyToDir%\IOS03.%copyDateStamp%.%appliance%.csv* /y /z /k
xcopy "\\10.100.1.102\c\Users\Instructor_02\Desktop\%origLogName%" %copyToDir%\IOS02.%copyDateStamp%.%appliance%.csv* /y /z /k
xcopy "\\10.100.1.100\c\Users\Instructor_01\Desktop\%origLogName%" %copyToDir%\IOS01.%copyDateStamp%.%appliance%.csv* /y /z /k
xcopy "\\10.100.1.200\c\Users\Instructor_sd\Desktop\%origLogName%" %copyToDir%\SDAAR.%copyDateStamp%.%appliance%.csv* /y /z /k

REM MERGE ALL USELOG TO FILESERVER AS %APPLIANCE%MASTERLOG.CSV
::copy %copyToDir%\IOS01.%copyDateStamp%.%appliance%.csv+%copyToDir%\IOS02.%copyDateStamp%.%appliance%.csv+%copyToDir%\IOS03.%copyDateStamp%.%appliance%.csv+%copyToDir%\SDAAR.%copyDateStamp%.%appliance%.csv %copyToDir%\%masterLogName%
::TODO - add break points at the end of each table



REM Remove %copyToDir% log-file ???

REM Ask user if they want to clean the logfile
REM IF YES: 

REM ARCHIVE LOGS TO FILESERVER
::powershell.exe -command "& { Compress-Archive -Path %copyToDir%\* -CompressionLevel Optimal -DestinationPath %archiveToDir%\%appliance%.$(get-date -f yyy-MM-dd).zip; }"

::TODO 	- ISSUE: Red warning in terminal when file already exists
::		- ISSUE: Previous dated logfiles are archived along with the current logs

REM Copy %emptyLogFile% to copyToDir


@PAUSE