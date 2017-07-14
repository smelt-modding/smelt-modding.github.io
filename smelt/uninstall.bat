@echo off
if "%1" EQU "/?" (goto help) else (if "%1" EQU "" (goto direct) else (goto param))
:help
echo Uninstalls a command.
echo.
echo SBPM UNINSTALL package
echo.
echo.  package         Specifies the name of the package to uninstall.
echo.
echo This is the method to uninstall a single command, but double-clicking uninstall.bat will uninstall the entire manager
goto end
:direct
echo Edit registry...
echo Edit registry... >> logs\uninstall.log
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f >> logs\uninstall.log
echo Delete batch files...
echo Delete batch files... > logs\uninstall.log
del %USERPROFILE%\init.cmd >> logs\uninstall.log
del %USERPROFILE%\*.bat >> logs\uninstall.log
echo Success!
echo Success! >> logs\uninstall.log
goto end
:param
echo Delete batch file...
echo Delete batch file... > logs\uninstall.log
del %USERPROFILE%\%1.bat >> logs\uninstall.log
goto end
:end
