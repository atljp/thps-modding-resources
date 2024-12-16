@echo off
setlocal enabledelayedexpansion

CD /D %~dp0
set "directory=%~dp0decompiled"
set "outputBaseDir=%~dp0recompiled"

for /R "%directory%" %%f in (*.q) do (
    echo %%f
    set "inputFile=%%f"
    set "relativePath=%%f"
    set "relativePath=!relativePath:%directory%=!"
    set "outputFile=%outputBaseDir%!relativePath:.q=.qb!"

    for %%d in ("!outputFile!") do if not exist "%%~dpd" mkdir "%%~dpd"
    QScript.QCompile.App.exe -input !inputFile! -output !outputFile! -target thug2
)
endlocal
pause


