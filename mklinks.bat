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


%ORG_DIR:~0,2%
cd %ORG_DIR%
