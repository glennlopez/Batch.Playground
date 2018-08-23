Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run Chr(34) & "Z:\GitHub\Batch.Playground\Sandbox\usage_log.bat" & Chr(34), 0
Set WinScriptHost = Nothing