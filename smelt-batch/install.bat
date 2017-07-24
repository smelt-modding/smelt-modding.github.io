@echo off
if not exist %~dp0\logs (mkdir %~dp0\logs)
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
if not exist %~dp0\extension (mkdir %~dp0\extension && echo "extension" folder doesn't exist, made and terminated... && exit)
echo Copy batch files...
echo Copy batch files... > %~dp0\logs\install.log
copy %~dp0\extension\*.bat %USERPROFILE% >> %~dp0\logs\install.log
goto init
:param
if /I "%2" EQU "/upgrade" (goto upgrade) else (if /I "%2" EQU "/u" (goto upgrade))
:install
echo Downloading batch file...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://smelt-modding.github.io/batch-packages/%1.bat', '%USERPROFILE%\%1.bat')" > %~dp0\logs\install.log
goto init
:upgrade
echo Deleting batch file...
echo Deleting batch file... > %~dp0\logs\install.log
del %USERPROFILE%\%1.bat >> %~dp0\logs\install.log
goto install
:init
echo Make init.cmd...
echo Make init.cmd... >> %~dp0\logs\install.log
echo @echo off > %USERPROFILE%\init.cmd
for %%i in (%~dp0\extension\*.bat) do echo doskey %%~ni=%USERPROFILE%\%%~nxi $* >> %USERPROFILE%\init.cmd
echo doskey sbpm=%~dp0\sbpm.bat $* >> %USERPROFILE%\init.cmd
echo echo on >> %USERPROFILE%\init.cmd
echo Edit registry...
echo Edit registry... >> %~dp0\logs\install.log
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%USERPROFILE%\init.cmd" /f >> %~dp0\logs\install.log
echo Success!
echo Success! >> %~dp0\logs\install.log
:end
