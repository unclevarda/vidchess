@echo off
echo ========================================
echo Diagnosing git repo
echo ========================================
echo.

cd /d C:\fabric

echo === Git status ===
git status
echo.

echo === Git branch ===
git branch -a
echo.

echo === Git log ===
git log --oneline -5
echo.

echo === Git remote ===
git remote -v
echo.

echo === Git reflog ===
git reflog -5
echo.

echo ========================================
echo Diagnosis complete
echo ========================================
pause
