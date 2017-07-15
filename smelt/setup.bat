@echo off
mkdir extension
mkdir logs
for %%i in (install.bat, update.cmd, uninstall.bat, reinstall.bat, sbpm.bat) do (
	bitsadmin /transfer setup /download /priority normal https://smelt-modding.github.io/smelt/%%i %%i
)
call install.bat
echo on
