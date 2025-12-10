# ⏳ PowerShell Session Countdown Timer and Logger

This is a PowerShell script designed to function as a fixed-duration countdown timer, providing critical pop-up notifications as a session nears its end. Additionally, it utilizes the `net user` command to log the last login time of the selected user.

---

## 📝 Key Features

* **Fixed 30-Minute Countdown:** Provides time warnings during a 30-minute period.
* **Pop-up Notifications:** Uses `Wscript.Shell` for non-blocking visual warnings.
* **Login Logging:** Logs the last login time of the current user via the `net user` command.
* **Optional Logoff:** Includes an optional line to forcibly log the user off the local machine upon timer expiration.
* **Silent Execution:** Designed to be launched via an accompanying VBS script to run silently via Windows Task Scheduler.

---

## 💡 How It Works

The script operates using a sequence of `Start-Sleep` commands followed by pop-up notifications. The total countdown is **30 minutes (1800 seconds)**.

1.  **Initialization:** The script creates the `Wscript.Shell` COM object, stored in the `$wshell` variable, to handle the pop-up windows.
2.  **5 Minute Warning:** The script pauses execution for **25 minutes (1500 seconds)**, then displays the first pop-up warning.
3.  **1 Minute Warning:** The script pauses for an additional **4 minutes (240 seconds)**, then displays the second warning.
4.  **Time's Up:** The script pauses for the final **1 minute (60 seconds)**, displays the "Time's Up!" notification, and then executes any final actions (like logging or logoff) before exiting.

### Login Logging

The script executes the **`net user`** command against the current username to gather the **"Last logon"** time. This data is then stored in a text file within the user's home directory for historical tracking.

### Silent Execution

The mention of the **Account Timer vbs script** indicates this PowerShell file should be wrapped in a VBS file when deployed via Windows Task Scheduler. This ensures the PowerShell console window does not appear, allowing the timer pop-ups to be the only visible notification.

---

## 🚀 Deployment and Usage

### Requirements

* Windows Operating System (PowerShell is required).
* Windows Task Scheduler access for silent execution.

### Execution Steps

1.  **Save Files:** Save the PowerShell code as `SessionTimer.ps1` and ensure you have an accompanying VBS script (e.g., `Account_Timer.vbs`) set up to launch it silently.
2.  **Configure Logging:** Ensure the directory used for logging has appropriate user permissions.
3.  **Schedule Task:** Set up a scheduled task to run the VBS script **"At log on"** for the target users.

### Optional Logoff

To enable logging the user off the local machine immediately after the "Time's Up!" notification, ensure the following command is **uncommented** in your script:

```powershell
# Uncomment the line below to log the user off the machine immediately after the timer expires.
# logoff

## Sample XML File
A sample xml file is provided to help import this to task scheduler on selected machines. It will need to be updated to fit your needs.