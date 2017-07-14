@echo off
if not exist logs (mkdir logs)
if "%1" EQU "/?" (goto help) else (if "%1" EQU "" (goto direct) else (goto param))
:help
echo Installs a command.
echo.
echo SBPM INSTALL package [/U | /UPGRADE]
echo.
echo.  package         Specifies the name of the package to install.
echo.  /U              Upgrades the specified package (used to avoid overwrite prompts)
goto end
:direct
if not exist extension (mkdir extension && echo "extension" folder doesn't exist, made and terminated... && exit)
echo Copy batch files...
echo Copy batch files... > logs\install.log
copy extension\*.bat %USERPROFILE% >> logs\install.log
goto init
:param
if /I "%2" EQU "/upgrade" (goto upgrade) else (if /I "%2" EQU "/u" (goto upgrade))
:install
echo Downloading batch file...
bitsadmin /transfer sbpm /download /priority normal https://smelt-batch.github.io/packages/%1.bat %USERPROFILE%\%1.bat > logs\install.log
goto init
:upgrade
echo Deleting batch file...
echo Deleting batch file... > logs\install.log
del %USERPROFILE%\%1.bat >> logs\install.log
goto install
:init
echo Make init.cmd...
echo Make init.cmd... >> logs\install.log
echo @echo off > %USERPROFILE%\init.cmd
for %%i in (extension\*.bat) do echo doskey %%~ni=%USERPROFILE%\%%~nxi $* >> %USERPROFILE%\init.cmd
echo doskey sbpm=%~dp0\sbpm.bat $* >> %USERPROFILE%\init.cmd
echo echo on >> %USERPROFILE%\init.cmd
echo Edit registry...
echo Edit registry... >> logs\install.log
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%"USERPROFILE"%init.cmd" /f >> logs\install.log
echo Success!
echo Success! >> logs\install.log
:end
