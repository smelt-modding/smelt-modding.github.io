@echo off
if /I "%1" EQU "install" (call install.bat %2) else (call uninstall.bat %2)
echo on