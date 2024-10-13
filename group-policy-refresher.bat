@echo off
:START
REM Prompt for computer name
set /P "CompName=Please enter the computer name: "

REM Remove Group Policy folders
rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\DataStore
rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\Machine
rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\User
del /s /q /f \\%CompName%\C$\Windows\System32\GroupPolicy\*

REM Force Group Policy update
D:\PSTools\psexec \\%CompName% cmd /c gpupdate /force

REM Clear screen and output status
cls
echo Group Policy Refreshed On PC: %CompName%

REM Repeat process
goto START
