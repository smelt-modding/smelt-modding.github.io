@echo off
if "%1" EQU "/?" (goto help) else (goto action)
:help
echo Logs output of a command to a file.
echo.
echo LOG destination command [arg1-7]
echo.
echo     destination		Destination for log file
echo     command		Command used
echo     arg1-7		Due to how the command works, only 7 arguments at most
echo.
goto end
:action
%2 %3 %4 %5 %6 %7 %8 %9 > %2.log
move %2.log %1
echo Output logged
goto end
:end
@echo on