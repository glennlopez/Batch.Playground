@ECHO off
SET source=\\Pct-fs\d\SIMULA~1\MasterDB
SET target=\\Pct-fs\e\MasterDB_backup
SET backupcmd=xcopy /s /c /d /e /h /i /r /y /z
SET archiveDate=%DATE:~7,2%
SET archiveName=MasterDB

:: Backup routine
REM Quick Backup (backup new & modified files only) 
ECHO Copying the following changes to "%target%":
%backupcmd% "%source%" "%target%"

:: Backup version control
REM Compresses the up-to-date backup folder (.zip)
ECHO.
ECHO Creating archive of new backup (%target%\ARCHIVES)...
ECHO Note: If archive (MasterDB.zip) already exists, it will be updated.
powershell.exe -command "& { Compress-Archive -Update -Path %source%\* -CompressionLevel Optimal -DestinationPath %target%\ARCHIVES\%archiveName%-$(get-date -f yyy-MM-dd).zip; }"


ECHO.
ECHO Backup routine complete!
@pause