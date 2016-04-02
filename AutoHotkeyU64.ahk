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
RunApp2("C:\Apps\ConEmu\ConEmu64.exe","ahk_class VirtualConsoleClass")
return 

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return

^!v::
IfWinExist SPICEc:0
	WinActivate
else
	Run c:\tools\spice-client-win32-0.6.3\spicec.exe -h hp -p 5930
return

#v::
RunApp2("c:\Apps\putty -load vm","murphy@arch-vm")
Return

^!p::
Run c:\Apps\putty
return 

^!f::
RunApp2("C:\Apps\Free-CommanderXE\FreeCommander.exe","FreeCommander")
Return

^!e::
RunApp2("C:\Apps\emacs\bin\runemacs.exe","ahk_class Emacs")
return

^!g::
RunApp2("c:\msys64\my-msys2.cmd","ahk_class mintty")
return

^!k::
RunApp2("C:\Apps\keepass\KeePass.exe","NewDataBase.kdbx.*")
return



; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
