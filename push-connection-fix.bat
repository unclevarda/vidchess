@echo off
echo ========================================
echo Pushing connection fix
echo ========================================
echo.
git add index.html
git commit -m "Fix: Add retry logic and auto-reconnect for peer connections"
git push -u origin main
echo.
echo ========================================
echo DONE! Connection fix pushed.
echo ========================================
echo.
echo Your friend should now be able to join with automatic retries.
echo If it still fails, try creating a fresh room.
echo.
pause