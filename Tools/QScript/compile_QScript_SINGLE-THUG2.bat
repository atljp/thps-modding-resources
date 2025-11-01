@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo No file provided. Drag a .q file onto this script to decompile it.
    pause
    exit /b
)

set "inputFile=%~1"

if /I "%~x1" NEQ ".q" (
    echo The file must have a .q extension.
    pause
    exit /b
)

set "outputFile=%~dpn1.qb"

if exist "!outputFile!" (
    echo The output file "!outputFile!" already exists.
    set /p "overwrite=Do you want to overwrite it? (Y/N): "
    if /I "!overwrite!" NEQ "Y" (
        echo Operation canceled.
        pause
        exit /b
    )
)

QScript.QCompile.App.exe -input "!inputFile!" -output "!outputFile!" -target thug2
echo Compilation complete.

endlocal
pause