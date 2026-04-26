# VidChess - Project Notes

**Live URL:** https://unclevarda.github.io/vidchess/  
**GitHub:** https://github.com/unclevarda/vidchess  
**Concept:** Lichess × Chatroulette - Random chess matchmaking with video chat

---

## ✅ COMPLETED FIXES (2026-04-26)

### 1. PeerJS Connection Reliability (CRITICAL)
- Added STUN servers for better NAT traversal
- Improved retry logic: 5 attempts with 5-second timeout
- Connection timeout detection and auto-retry
- Better error logging

### 2. Video Streaming (CRITICAL)
- Added explicit `.play()` calls for local and remote video
- Fixed `peer.on('call')` handler for joiner
- Added `facingMode: 'user'` for camera selection
- Video play error handling

### 3. Square Highlighting (VISUAL)
- Fixed `clearHighlights()` being called before each move
- Improved highlight color: green-yellow with border
- Visible on both light and dark squares

### 4. Bug Fixes
- Both players controlling both sides → Added `playerColor` turn check
- `addChatMessage` crash in lobby → Inline confirmation for copy
- Video calls missed → Handler registered early in createGame/joinGame
- Deprecated `execCommand('copy')` → Using `navigator.clipboard.writeText()`
- Draw offer no UI → Added Accept/Decline buttons

---

## 🎮 HOW TO PLAY

1. **Create Game:** Click "Create Game" → Copy the room link
2. **Share Link:** Send link to opponent (or open in new tab to test)
3. **Join Game:** Opponent clicks link or pastes room code
4. **Play Chess:** 
   - White moves first
   - Drag and drop pieces
   - Last move highlighted in green-yellow
   - Chat with opponent via video
5. **Game Over:** Checkmate, timeout, resignation, or draw

---

## 🏗️ ARCHITECTURE

### Tech Stack
- **Frontend:** Vanilla HTML/CSS/JavaScript
- **Chess Logic:** Chess.js (move validation, FEN, PGN)
- **Board UI:** Chessboard.js (drag-drop, animations)
- **P2P Connection:** PeerJS (WebRTC wrapper)
- **Video/Audio:** WebRTC (getUserMedia, RTCPeerConnection)
- **Hosting:** GitHub Pages (static)

### File Structure
```
C:\fabric/
├── index.html          # Single-file app (800+ lines)
├── vidchess.md         # This file
├── FIXES_SUMMARY.md    # Detailed fix documentation
├── test-logs/          # Test session logs
│   ├── comprehensive-test-results.txt
│   ├── host-log.txt
│   └── joiner-log.txt
└── *.bat               # Deployment batch files
```

### Key Functions

**Connection Flow:**
```
createGame() → Peer('cr-' + roomId) → wait for connection → setupConnection()
joinGame(room) → Peer() → connect('cr-' + room) → setupConnection()

setupConnection():
  - startCamera() → get local stream
  - setupVideoCall() → host initiates video
  - conn.on('data') → handle moves, chat
```

**Video Flow:**
```
Host: peer.call(conn.peer, localStream) → sends stream to joiner
Joiner: peer.on('call') → answer(localStream) → sends stream to host
Both: call.on('stream') → remoteVideo.srcObject = stream → play()
```

**Move Sync:**
```
onDrop() → game.move() → clearHighlights() → highlightLastMove()
        → conn.send({type:'move', san:'e4'}) → opponent receives
        → game.move(data.move) → board.position(fen)
```

---

## 🐛 KNOWN ISSUES / LIMITATIONS

### Current Limitations
1. **PeerJS Cloud Server** - Free tier can be unreliable under load
   - Mitigation: STUN servers, retry logic
   - Future: Self-host peerjs-server

2. **No Mobile Optimization** - Designed for desktop
   - Board doesn't scale well on small screens
   - Video layout assumes landscape

3. **No Spectator Mode** - Only 2 players per game

4. **No User Accounts** - Anonymous, room-based only

5. **Video Quality** - Limited to 640x480 for bandwidth

### Potential Enhancements
- [ ] Reconnection UI button
- [ ] Connection status indicator
- [ ] Move sound effects
- [ ] Legal move highlighting (dots)
- [ ] PGN export/download
- [ ] Chess clock with increment
- [ ] Takeback requests
- [ ] Game history/replay
- [ ] Spectator mode
- [ ] Mobile responsive design
- [ ] Self-hosted signaling server

---

## 📝 DEVELOPMENT NOTES

### Testing Methodology (2026-04-26)
- Used Fabric browser automation for multi-tab testing
- Created host and joiner browser sessions
- Logged connection attempts, errors, video state
- Triangulated issues by comparing both sides

### Key Learnings
1. **PeerJS Timing** - Register `peer.on('call')` BEFORE connection opens
2. **Video Autoplay** - Must call `.play()` explicitly after `srcObject`
3. **Chessboard.js** - Inline styles require `!important` for highlights
4. **WebRTC** - STUN servers essential for NAT traversal
5. **GitHub Pages** - ~30 second deploy delay after push

### Common Pitfalls
- ❌ Both tabs joining (neither hosting) → Must click "Create Game" first
- ❌ Video black screen → Missing `.play()` call
- ❌ Highlights persist → `clearHighlights()` never called
- ❌ "Could not connect" → PeerJS server issue, needs retry

---

## 🚀 DEPLOYMENT

### Push to Production
```batch
C:\fabric\push-all-fixes.bat
```

This will:
1. Commit changes to git
2. Push to GitHub main branch
3. Auto-deploy to GitHub Pages (~30 seconds)

### Manual Deploy
```bash
cd C:\fabric
git add index.html
git commit -m "Description of changes"
git push
```

### Verify Deployment
1. Visit https://unclevarda.github.io/vidchess/
2. Open browser DevTools → Console
3. Check for errors
4. Test connection with second tab

---

## 📊 METRICS

- **File Size:** ~35KB (index.html)
- **Load Time:** <1 second (static, CDN assets)
- **Connection Time:** 2-5 seconds (PeerJS handshake)
- **Video Latency:** ~500ms (WebRTC P2P)
- **Move Sync:** <100ms (data channel)

---

## 🔗 EXTERNAL DEPENDENCIES

```html
<!-- Chess.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/chess.js/0.10.3/chess.min.js"></script>

<!-- Chessboard.js -->
<link rel="stylesheet" href="https://unpkg.com/@chrisoakman/chessboardjs@1.0.0/dist/chessboard-1.0.0.min.css">
<script src="https://unpkg.com/@chrisoakman/chessboardjs@1.0.0/dist/chessboard-1.0.0.min.js"></script>

<!-- jQuery (required by chessboard.js) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- PeerJS -->
<script src="https://unpkg.com/peerjs@1.5.4/dist/peerjs.min.js"></script>
```

---

## 📚 REFERENCES

- **Chess.js Docs:** https://github.com/jhlywa/chess.js
- **Chessboard.js Docs:** https://chessboardjs.com/
- **PeerJS Docs:** https://peerjs.com/
- **WebRTC Guide:** https://webrtc.org/getting-started/overview
- **GitHub Pages:** https://pages.github.com/

---

## 👤 AUTHOR NOTES

**Created by:** Unclevarda  
**Enhanced by:** Fabric AI Agent  
**Date:** April 2026

**Vision:** Create the simplest possible chess + video chat experience. No accounts, no downloads, just click and play.

**Philosophy:** 
- Single HTML file = easy to deploy, maintain, fork
- Vanilla JS = no build step, no dependencies to manage
- PeerJS = no backend server required
- GitHub Pages = free, automatic deployment

**Next Steps:**
1. Test thoroughly with real users
2. Gather feedback on UX
3. Iterate on video quality and connection reliability
4. Consider self-hosted signaling for production

---

*Last Updated: 2026-04-26*
