@echo off
echo Remove old version...
echo Remove old version... > %~dp0\logs\update.log
call %~dp0\uninstall.bat
echo Download new version...
echo Download new version... >> %~dp0\logs\update.log
for %%i in (%~dp0\*.bat) do (
  del %%~nxi
  bitsadmin /transfer sbpm-update /download /priority normal https://smelt-modding.github.io/smelt/%%~nxi %~dp0\%%~nxi >> %~dp0\logs\update.log
)
echo Install new version...
echo Install new version... >> %~dp0\logs\update.log
call %~dp0\install.bat
echo on