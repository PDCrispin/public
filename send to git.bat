@echo off
REM ================================
REM Auto-add, commit, and push all
REM ================================

REM Move to the directory of the script
cd /d "%~dp0"

REM Add all changes
git add -A

REM Create a timestamp for commit message
for /f "tokens=1-4 delims=/:. " %%a in ("%date% %time%") do (
    set datestr=%%a-%%b-%%c_%%d
)
set commitmsg=Auto update %datestr%

REM Commit
git commit -m "%commitmsg%"

REM Push to the current branch
git push

echo.
echo ================================
echo   Finished pushing to Git
echo ================================
echo.
pause
