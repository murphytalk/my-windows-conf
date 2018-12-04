; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

SetTitleMatchMode,RegEx

RunAndMovePutty(param,x,y,w,h)
{
    WM_ENTERSIZEMOVE = 0x231
    WM_EXITSIZEMOVE = 0x232

    Run C:\Apps\putty-0.60-jp20070603\puttyjp.exe -load %param%,,,pid
    Sleep,500
    SendMessage ,0x231,,,,ahk_pid %pid%
    WinMove, ahk_pid %pid%,,x,y,w,h
    SendMessage ,0x232,,,,ahk_pid %pid%

    return pid
}

StartPuttySession(session,ByRef pid,x,y,w,h)
{
  Process,Exist,%pid%
  If ErrorLevel
    WinActivate ahk_pid %pid%
  else
  {
    pid:=RunAndMovePutty(session,x,y,w,h)
    PIDS%pid_num%:=pid
    pid_num:=pid_num+1
  }
}

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

EnumPuttyWnd()
{
  WinGet,list,PID,ahk_class PuTTY
  Loop, %list%
  {
    thispid=list%A_Index%
    i:=0
    Loop
    {
      if i>pid_num
        break
      if PIDS%i% = thispid
        return
      i:=i+1
    }
    WinActivate ahk_pid %thispid%
  }
}

#c::
RunApp2(UserProfile . "\scoop\apps\conemu\current\ConEmu64.exe","ahk_class VirtualConsoleClass")
return 

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return

^!v::

#v::
RunApp2(UserProfile . "\scoop\apps\neovim\current\Neovim\bin\nvim-qt.exe", "ahk_exe nvim-qt.exe")
Return

#m::
RunApp2("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe","ahk_exe chrome.exe")
Return


#b::
;; legacy windows
SetTitleMatchMode,3
w := 952
h := 823
x := 2015
y := 39
WinMove, 2-BLOOMBERG, ,%x%, %y%, %w%, %h%
WinMove, 1-BLOOMBERG, ,x - w , %y%, %w%, %h%
WinMove, 3-BLOOMBERG, ,x - w , y + h, %w%, %h%
WinMove, 4-BLOOMBERG, ,x , y + h, %w%, %h%
;; All BBG windows
WinGet,id,List,ahk_class wdm-DesktopWindow
Loop, %id%
{
    this_id := id%A_Index%
    WinActivate, ahk_id %this_id%
    ;WinSet, Top, ,ahk_id %this_id%, , [0-9]-BLOOMBERG
}
return


^!p::
Run c:\Apps\putty
return 

^!f::
RunApp2("C:\Apps\Free-CommanderXE\FreeCommander.exe","FreeCommander")
Return

^!e::
RunApp2("C:\Apps\emacs\bin\runemacs.exe","ahk_class Emacs")
return

#f::
RunApp2("firefox","ahk_class MozillaWindowClass")
return


^!g::
;RunApp2("c:\msys64\my-msys2.cmd","ahk_class mintty")
RunApp2("C:\Windows\System32\bash.exe ~","ahk_exe bash.exe")
return

^!k::
RunApp2("C:\Apps\keepass\KeePass.exe","NewDataBase.kdbx.*")
return



; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
