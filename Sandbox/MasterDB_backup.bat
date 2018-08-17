@ECHO off

:: SET Parameters
SET source=\\Pct-fs\d\SIMULA~1\MasterDB
SET target=\\Pct-fs\e\MasterDB_backup
SET backupcmd=xcopy /s /c /d /e /h /i /r /y /z
SET archiveName=MasterDB

:: Backup & Compression routine
ECHO Copying the following changes to "%target%":
%backupcmd% "%source%" "%target%"
ECHO.
ECHO Archiving (.zip) MasterDB folder to "%target%\ARCHIVES".
powershell.exe -command "& { Compress-Archive -Update -Path %source%\* -CompressionLevel Optimal -DestinationPath %target%\ARCHIVES\%archiveName%-$(get-date -f yyy-MM-dd).zip; }"
ECHO.
ECHO Backup routine complete!
@PAUSE