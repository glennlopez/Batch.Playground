@echo off
set target=C:\Backup
set source=C:\Source
set backupcmd=xcopy /s /c /d /e /h /i /r /y

:: backup changes made
echo ### Backing up target folder...
::%backupcmd% "%USERPROFILE%\My Documents" "%target%\My Documents"
%backupcmd% "%source%" "%target%"

echo Backup Script Done!
@pause