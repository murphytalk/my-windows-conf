;SetTitleMatchMode RegEx
UserProfile := EnvGet("USERPROFILE")

RunApp(cmd,&pid)
{
  if (ProcessExist(pid))
    WinActivate "ahk_pid" pid
  else
  {
    Run cmd,,,pid
  }    
}

RunApp2(cmd,title)
{
  SetTitleMatchMode 2
  If !WinExist(title){
	Run cmd
    Return
  }
  WinActivate
}

#c::
{
    RunApp2(UserProfile . "\scoop\apps\vscode\current\Code.exe", "ahk_exe Code.exe")
}

^!c::
{
    RunApp2("wt.exe","ahk_exe WindowsTerminal.exe")
}

^!n::
{
    If WinExist "Untitled - Notepad"
        WinActivate
    else
        Run "Notepad"
}

#n::
{
    RunApp2(UserProfile . "\scoop\apps\Logseq\current\Logseq.exe", "ahk_exe Logseq.exe")
}

^!q::
{
    RunApp2("msedge.exe","ahk_exe msedge.exe")
}

;^!f::
;RunApp2("firefox","ahk_class MozillaWindowClass")
;RunApp2("C:\Apps\Free-CommanderXE\FreeCommander.exe","FreeCommander")
;Return

^!e::
{
    RunApp2(UserProfile . "\scoop\apps\emacs\current\bin\runemacs.exe","ahk_class Emacs")
}

#f::
{
    RunApp2("explorer.exe" ,"ahk_exe Explorer.EXE")
}

^!k::
{
    RunApp2(UserProfile . "\scoop\apps\keepass\current\KeePass.exe","ahk_exe KeePass.exe")
}


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
