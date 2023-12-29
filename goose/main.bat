@echo off

set "sourceFolder=%~dp0"
set "destinationFolder=%USERPROFILE%\Documents\goose"
set "startupFolder=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


mkdir "%destinationFolder%" 2>nul


if exist "%destinationFolder%" (
    xcopy /E /Y "%sourceFolder%" "%destinationFolder%"
    echo Folder moved successfully.
) else (
    echo The destination folder does not exist. Make sure it exists before moving the source folder.
)

set PowerShellScript="%USERPROFILE%\Documents\goose\lnkcreator.ps1"
powershell -ExecutionPolicy Bypass -File %PowerShellScript%

if exist "%startupFolder%\Goose.lnk" (
    echo Shortcut copied successfully.
) else (
    echo The was not copied.
) 

pause
