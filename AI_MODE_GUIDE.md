# VidChess - AI Mode Guide

## New Features Added (Latest Update)

### 1. 🤖 AI vs AI Mode
Watch two Stockfish chess engines battle it out!

**How to use:**
1. Click "AI vs AI" button in the lobby
2. Click "Create Game"
3. Watch as White AI and Black AI play against each other
4. View all moves in the AI Log panel (click 📜 AI Log button)

**Features:**
- Stockfish depth 10 analysis
- 1-second delay between moves for viewing
- Complete move log with timestamps
- Automatic game end detection

### 2. 🎮 Player vs AI Mode
Play against Stockfish chess engine

**How to use:**
1. Click "Player vs AI" button in the lobby
2. Click "Create Game"
3. You play as White, AI plays as Black
4. Make your moves, AI will respond automatically

**Features:**
- You always play White (move first)
- AI responds within 1-2 seconds
- Stockfish plays at ~2000-2200 Elo (depth 10)
- Full chess rules enforced

### 3. 📜 Shared AI Log Panel
Real-time log of all AI moves and thinking

**Features:**
- Timestamped entries
- Color-coded by side (White/Black/System)
- Shows when AI is thinking
- Toggle visibility with 📜 AI Log button
- Auto-scrolls to latest move

**Access:** Click the "📜 AI Log" button in the game controls

### 4. 📹 Video Fixes
Fixed critical video playback issues:

**Fixes Applied:**
- ✅ Explicit `.play()` calls for all video elements
- ✅ Remote video now plays automatically for both host and joiner
- ✅ Local video plays on camera start
- ✅ Video call handler registered early to prevent missed calls
- ✅ Better error logging for video issues

**Testing Checklist:**
- [ ] Host sees their own video (local)
- [ ] Host sees opponent's video (remote)
- [ ] Joiner sees their own video (local)
- [ ] Joiner sees opponent's video (remote)
- [ ] No black screens
- [ ] No console errors about video playback

### 5. ♟ Board Orientation
Fixed board orientation for both players:

**How it works:**
- White player: White pieces on bottom (standard view)
- Black player: Black pieces on bottom (flipped view)
- Each player sees the board from their perspective

**Code:**
```javascript
orientation: playerColor  // 'w' or 'b'
```

## Game Modes Comparison

| Feature | Human vs Human | AI vs AI | Player vs AI |
|---------|---------------|----------|--------------|
| Video Chat | ✅ Yes | ❌ Hidden | ❌ Hidden |
| Board Orientation | ✅ Both sides | ⚪ White view | ⚪ White view |
| Drag Pieces | ✅ Yes | ❌ No | ✅ Yes |
| Chat Messages | ✅ Yes | ❌ No | ❌ No |
| AI Log | ⚪ Optional | ✅ Active | ✅ Active |
| Who Moves First | White (human) | White (AI) | Player (White) |
| AI Responses | N/A | Both sides | Black only |

## Technical Details

### Stockfish Integration
- **Library:** stockfish.js 10.0.0
- **Search Depth:** 10 ply
- **Response Time:** ~500ms - 2s per move
- **Strength:** ~2000-2200 Elo at depth 10

### Video Stack
- **WebRTC:** Real-time peer-to-peer video
- **PeerJS:** Connection management
- **STUN Servers:** Google's public STUN for NAT traversal
- **Resolution:** 640x480 @ 30fps
- **Codec:** VP8/H264 (browser dependent)

### Board Rendering
- **Library:** Chessboard.js 1.0.0
- **Pieces:** Wikipedia style
- **Animations:** Smooth drag-drop
- **Highlights:** Last move (green-yellow), Check (red)

## Known Limitations

1. **AI vs AI Video:** Video panel hidden in AI modes (no opponents to see)
2. **Mobile:** Not optimized for small screens
3. **AI Strength:** Fixed at depth 10 (cannot adjust)
4. **Language:** AI only plays, doesn't chat

## Future Enhancements

- [ ] Adjustable AI strength (depth 1-20)
- [ ] AI commentary/analysis
- [ ] Takeback requests vs AI
- [ ] AI vs AI speed control
- [ ] Multiple AI engines to choose from
- [ ] Opening book mode for AI
- [ ] Endgame training mode

## Testing AI Modes

### Quick Test (Single Browser)
1. Open https://unclevarda.github.io/vidchess/
2. Click "AI vs AI" button
3. Click "Create Game"
4. Watch the game unfold
5. Click "📜 AI Log" to see move history

### Player vs AI Test
1. Open https://unclevarda.github.io/vidchess/
2. Click "Player vs AI" button
3. Click "Create Game"
4. Make a move (e.g., e4)
5. Wait for AI response
6. Continue playing

### Video Test (Human vs Human)
1. **Tab 1 (Host):**
   - Open https://unclevarda.github.io/vidchess/
   - Click "Human vs Human"
   - Click "Create Game"
   - Copy the link

2. **Tab 2 (Joiner):**
   - Paste the link or room code
   - Click "Join"
   - Allow camera/microphone access

3. **Verify:**
   - Both tabs see their own video
   - Both tabs see opponent's video
   - No black screens
   - Video is playing (not paused)

## Troubleshooting

### AI Not Moving
- Check browser console for errors
- Ensure JavaScript is enabled
- Try refreshing the page
- Stockfish may not load on slow connections

### Video Not Working
- Allow camera/microphone permissions
- Check if another app is using the camera
- Try a different browser
- Ensure HTTPS (GitHub Pages provides this)

### Board Not Oriented Correctly
- Refresh the page
- Clear browser cache
- Check console for errors
- Verify you're on the latest version

## Changelog

### 2026-04-27 (Latest)
- ✅ Added AI vs AI mode
- ✅ Added Player vs AI mode
- ✅ Added shared AI log panel
- ✅ Fixed video playback with explicit .play() calls
- ✅ Fixed board orientation for black player
- ✅ Added mode selection in lobby
- ✅ Hide video in AI modes
- ✅ Stockfish.js integration

### 2026-04-26 (Previous)
- ✅ PeerJS connection reliability
- ✅ Video streaming fixes
- ✅ Square highlighting
- ✅ Bug fixes (turn enforcement, copy, draw offers)

---

**Live URL:** https://unclevarda.github.io/vidchess/  
**GitHub:** https://github.com/unclevarda/vidchess  
**Version:** 2.0 (AI Enhanced)
