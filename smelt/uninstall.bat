@echo off
if "%1" EQU "/?" (goto help) else (if "%1" EQU "" (goto direct) else (goto param))
:help
echo Uninstalls a command.
echo.
echo SBPM UNINSTALL package
echo.
echo.  package         Specifies the name of the package to uninstall.
echo.
echo This is the method to uninstall a single command, but double-clicking uninstall.bat or running SBPM UNINSTALL with no arguments will uninstall the entire manager.
goto end
:direct
echo Edit registry...
echo Edit registry...>> %~dp0\logs\uninstall.log
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f >> %~dp0\logs\uninstall.log
echo Delete batch file...
echo Delete batch file...> %~dp0\logs\uninstall.log
del %USERPROFILE%\init.cmd >> %~dp0\logs\uninstall.log
echo Success!
echo Success!>> %~dp0\logs\uninstall.log
goto end
:param
echo Delete batch file...
echo Delete batch file...> %~dp0\logs\uninstall.log
del %~dp0\extension\%1.bat >> %~dp0\logs\uninstall.log
goto end
:end
