@echo off
echo Copy batch files...
echo Copy batch files... > logs\install.log
copy extension\*.bat %USERPROFILE% >> logs\install.log
echo Make init.cmd...
echo Make init.cmd... >> logs\install.log
echo @echo off > %USERPROFILE%\init.cmd
for %%i in (extension\*.bat) do echo doskey %%~ni=%USERPROFILE%\%%~nxi $* >> %USERPROFILE%\init.cmd
echo echo on >> %USERPROFILE%\init.cmd
echo Edit registry...
echo Edit registry... >> logs\install.log
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%"USERPROFILE"%init.cmd" /f >> logs\install.log
echo Success!
echo Success! >> logs\install.log