@echo off
bitsadmin /transfer download /download /priority normal %1 "%~dpnx2"
echo on
