@echo off

set /p first= Type first word: 
set /p second= Type second word: 

REM This will send the variable to anything thats called
call recieve2.bat %first% %second%