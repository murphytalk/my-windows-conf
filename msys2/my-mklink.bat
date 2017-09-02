@echo off
set LINK=%1
set TARGET=%2

if exist %LINK% (
  echo Link %LINK% already exists
) else (
  mklink %LINK% %TARGET%
)
