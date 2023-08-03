@echo off
set userProfile=%userprofile%
set "ScreenConnect=%userProfile%\AppData\Local\Apps\2.0"

if exist "%ScreenConnect%" (
  echo ScreenConnect is installed
  echo Stoping ScreenConnect 
  taskkill /f /im ScreenConnect.WindowsClient.exe
  taskkill /f /im ScreenConnect.ClientService.exe
  echo Deleteing ScreenConnect
  RD /s "%userProfile%\AppData\Local\Apps"
) else (
  echo ScreenConnect is NOT installed
)

pause