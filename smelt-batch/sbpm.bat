@echo off
if /I "%1" EQU "install" (
  call %~dp0\install.bat %2
) else (
  if /I "%1" EQU "uninstall" (
    call %~dp0\uninstall.bat %2
  ) else (
    if /I "%1" EQU "reinstall" (
      call %~dp0\reinstall.bat
    ) else (
      call %~dp0\update.cmd
    )
  )
)
echo on
