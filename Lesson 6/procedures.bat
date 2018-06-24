@echo off

if %2 == NUL echo ""
if %2 == you echo "Im good, thanks for asking."
if %1 == good echo "Glad to know you're good!"
if %1 == Good echo "Glad to know you're Good!"
pause