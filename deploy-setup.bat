@echo off
cd /d C:\fabric

REM Initialize git repo
call "C:\Program Files\Git\bin\git.exe" init
call "C:\Program Files\Git\bin\git.exe" add chessroulette.html vidchess.md .gitignore
call "C:\Program Files\Git\bin\git.exe" commit -m "VidChess - multiplayer chess with video call"

echo.
echo ============================================
echo  Git repo initialized and committed!
echo ============================================
echo.
echo Next steps to deploy on GitHub Pages:
echo.
echo 1. Create a NEW repository on github.com (name it whatever you want)
echo 2. Copy the commands github shows you (they look like:)
echo.
echo    git remote add origin https://github.com/YOURNAME/REPO.git
echo    git branch -M main
echo    git push -u origin main
echo.
echo 3. Run those commands in this same window
echo 4. Then go to Settings ^> Pages ^> Source: main branch
echo.
echo The game will be at: https://YOURNAME.github.io/REPO/
echo.
pause
