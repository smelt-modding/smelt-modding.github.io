@echo off
echo Remove old version...
echo Remove old version... > %~dp0\logs\update.log
call %~dp0\uninstall.bat
echo Download new version...
echo Download new version... >> %~dp0\logs\update.log
for %%i in (%~dp0\*.bat) do (
	del %%~dpnxi
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://smelt-modding.github.io/smelt/%%~nxi', '%~dp0\%%~nxi')" >> %~dp0\logs\update.log
)
echo Install new version...
echo Install new version... >> %~dp0\logs\update.log
call %~dp0\install.bat
echo Update update...
echo Update update... >> %~dp0\logs\update.log
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://smelt-modding.github.io/smelt/update.cmd', '%~dp0\update.bat')" >> %~dp0\logs\update.log
type %~dp0\update.bat > %~f0 && del %~dp0\update.bat
