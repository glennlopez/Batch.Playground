@echo off
REM In batch script, it is also possible to define a variable to...
REM hold a numeric value. This can be done by using the /A switch.

set /a num1=10
set /A num2=20
set /a total=%num2% + %num1%
echo %total%
pause