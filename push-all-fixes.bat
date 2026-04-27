@echo off
echo === Pushing VidChess Fixes ===
echo.

cd /d C:\fabric

echo Adding changes...
git add index.html

echo Committing...
git commit -m "Fix PeerJS connections, video playback, and square highlights

- Add STUN servers to PeerJS config for better connection reliability
- Improve retry logic with 5 attempts and 5-second timeout
- Add explicit .play() calls for local and remote video
- Fix square highlighting: clear before each move, improved visibility
- Add connection status logging and error handling
- Fix peer.on('call') to properly handle remote video streams"

echo Pushing to GitHub...
git push -u origin main

echo.
echo Done! Changes will be live at https://unclevarda.github.io/vidchess/ in ~30 seconds
pause
