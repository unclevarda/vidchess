@echo off
echo ========================================
echo Renaming to index.html and pushing
echo ========================================
echo.

ren chessroulette.html index.html
git add index.html
git commit -m "Rename to index.html for GitHub Pages"
git push

echo.
echo ========================================
echo DONE! Your game is live at:
echo https://unclevarda.github.io/vidchess/
echo ========================================
echo.
pause
