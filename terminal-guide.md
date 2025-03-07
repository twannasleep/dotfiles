# Developer's Guide to Your Terminal Configuration

## Overview

Your terminal environment has been optimized for development work with a focus on productivity, clarity, and efficiency. This guide will help you make the most of your new setup.

## Core Components

1. **ZSH** - Your shell with Oh My Zsh framework
2. **Tmux** - Terminal multiplexer for session management
3. **Starship** - Cross-shell prompt with developer-focused information
4. **Kitty** - Fast, feature-rich terminal emulator

## Getting Started

### Automatic Session Management

When you open your terminal, it automatically starts or attaches to a tmux session named 'main'. This ensures you never lose your work and can easily resume where you left off.

### Customizing Your Layout

You have several pre-configured tmux layouts available:

- `tdev [session_name]` - Creates a development layout with 3 panes (1 large, 2 small)
- `th [session_name]` - Creates a 3-pane horizontal layout
- `tg [session_name]` - Creates a 4-pane grid layout

Example:
```bash
tdev project1  # Creates a development layout named "project1"
```

## Essential Shortcuts

### Terminal Navigation

| Shortcut | Action |
|----------|--------|
| `Cmd+T` | New tab |
| `Cmd+W` | Close window |
| `Cmd+N` | New window |
| `Cmd+Left/Right` | Navigate between tabs |
| `Cmd+[/]` | Navigate between windows |
| `Cmd+F` | Search in scrollback |
| `Cmd+K` | Clear screen |

### Tmux Session Management

| Shortcut | Action |
|----------|--------|
| `t` | Start tmux |
| `tn [name]` | New session with name |
| `ta [name]` | Attach to session |
| `tl` | List sessions |
| `tk [name]` | Kill session |
| `tka` | Kill all sessions except current |
| `tkall` | Kill all sessions |

### Tmux Window/Pane Navigation

| Shortcut | Action |
|----------|--------|
| `Alt+Number` | Switch to window number |
| `Alt+Arrow` | Navigate between panes |
| `Alt+h/j/k/l` | Navigate between panes (vim-style) |
| `Alt+\` | Split pane horizontally |
| `Alt+-` | Split pane vertically |
| `Alt+z` | Maximize/restore current pane |
| `Alt+Shift+Arrow` | Resize current pane |

### Copy Mode (Vim-style)

| Shortcut | Action |
|----------|--------|
| `Alt+c` | Enter copy mode |
| `v` | Begin selection |
| `y` | Copy selection |
| `Esc` | Exit copy mode |

## Development Workflow

### Git Shortcuts

| Alias | Command | Description |
|-------|---------|-------------|
| `gs` | `git status` | Check repository status |
| `ga` | `git add` | Stage files |
| `gc "message"` | `git commit -m "message"` | Commit with message |
| `gp` | `git push` | Push to remote |
| `gl` | `git pull` | Pull from remote |
| `gd` | `git diff` | Show changes |
| `gb` | `git branch` | List branches |
| `gco` | `git checkout` | Switch branches |

### Docker & Kubernetes

| Alias | Command | Description |
|-------|---------|-------------|
| `dc` | `docker-compose` | Docker Compose shortcut |
| `k` | `kubectl` | Kubernetes shortcut |

### Python

| Alias | Command | Description |
|-------|---------|-------------|
| `py` | `python3` | Run Python 3 |
| `pip` | `pip3` | Use Pip 3 |

### Node.js

| Alias | Command | Description |
|-------|---------|-------------|
| `npmls` | `npm list --depth=0` | List local packages |
| `npmlsg` | `npm list -g --depth=0` | List global packages |

## Configuration Files

You can quickly edit your configuration files with these aliases:

| Alias | Action |
|-------|--------|
| `zc` | Edit .zshrc |
| `tc` | Edit .tmux.conf |
| `sc` | Edit starship.toml |
| `kc` | Edit kitty.conf |
| `sz` | Source .zshrc |

## Understanding Your Prompt

Your Starship prompt shows:

1. **Directory** - Current working directory (blue)
2. **Git Branch** - Current branch name when in a git repository
3. **Git Status** - Shows status indicators:
   - `?` - Untracked files
   - `!` - Modified files
   - `+` - Staged files
   - `✘` - Deleted files
   - `⇡n` - n commits ahead of remote
   - `⇣n` - n commits behind remote
4. **Language Versions** - Shows version of programming language in current project:
   - Node.js - `⬢ 16.14.0`
   - Python - `🐍 3.9.10`
   - Rust - `🦀 1.60.0`
   - Go - `Go 1.18.1`
5. **Command Duration** - Shows execution time for commands that take longer than 2 seconds

## Advanced Features

### Tmux Plugins

Your tmux configuration includes several useful plugins:

- **tmux-resurrect** - Save and restore tmux sessions
  - `Prefix + Ctrl-s` - Save session
  - `Prefix + Ctrl-r` - Restore session
- **tmux-continuum** - Automatic session saving
- **tmux-yank** - Improved copy/paste
- **tmux-open** - Open highlighted text with appropriate program
- **vim-tmux-navigator** - Seamless navigation between vim and tmux

### Kitty Terminal Features

- **Hints Mode** - `Cmd+Shift+E` to extract paths, `Cmd+Shift+P` to extract hashes
- **Scrollback Viewer** - `F1` to view scrollback in a pager
- **Remote Control** - Enabled for programmatic control of terminal

## Customization Tips

### Adding New Aliases

Edit your `.zshrc` file and add new aliases in the appropriate section:

```bash
# Add to the Aliases section
alias myalias='my command'
```

### Changing Tmux Prefix

If you prefer a different prefix key (default is Ctrl+b):

```
# In .tmux.conf
set -g prefix C-a  # Change to Ctrl+a
unbind C-b         # Unbind old prefix
bind C-a send-prefix
```

### Modifying Your Prompt

Edit `.config/starship.toml` to change what information appears in your prompt:

```toml
# Add or remove elements from the format string
format = """
$username\
$hostname\
$directory\
$git_branch\
$git_status\
$nodejs\
$python\
$line_break\
$character"""
```

## Troubleshooting

### Tmux Plugin Installation

If tmux plugins aren't working, install the plugin manager:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then press `Prefix + I` to install the plugins.

### Font Issues

If you see missing icons in your prompt, ensure you have a Nerd Font installed:

```bash
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

Then update your Kitty config to use it:

```
font_family JetBrainsMono Nerd Font
```

### Color Issues

If colors don't look right, ensure your terminal is set to use 256 colors:

```bash
echo $TERM  # Should show xterm-256color
```

## Best Practices

1. **Use Tmux Sessions** - Create separate sessions for different projects
2. **Leverage Layouts** - Use the predefined layouts (`tdev`, `th`, `tg`) for different tasks
3. **Git Aliases** - Take advantage of the git shortcuts for faster workflow
4. **Tab Management** - Use tabs for different contexts within the same project
5. **Customize Gradually** - Start with the basics and add customizations as you become comfortable

## Visual Reference

### Tmux Layouts

#### Development Layout (`tdev`)
```
┌─────────────────┬─────────────────┐
│                 │                 │
│                 │                 │
│                 │                 │
│     Main        │    Secondary    │
│     Pane        │      Pane       │
│                 │                 │
│                 ├─────────────────┤
│                 │    Terminal     │
│                 │      Pane       │
└─────────────────┴─────────────────┘
```

#### Horizontal Layout (`th`)
```
┌───────────────────────────────────┐
│               Pane 1              │
├───────────────────────────────────┤
│               Pane 2              │
├───────────────────────────────────┤
│               Pane 3              │
└───────────────────────────────────┘
```

#### Grid Layout (`tg`)
```
┌─────────────────┬─────────────────┐
│                 │                 │
│      Pane 1     │      Pane 2     │
│                 │                 │
├─────────────────┼─────────────────┤
│                 │                 │
│      Pane 3     │      Pane 4     │
│                 │                 │
└─────────────────┴─────────────────┘
```

### Starship Prompt Example

```
~/projects/my-app [main !?+] ⬢ v16.14.0 🐍 3.9.10 [2s]
❯
```

This guide covers the essentials of your new terminal configuration. As you use it, you'll discover more features and may want to further customize it to suit your specific workflow.
