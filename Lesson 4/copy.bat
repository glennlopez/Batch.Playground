::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdDWDJH6N4GolKid2TRCBNCWKCrQF7/r0+uSDnmEYR/Ewds+P5reBMPld713hFQ==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
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