@echo off
echo ========================================
echo Pushing to GitHub
echo ========================================
echo.

cd /d C:\fabric

REM Push current HEAD to main branch on remote
git push -u origin HEAD:main

echo.
echo ========================================
echo DONE! Next steps:
echo ========================================
echo.
echo 1. Go to: https://github.com/unclevarda/vidchess/settings/pages
echo 2. Under "Source" select "Deploy from a branch"
echo 3. Select branch "main" and folder "/ (root)"
echo 4. Click Save
echo.
echo 5. Your game will be live at:
echo    https://unclevarda.github.io/vidchess/
echo.
echo ========================================
pause
