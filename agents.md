# Agents.md - Tool Usage Guidelines

## Bash Tool Usage

**CRITICAL:** The `cmd /c` command is broken in this environment. Always use `powershell -Command` instead.

### ✅ CORRECT - Use PowerShell:
```bash
powershell -Command "cd C:\fabric; git add index.html"
powershell -Command "cd C:\fabric; git commit -m 'message'"
powershell -Command "cd C:\fabric; git push"
powershell -Command "Get-ChildItem C:\fabric"
powershell -Command "Test-Path 'C:\Program Files\Git\bin\git.exe'"
```

### ❌ WRONG - Don't use cmd:
```bash
cmd /c "cd C:\fabric && git add index.html"  # BROKEN
cmd /c "git --version"  # BROKEN
```

## Why cmd is Broken

The bash tool's cmd execution has issues with:
- MinGW binaries (git.exe, etc.)
- Path escaping with spaces
- Output capture

PowerShell works reliably for all operations.

## Common Commands

### Git Operations
```powershell
# Add files
powershell -Command "cd C:\fabric; git add ."

# Commit
powershell -Command "cd C:\fabric; git commit -m 'message'"

# Push
powershell -Command "cd C:\fabric; git push"

# Status
powershell -Command "cd C:\fabric; git status"
```

### File Operations
```powershell
# List directory
powershell -Command "Get-ChildItem C:\fabric"

# Create directory
powershell -Command "New-Item -ItemType Directory -Path C:\fabric\test-logs -Force"

# Read file
powershell -Command "Get-Content C:\fabric\vidchess.md"
```

### Process Execution
```powershell
# Run executable
powershell -Command "Start-Process 'C:\Program Files\Git\bin\git.exe' -ArgumentList '--version' -Wait -NoNewWindow"
```

## Remember

- **ALWAYS** use `powershell -Command` for Windows commands
- **NEVER** use `cmd /c` - it's broken
- PowerShell paths use backslashes or forward slashes (both work)
- Use semicolons `;` to chain commands in PowerShell
- Quote paths with spaces

---
Last Updated: 2026-04-26
Reason: cmd /c is broken in this environment
