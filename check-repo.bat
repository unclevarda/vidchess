@echo off
echo ========================================
echo Checking git status
echo ========================================
echo.
echo === Git status ===
git status
echo.
echo === Git log ===
git log --oneline -5
echo.
echo === Git remote ===
git remote -v
echo.
echo ========================================
echo Done
echo ========================================
pause