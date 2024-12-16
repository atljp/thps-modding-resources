@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo No file provided. Drag a .qb file onto this script to decompile it.
    pause
    exit /b
)

set "inputFile=%~1"

if /I "%~x1" NEQ ".qb" (
    echo The file must have a .qb extension.
    pause
    exit /b
)

set "outputFile=%~dpn1.q"
QScript.QDecompile.App.exe -input "!inputFile!" -output "!outputFile!"
echo Decompilation complete.

endlocal
pause