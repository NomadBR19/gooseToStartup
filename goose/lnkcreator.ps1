$executablePath = "$env:USERPROFILE\Documents\goose\GooseDesktop.exe"

$startupFolder = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$shortcutPath = Join-Path -Path $startupFolder -ChildPath "Goose.lnk"

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = $executablePath
$shortcut.Save()

Move-Item -Path $shortcutPath -Destination $startupFolder -Force