@echo off
echo ========================================
echo Configuring git and pushing to GitHub
echo ========================================
echo.

cd /d C:\fabric

echo === Setting git identity ===
git config --global user.email "unclevarda@gmail.com"
git config --global user.name "unclevarda"
echo Done!
echo.

echo === Committing staged files ===
git commit -m "Initial commit: VidChess - multiplayer chess with video call"
echo.

echo === Pushing to GitHub ===
git push -u origin main
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
