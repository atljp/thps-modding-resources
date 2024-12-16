@echo off
setlocal enabledelayedexpansion

CD /D %~dp0
set "directory=%~dp0compiled"
set "outputBaseDir=%~dp0decompiled"


for /R "%directory%" %%f in (*.qb) do (
  echo %%f
  set "inputFile=%%f"

  set "relativePath=%%f"
  set "relativePath=!relativePath:%directory%=!"
  set "outputFile=%outputBaseDir%!relativePath:.qb=.q!"

  for %%d in ("!outputFile!") do if not exist "%%~dpd" mkdir "%%~dpd"
  QScript.QDecompile.App.exe -input "!inputFile!" -output "!outputFile!"
)
endlocal
pause


