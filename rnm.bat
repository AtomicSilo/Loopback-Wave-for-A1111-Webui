@echo off
setlocal EnableDelayedExpansion

set "file_pattern=*.png"
set /a count=1

for /f "tokens=1* delims=:" %%a in ('dir /b /a-d "%file_pattern%" 2^>nul ^| findstr /n "^"') do (
    set "old_name=%%b"
    set "new_name=!count!.png"
    echo Renaming "!old_name!" to "!new_name!"...
    ren "!old_name!" "!new_name!" >nul 2>&1
    if !errorlevel! neq 0 (
        echo Failed to rename "!old_name!" to "!new_name!" - error code: !errorlevel!
    )
    set /a count+=1
)

echo File count: %count%
pause
