:START
@echo off
set /P "CompName=Please enter the computer name: "
rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\DataStore
rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\Machine
rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\User
del /s /q /f \\%CompName%\C$\Windows\System32\GroupPolicy\* 
D:\PSTools\psexec \\%CompName%  cmd /c gpupdate/force
cls
echo GroupPolicy Refreshed On PC: %CompName%
GOTO START
