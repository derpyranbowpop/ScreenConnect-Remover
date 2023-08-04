@echo off
set userProfile=%userprofile%
set "ScreenConnect=%userProfile%\AppData\Local\Apps\2.0"
set "params=%*"

@rem Auto admin
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

@rem Check if AppData\Local\Apps\2.0 exists 
if exist "%ScreenConnect%" (
  echo ScreenConnect is installed
  echo Stoping ScreenConnect 
  taskkill /f /im ScreenConnect.WindowsClient.exe
  taskkill /f /im ScreenConnect.ClientService.exe
  echo Deleteing ScreenConnect
  @rem Deletes the folder it is located
  RD /s /q "%userProfile%\AppData\Local\Apps"
) else (
  echo ScreenConnect is NOT installed
)

pause