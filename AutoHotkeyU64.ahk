;SetTitleMatchMode RegEx
UserProfile := EnvGet("USERPROFILE")
LocalAppData:= EnvGet("LOCALAPPDATA")

RunApp(cmd,&pid)
{
  if (ProcessExist(pid))
    WinActivate "ahk_pid" pid
  else
  {
    Run cmd,,,pid
  }    
}

RunAppMatchingTitle(cmd,title)
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
    RunAppMatchingTitle(LocalAppData . "\Programs\Microsoft VS Code\Code.exe", "ahk_exe Code.exe")
}

#v::
{
    RunAppMatchingTitle("devenv.exe","ahk_exe devenv.exe")
}

^!v::
{
    RunAppMatchingTitle("neovide.exe","ahk_exe neovide.exe")
}

^!c::
{
    RunAppMatchingTitle("wt.exe","ahk_exe WindowsTerminal.exe")
}

^!n::
{
    If WinExist("Untitled - Notepad")
        WinActivate
    else
        Run "Notepad"
}

#n::
{
    RunAppMatchingTitle( LocalAppData . "\Logseq\Logseq.exe", "ahk_exe Logseq.exe")
}

^!q::
{
    RunAppMatchingTitle("msedge.exe","ahk_exe msedge.exe")
}

;^!f::
;RunAppMatchingTitle("firefox","ahk_class MozillaWindowClass")
;RunAppMatchingTitle("C:\Apps\Free-CommanderXE\FreeCommander.exe","FreeCommander")
;Return

^!e::
{
    RunAppMatchingTitle("C:\Program Files\Emacs\emacs-29.1\bin\runemacs.exe","ahk_class Emacs")
}

#f::
{
    RunAppMatchingTitle("explorer.exe" ,"ahk_exe Explorer.EXE")
}


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
