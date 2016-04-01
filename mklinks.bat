rem
rem This batch needs to be run elevated
rem What it does is :
rem
rem  1) go to msys2's /usr/bin and make vi -> vim link
rem  2) go to msys2's /etc/profile.d and make links to all scripts under this project's profile.d folder
rem  3) go to msys's install dir and make link to msys2.cmd
rem  4) find and go to normal user's home, make links to all scripts under this projects's home foler
rem
rem  It won't try to create the link if it already exists.
rem 

@echo off
set ORG_DIR=%CD%
set MYPATH=%~dp0
set MSYS=c:\msys64
set MSYS2CONF=%MYPATH%
set MKLINK=%MYPATH%my-mklink.bat
set MSYS_DRIVE=%MSYS:~0,2%

%MSYS_DRIVE%
cd %MSYS%\usr\bin
rem echo dir1 %CD%
call %MKLINK% vi vim.exe

cd %MSYS%\etc\profile.d
rem cd %MSYS2CONF%\profile.d
rem echo dir3 %CD%

set D=%MSYS2CONF%\profile.d
for %%f in (%D%\*) do (
    rem use for/? to see explanation of all modifiers
    call %MKLINK% %%~nxf %D%\%%~nxf 
)

cd %MSYS%
call %MKLINK% my-msys2.cmd %MSYS2CONF%\msys2.cmd

rem the following code only gets elevated user's my doc path ...
rem save My document path to var mydocuments
rem for /f "tokens=3* delims= " %%a in ('reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') do (set mydocuments=%%a %%b)
rem echo %mydocuments%

if exist c:\Users\murphytalk (
   set MYHOME=c:\Users\murphytalk
) else (
  if exist c:\Users\murph (
     set MYHOME=c:\Users\murph
  )
  else(
     goto DONE
  )
)

c:
cd %MYHOME%
set D=%MSYS2CONF%\home
for %%f in (%D%\*) do (
    rem use for/? to see explanation of all modifiers
    call %MKLINK% %%~nxf %D%\%%~nxf 
)


:DONE
%ORG_DIR:~0,2%
cd %ORG_DIR%
