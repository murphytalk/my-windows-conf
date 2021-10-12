SetTitleMatchMode,RegEx

RunApp(cmd,ByRef pid)
{
  Process,Exist,%pid%
  If ErrorLevel
    WinActivate ahk_pid %pid%
  else
  {
    Run %cmd%,,,pid
  }    
}

RunApp2(cmd,title)
{
  SetTitleMatchMode 2
  IfWinExist %title%
	WinActivate
  Else
	Run %cmd%
  Return
}

#c::
RunApp2(UserProfile . "\scoop\apps\vscode\current\Code.exe", "ahk_exe Code.exe")
return

^!c::
RunApp2("wt.exe","ahk_exe WindowsTerminal.exe")
return

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return

^!q::
RunApp2("msedge.exe","ahk_exe msedge.exe")
Return

^!f::
RunApp2("firefox","ahk_class MozillaWindowClass")
;RunApp2("C:\Apps\Free-CommanderXE\FreeCommander.exe","FreeCommander")
Return

^!e::
RunApp2(UserProfile . "\scoop\apps\emacs\current\bin\runemacs.exe","ahk_class Emacs")
return

#f::
RunApp2("explorer.exe" ,"ahk_exe Explorer.EXE")
return

^!k::
RunApp2(UserProfile . "scoop\apps\keepass\current\KeePass.exe","NewDataBase.kdbx.*")
return



; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
