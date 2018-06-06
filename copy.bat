@echo off
REM https://www.youtube.com/watch?v=t4pBSAfyzF4

:0
REM MENU
cls
echo [1] Copy file
echo [2] Move file
echo [3] Rename file
echo [4] Exit
echo.
set /p USRSELECTION= What do you want to do: 
goto %USRSELECTION%

:1
REM COPY
cls
set /p USERFILE= What would you like to copy? 
set /p COPYTO= What folder do you want the copy stored? 
set CURENTDIRECTORY=%cd%
xcopy %CURENTDIRECTORY%\%USERFILE% %CURENTDIRECTORY%\%COPYTO%
pause
goto 0

:2
REM MOVE TO
cls
set /p USERFILE= What would you like to move? 
set /p COPYTO= What folder do you want the file moved to? 
set CURENTDIRECTORY=%cd%
move %CURENTDIRECTORY%\%USERFILE% %CURENTDIRECTORY%\%COPYTO%
pause
goto 0

:3
REM RENAME
cls
set /p USERFILE= File to Rename:  
set /p RENAMETO= Rename as:  
set CURENTDIRECTORY=%cd%
xcopy %CURENTDIRECTORY%\%USERFILE% %CURENTDIRECTORY%\%RENAMETO%
del %CURENTDIRECTORY%\%USERFILE%
pause
goto 0

:4
pause
exit