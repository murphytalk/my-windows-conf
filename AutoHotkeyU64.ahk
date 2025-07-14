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

MoveActiveWindow(x, y, width, height) {
    ; Get the handle of the active window
    hWnd := WinGetID("A")
    ;WinMinimize hWnd
    ; Move the active window
    WinMove x, y, width, height, hWnd
}

; move to left screen
#o::MoveActiveWindow(-8	, -8, 1936, 1168)
; move to right screen
#p::MoveActiveWindow( 1912, -972,3856,2128)

#c::RunAppMatchingTitle(LocalAppData . "\Programs\Microsoft VS Code\Code.exe", "ahk_exe Code.exe")

#v::RunAppMatchingTitle("devenv.exe","ahk_exe devenv.exe")

^!v::RunAppMatchingTitle("neovide.exe","ahk_exe neovide.exe")

^!c::RunAppMatchingTitle("wt.exe","ahk_exe WindowsTerminal.exe")

^!n::
{
    If WinExist("Untitled - Notepad")
        WinActivate
    else
        Run "Notepad"
}

#n::RunAppMatchingTitle( LocalAppData . "\Logseq\Logseq.exe", "ahk_exe Logseq.exe")

^!q::RunAppMatchingTitle("msedge.exe","ahk_exe msedge.exe")

;^!f::
;RunAppMatchingTitle("firefox","ahk_class MozillaWindowClass")
;RunAppMatchingTitle("C:\Apps\Free-CommanderXE\FreeCommander.exe","FreeCommander")
;Return

^!e::RunAppMatchingTitle("C:\Program Files\Emacs\emacs-29.1\bin\runemacs.exe","ahk_class Emacs")

#f::RunAppMatchingTitle("explorer.exe" ,"ahk_exe Explorer.EXE")

^#!w::
{
    ; --- Configuration ---
    ; Set the full path to your PowerShell script here.
    psScriptPath := "D:\work\my-windows-conf\ps1\wireguard.ps1"

    ; --- Execution ---
    try
    {
        ; Use Run with *RunAs to request Administrator privileges.
        Run '*RunAs powershell.exe -NoProfile -ExecutionPolicy Bypass -File "' . psScriptPath . '"'
    }
    catch
    {
        MsgBox "Failed to run the script. Please check the path and ensure AutoHotkey has the necessary permissions."
    }
}
