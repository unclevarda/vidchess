# VidChess — Chess + Video Call (PeerJS Multiplayer)

## Current State

A single HTML file (`chessroulette.html`) with real-time multiplayer chess via PeerJS WebRTC. Players connect peer-to-peer — no server needed.

## What Works

- ✅ PeerJS multiplayer (create/join via room code)
- ✅ Real-time chess move sync via WebRTC data channel
- ✅ Drag-and-drop chess (chessboard.js + chess.js)
- ✅ Video call between players (WebRTC via PeerJS)
- ✅ Chat between players (via data channel)
- ✅ Resign / Draw offer via data channel
- ✅ 10-minute chess clocks (correct for both white & black)
- ✅ Board orientation flips for black player
- ✅ Last-move highlighting, check highlighting
- ✅ Move history strip
- ✅ Game over detection (checkmate, stalemate, draw, timeout)
- ✅ URL-based room joining (`?room=abc123`)
- ✅ Copy link to clipboard

## Fixed Issues

- ✅ **`addChatMessage` called before game screen visible** — Copy confirmation now shows in the lobby's link area instead of calling `addChatMessage`. Uses a dynamically created confirmation element that auto-hides after 3 seconds.

- ✅ **Video call timing** — `peer.on('call')` handler is now registered immediately in `createGame()` and `joinGame()`, before `setupConnection()` runs. Incoming calls can no longer be missed.

- ✅ **Draw offer has no accept/decline UI** — When receiving a `draw-offer`, the opponent now sees inline Accept/Decline buttons in the chat area. Buttons are created dynamically with `createElement` (no `getElementById` on non-existent elements). The draw button is disabled for 10 seconds after sending to prevent double offers.

- ✅ **`copyLinkBtn` uses deprecated `document.execCommand('copy')`** — Now uses `navigator.clipboard.writeText()` with a fallback to `execCommand` for older browsers.

## Remaining Issues

1. **Opponent bar still shows "🤖" and "~1500"** — Cosmetic. Should show "Opponent" with no fake rating.

2. **No reconnection handling** — If the PeerJS signaling server drops, the connection is lost with no retry.

3. **No error handling for camera permission denial** — If the user denies camera access, `localStream` is null and video call setup silently fails.

4. **The matchmaking CSS is still in the file** — The `#matchmaking` overlay CSS (lines 82-92) is unused since the matchmaking screen was removed from HTML. Can be cleaned up.

## Architecture

```
┌─────────────────────────────────────────────┐
│  Player A (Host, White)                     │
│  ┌──────────┐    ┌──────────┐               │
│  │ chess.js │◄──►│ PeerJS   │               │
│  │ game     │    │ data     │── signaling ──┐
│  │ logic    │    │ channel  │   server      │
│  └──────────┘    └──────────┘               │
│       │              │                      │
│       ▼              ▼                      │
│  chessboard.js   WebRTC video               │
│  (drag-drop)     stream                     │
└─────────────────────────────────────────────┘
                    │
              WebRTC P2P
              (moves + video)
                    │
┌─────────────────────────────────────────────┐
│  Player B (Joiner, Black)                   │
│  (same architecture, mirrored)              │
└─────────────────────────────────────────────┘
```

## How to Use

1. Open `chessroulette.html` in a browser
2. Click "Create Game" → get a shareable link
3. Send the link to a friend
4. Friend opens the link → auto-joins
5. Both players see the board, video, and chat

## Deployment

Drag `chessroulette.html` to [Netlify Drop](https://app.netlify.com/drop) for instant hosting. No build step needed.

## Libraries Used (all CDN)

| Library | Purpose | CDN |
|---------|---------|-----|
| chess.js 0.10.3 | Game logic, move validation | cdnjs.cloudflare.com |
| chessboard.js 1.0.0 | Board UI, drag-and-drop | unpkg.com |
| jQuery 3.7.1 | DOM manipulation (chessboard.js dependency) | code.jquery.com |
| PeerJS 1.5.4 | WebRTC signaling + data channel + video | unpkg.com |

## Full Source Code

See `chessroulette.html` in the same directory.

## Key Code Sections

### Room Creation
```javascript
function createGame() {
  myRoomId = generateRoomId();
  peer = new Peer('cr-' + myRoomId);
  peer.on('connection', function(connection) {
    conn = connection;
    playerColor = 'w';
    setupConnection();
  });
}
```

### Room Joining
```javascript
function joinGame(room) {
  peer = new Peer();
  peer.on('open', function() {
    conn = peer.connect('cr-' + room);
    playerColor = 'b';
    setupConnection();
  });
}
```

### Move Sync
```javascript
// Sending (onDrop)
conn.send({ type: 'move', move: move.san });

// Receiving (handleIncomingData)
case 'move':
  handleOpponentMove(data.move);
  break;
```

### Video Call
```javascript
// Host initiates
var call = peer.call(conn.peer, localStream);
call.on('stream', function(remoteStream) {
  document.getElementById('remoteVideo').srcObject = remoteStream;
});

// Joiner answers
peer.on('call', function(incomingCall) {
  incomingCall.answer(localStream);
  incomingCall.on('stream', function(remoteStream) {
    document.getElementById('remoteVideo').srcObject = remoteStream;
  });
});
```
