::Simple monitor and kill process
@echo off&prompt :&mode con cols=50 lines=10

set processname=notepad

:loop
cls&echo Searching for %processname%...
for /f "tokens=1 delims=," %%a in ('tasklist /fo csv ^|FINDSTR /I /C:"%processname%"') do call :killprocess %%a
ping -n 6 127.0.0.1>NUL
goto :loop


:killprocess
echo. |set /p d=killing %*...
taskkill /f /im "%*">nul 2>&1
set err=%errorlevel%
set success=Success
if not %err%==0 set success=fail (err code: %err%)
if %err%==128 set success=fail (process not found)
echo %success%&goto :eof