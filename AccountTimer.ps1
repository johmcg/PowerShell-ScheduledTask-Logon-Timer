#Save login time to text file.
$yourUser = 'Username Here'
$userInfo = net user $yourUser | Select-String 'Last logon'
$userInfo >> C:\Users\$yourUser\log.txt # or wherever you like

# Define the Wscript.Shell object once at the start
$wshell = New-Object -ComObject Wscript.Shell

# 5 Minute Warning
Start-Sleep -Seconds 1500
$wshell.Popup("5 Minutes Remaining", 0, "Timer", 0x1)

# 1 Minute Warning
Start-Sleep -Seconds 240 
$wshell.Popup("1 Minute Remaining", 0, "Timer", 0x1)

# Time Up
Start-Sleep -Seconds 60
$wshell.Popup("Time's Up!", 0, "Timer", 0x1)

Exit