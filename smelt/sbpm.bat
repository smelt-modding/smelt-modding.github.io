@echo off
if /I "%1" EQU "install" (call %~dp0\install.bat %2) else (call %~dp0\uninstall.bat %2)
echo on
