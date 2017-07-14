@echo off
echo Edit registry...
echo Edit registry... >> logs\uninstall.log
reg delete "HKCU\Software\Microsoft\Command Processor" /v AutoRun /f >> logs\uninstall.log
echo Delete batch files...
echo Delete batch files... > logs\uninstall.log
del %USERPROFILE%\init.cmd >> logs\uninstall.log
del %USERPROFILE%\*.bat >> logs\uninstall.log
echo Success!
echo Success! >> logs\uninstall.log