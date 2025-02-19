# Tmux Configuration Guide

A minimal and efficient tmux setup for macOS terminal users.

## Installation
```bash
Install tmux via Homebrew
brew install tmux
Install Tmux Plugin Manager (tpm)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Basic Concepts

Tmux uses a hierarchical structure:
- Sessions contain windows
- Windows contain panes
- All commands start with the prefix key (Ctrl+b)

## Key Bindings

### Session Management
| Command | Action |
|---------|--------|
| `tmux new -s name` | Create new session |
| `tmux attach -t name` | Attach to session |
| `tmux ls` | List sessions |
| `prefix + d` | Detach from session |
| `prefix + $` | Rename session |
| `prefix + s` | List/switch sessions |

### Window Management
| Command | Action |
|---------|--------|
| `prefix + c` | Create new window |
| `prefix + n` | Next window |
| `prefix + p` | Previous window |
| `prefix + number` | Go to window #number |
| `prefix + &` | Kill window |
| `prefix + ,` | Rename window |
| `prefix + w` | List windows |

### Pane Management
| Command | Action |
|---------|--------|
| `prefix + %` | Split vertically |
| `prefix + "` | Split horizontally |
| `prefix + arrows` | Navigate panes |
| `prefix + x` | Kill pane |
| `prefix + z` | Zoom/unzoom pane |
| `prefix + }` | Swap with next pane |
| `prefix + {` | Swap with previous pane |
| `prefix + Alt+arrows` | Resize pane |

### Copy Mode (Vi keys)
| Command | Action |
|---------|--------|
| `prefix + [` | Enter copy mode |
| `v` | Start selection |
| `y` | Copy selection |
| `q` | Exit copy mode |
| `prefix + ]` | Paste |

## Aliases (in .zshrc)
```bash
t # Start tmux
tn name # New session
ta name # Attach to session
tl # List sessions
tk name # Kill session
tka # Kill all sessions except current
tkall # Kill server
tks # Kill current session
```

## Development Layout

The `tdev` function creates a development-friendly layout:
```bash
tdev [name] # Creates a session with 3 panes
```

Layout:
+----------------+
| |
| |
+----------------+
| |
+----------------+


## Status Bar

The status bar shows:
- Session name [green, red when prefix pressed]
- Window list with current window highlighted
- Time and date

Format:
```[session] 1:window 2:window 15:30 23-Mar
```

## Plugin Management

Installed plugins:
- tmux-sensible: Basic tmux settings
- tmux-resurrect: Session saving and restoring

Plugin commands:
- `prefix + I`: Install plugins
- `prefix + U`: Update plugins
- `prefix + alt + u`: Uninstall plugins

## Common Operations

### Starting Tmux
```bash
# New named session
tmux new -s myproject
Attach to existing session
tmux attach -t myproject
List sessions
tmux ls
```

### Saving/Restoring Sessions
```bash
Save session (with tmux-resurrect)
prefix + Ctrl-s
Restore session
prefix + Ctrl-r
```


## Customization

### Modifying Configuration
1. Edit ~/.tmux.conf
2. Reload configuration:
   - From inside tmux: `prefix + :source-file ~/.tmux.conf`
   - From shell: `tmux source-file ~/.tmux.conf`

### Color Scheme
Current configuration uses:
- Default background
- Green/red session name
- Blue time
- Yellow date
- Magenta current window
- Grey inactive windows

## Troubleshooting

### Common Issues

1. **Colors not displaying correctly**
   - Ensure TERM is set correctly in .zshrc:
     ```bash
     export TERM="xterm-256color"
     ```

2. **Mouse mode not working**
   - Check if mouse mode is enabled:
     ```bash
     tmux show -g mouse
     ```
   - Enable if needed:
     ```bash
     tmux set -g mouse on
     ```

3. **Plugins not loading**
   - Reinstall TPM:
     ```bash
     rm -rf ~/.tmux/plugins/tpm
     git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
     ```
   - Press `prefix + I` to install plugins

### Reset Configuration
```bash
mv ~/.tmux.conf ~/.tmux.conf.backup
mv ~/.tmux ~/.tmux.backup
```

## Updates and Maintenance

1. Update tmux:
```bash
brew update
brew upgrade tmux
```

2. Update plugins:
   - Inside tmux: `prefix + U`

3. Check tmux version:
```bash
tmux -V
```
This guide provides:
1. Installation instructions
2. Complete key binding reference
3. Common operations
4. Customization options
5. Troubleshooting steps
6. Maintenance procedures