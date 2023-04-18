@echo off
setlocal enabledelayedexpansion

set "ext=.png"

for %%i in (*%ext%) do (
    set "filename=%%~ni"
    set "newfilename="
    if "%%~xi"=="%ext%" (
        if "!filename:~1,1!"=="" (
            set "newfilename=00!filename!"
        ) else if "!filename:~2,1!"=="" (
            set "newfilename=0!filename!"
        )
        if not "!newfilename!"=="" (
            ren "%%i" "!newfilename!%%~xi"
        )
    )
)
