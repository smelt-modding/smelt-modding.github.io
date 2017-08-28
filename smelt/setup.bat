@echo off
mkdir extension
mkdir logs
echo. > logs\setup.log
for %%i in (install.bat, update.cmd, uninstall.bat, reinstall.bat, sbpm.bat) do (
	powershell -Command "(New-Object Net.WebClient).DownloadFile('https://smelt-modding.github.io/smelt/%%i', '%~dp0\%%i')" >> logs\setup.log
)
call install.bat
echo on
