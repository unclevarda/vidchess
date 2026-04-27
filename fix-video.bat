@echo off
echo ========================================
echo Fixing black video and pushing
echo ========================================
echo.

cd /d C:\fabric

echo === Committing video fix ===
git add index.html
git commit -m "Fix black video: add min-height to container and explicit .play() call"

echo.
echo === Pushing to GitHub ===
git push -u origin main

echo.
echo ========================================
echo DONE! Video should work now.
echo ========================================
echo.
echo Refresh https://unclevarda.github.io/vidchess/
echo (may take ~30 seconds for GitHub Pages to rebuild)
echo.
pause