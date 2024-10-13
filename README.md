# Group Policy Refresher

## Overview
This batch script deletes Group Policy-related folders on a specified remote computer and then forces a Group Policy update using PsExec. It is useful for administrators needing to refresh Group Policy settings across multiple machines.

## Script Breakdown
1. **Start and Set Parameters:**
   Prompts the user to enter the computer name.
   ```batch
   :START
   @echo off
   set /P "CompName=Please enter the computer name: "
   ```

2. **Remove Group Policy Folders**: Deletes various Group Policy-related folders on the specified remote computer.
   ```batch
   rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\DataStore
   rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\Machine
   rmdir /s /q \\%CompName%\C$\Windows\System32\GroupPolicy\User
   del /s /q /f \\%CompName%\C$\Windows\System32\GroupPolicy\*
   ```

3. **Force Group Policy Update**: Uses PsExec to force a Group Policy update on the remote computer.
   ```batch
   D:\PSTools\psexec \\%CompName% cmd /c gpupdate/force
   ```

4. **Output and Loop**: Outputs a confirmation message and repeats the process.
   ```batch
   cls
   echo GroupPolicy Refreshed On PC: %CompName%
   GOTO START
   ```

## Usage

1. **Run the Script: Execute the script in an elevated Command Prompt session.
   ```vbscript
   .\group-policy-refresher.bat

   ```


## License
This script is licensed under the MIT License. See the LICENSE file for details.


