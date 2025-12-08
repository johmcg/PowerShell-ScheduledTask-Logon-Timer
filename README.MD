# ⏳ Simple PowerShell Fixed-Duration Countdown Timer

This is a basic PowerShell script that acts as a simple, fixed-duration countdown timer. It is designed to provide pop-up notifications at specific intervals before the time expires.

---

## 💡 How It Works

The script operates using a sequence of `Start-Sleep` commands followed by pop-up notifications. The total countdown is **10 minutes (600 seconds)**.

1.  **Initialization:** The script creates the `Wscript.Shell` COM object, stored in the `$wshell` variable, to handle the pop-up windows.
2.  **5 Minute Warning:** The script pauses execution for **300 seconds (5 minutes)**, then displays the first pop-up warning.
3.  **1 Minute Warning:** The script pauses for an additional **240 seconds (4 minutes)**, then displays the second warning.
4.  **Time's Up:** The script pauses for the final **60 seconds (1 minute)**, displays the "Time's Up!" notification, and then exits.