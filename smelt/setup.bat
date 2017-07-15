@echo off
mkdir extension
mkdir logs
echo. > logs\setup.log
for %%i in (install.bat, update.cmd, uninstall.bat, reinstall.bat, sbpm.bat) do (
	bitsadmin /transfer setup /download /priority normal https://smelt-modding.github.io/smelt/%%i %~dp0\%%i >> logs\setup.log
)
call install.bat
echo on
