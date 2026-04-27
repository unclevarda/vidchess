@echo off
cd /d C:\fabric

REM === CHANGE THESE TWO LINES ===
set GH_USER=unclevarda
set GH_REPO=vidchess

echo ========================================
echo Pushing to github.com/%GH_USER%/%GH_REPO%
echo ========================================
echo.

git remote add origin https://github.com/%GH_USER%/%GH_REPO%.git
git branch -M main
git push -u origin main

echo.
echo ========================================
echo DONE! Next steps:
echo ========================================
echo 1. Go to: https://github.com/%GH_USER%/%GH_REPO%/settings/pages
echo 2. Under "Source" select "Deploy from a branch"
echo 3. Select branch "main" and folder "/ (root)"
echo 4. Click Save
echo 5. Your game will be live at:
echo    https://%GH_USER%.github.io/%GH_REPO%/
echo ========================================
pause
