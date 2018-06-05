@ECHO OFF
REM https://www.youtube.com/watch?v=MdcHOTr3toU

REM This is the CLI menu
:MENU
CLS
ECHO [1] Create Password
ECHO [2] Check Password
ECHO [3] Exit Program
ECHO.

SET /P SELECTION= What do you want to do? 
goto %SELECTION%

REM This will store password to a text file
:1
CLS
SET /P PASSWORD= Enter your password: 
ECHO %PASSWORD% > password.txt
goto MENU

REM This will check to see if a password is stored in the password text file
:2
CLS
SET /P CHECKPASSWORD= What is your password: 
for /f "Delims=" %%a in (password.txt) do (
    set TEXTFILEPASSWORD= %%a
)

if %CHECKPASSWORD%==%TEXTFILEPASSWORD% goto MATCH
ECHO Password incorrect! Try again.
PAUSE
goto MENU

:MATCH
ECHO PASSWORD IS A MATCH!
PAUSE
goto MENU

REM EXIT PROGRAM
:3
CLS
ECHO Program will exit.
REM PAUSE
exit