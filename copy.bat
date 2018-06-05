@echo off

:0
cls
echo [1] Copy file
echo [2] Move file
echo [3] Exit
echo.
set /p USRSELECTION= What do you want to do: 
goto %USRSELECTION%

:1
cls
set /p USERFILE= What would you like to copy? 
set /p COPYTO= What folder do you want the copy stored? 
set CURENTDIRECTORY=%cd%
xcopy %CURENTDIRECTORY%\%USERFILE% %CURENTDIRECTORY%\%COPYTO%
pause
goto 0

:2
cls
set /p USERFILE= What would you like to move? 
set /p COPYTO= What folder do you want the file moved to? 
set CURENTDIRECTORY=%cd%
move %CURENTDIRECTORY%\%USERFILE% %CURENTDIRECTORY%\%COPYTO%
pause
goto 0

:3
pause
exit