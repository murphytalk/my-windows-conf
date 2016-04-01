@echo off
set MSYS=c:\msys64
set MSYS2CONF=%CD%

cd %MSYS%\usr\bin
echo dir1 %CD%
rem mklink vi vim.exe

cd %MSYS%\etc\profile.d
echo dir2 %CD%

rem cd %MSYS2CONF%\profile.d
rem echo dir3 %CD%

set D=%MSYS2CONF%\profile.d
for %%f in (%D%\*) do (
    rem use for/? to see explanation of all modifiers
    mklink %%~nxf %D%\%%~nxf 
)


cd %MSYS2CONF%
