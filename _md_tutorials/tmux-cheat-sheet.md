# tmux Cheat Sheet

## Read this first

**Prefix = `Ctrl+b`.** Press it, release both keys, then press the shortcut.
For example, `Prefix → c` means `Ctrl+b`, release, then `c`.
Shortcuts are case-sensitive; type symbols using your keyboard's normal Shift combinations.
These are standard bindings; your configuration can override them.

- **Session:** a workspace, such as `school` or `app`.
- **Window:** a tab inside that workspace.
- **Pane:** a terminal split inside a tab.

## Terminal commands

Run these in your shell:

| Command | Purpose |
| --- | --- |
| `tmux` | Start a session |
| `tmux new -s app` | Start a named session |
| `tmux new -As app` | Attach to `app`, creating it if needed |
| `tmux ls` | List sessions |
| `tmux attach -t app` | Reopen `app` |
| `tmux rename-session -t app school` | Rename a session |
| `tmux switch-client -t school` | Switch sessions from inside tmux |
| `tmux -V` | Show version |
| `man tmux` | Open the manual |

Detaching keeps programs running while the tmux server stays alive. It does not preserve running programs across a reboot.

## Session shortcuts

| Shortcut | Action |
| --- | --- |
| `Prefix → d` | Detach |
| `Prefix → s` | Session picker |
| `Prefix → $` | Rename session |
| `Prefix → (` / `)` | Previous / next session |

## Window shortcuts

| Shortcut | Action |
| --- | --- |
| `Prefix → c` | New window |
| `Prefix → ,` | Rename window |
| `Prefix → n` / `p` | Next / previous window |
| `Prefix → 0`–`9` | Select numbered window |
| `Prefix → l` | Last window (lowercase L) |
| `Prefix → w` | Window picker |
| `Prefix → &` | Kill window; confirmation required |

## Pane shortcuts

| Shortcut | Action |
| --- | --- |
| `Prefix → %` | Split left/right |
| `Prefix → "` | Split top/bottom |
| `Prefix → Arrow` | Focus adjacent pane |
| `Prefix → o` | Next pane |
| `Prefix → ;` | Last active pane |
| `Prefix → q` | Show pane numbers; press one to select |
| `Prefix → z` | Toggle pane zoom |
| `Prefix → Space` | Cycle layouts |
| `Prefix → Ctrl+Arrow` | Resize by one cell |
| `Prefix → Alt+Arrow` | Resize by five cells |
| `Prefix → {` / `}` | Swap with previous / next pane |
| `Prefix → !` | Move pane into its own window |
| `Prefix → x` | Kill pane; confirmation required |

## Scroll, select, and paste

Enter copy mode with `Prefix → [`. Use arrow keys or Page Up / Page Down to scroll.
Copy-mode keys depend on `mode-keys`; they need **no prefix** once inside copy mode.

| Action | Emacs mode | Vi mode |
| --- | --- | --- |
| Begin selection | `Ctrl+Space` | `Space` |
| Copy selection and leave | `Alt+w` | `Enter` |
| Leave without copying | `Esc` | `q` |
| Search backward | `Ctrl+r` | `?`, query, `Enter` |
| Search forward | `Ctrl+s` | `/`, query, `Enter` |

After leaving copy mode:

- `Prefix → ]`: paste the tmux buffer.
- `Prefix → =`: choose a buffer.

The tmux buffer is separate from the desktop clipboard unless clipboard integration is configured.

## Command prompt and configuration

`Prefix → :` opens tmux's command prompt. Enter commands **without** a leading `tmux`:

```tmux
resize-pane -R 10
resize-pane -D 5
set -g mouse on
source-file ~/.tmux.conf
```

Optional settings for `~/.tmux.conf`:

```tmux
# Click panes, drag borders, and scroll with the mouse.
set -g mouse on

# Use the Vi column in the copy-mode table.
setw -g mode-keys vi

# Retain more scrollback for newly created panes.
set -g history-limit 50000
```

Reload from your shell:

```bash
tmux source-file ~/.tmux.conf
```

## Quick development workflow

1. Run `tmux new -s app`.
2. Open your editor, for example `nvim`.
3. Press `Prefix → %` for another terminal beside it.
4. Start your development server in that pane.
5. Press `Prefix → c` for a separate Git terminal.
6. Press `Prefix → d` to leave everything running.
7. Return with `tmux attach -t app`.

## Close or stop

| Action | Effect |
| --- | --- |
| Run `exit` in a pane's shell | Close that shell; normally removes the pane |
| Press `Ctrl+d` at an empty shell prompt | Usually exits the shell |
| `tmux kill-session -t app` | Destroy `app` and its unshared windows |
| `tmux kill-server` | Destroy all sessions on that tmux server |

**Kill commands terminate the targeted tmux environment and can lose unsaved work.** Use detach when you want to return later.

## If a shortcut does not work

- `Prefix → ?`: inspect your active bindings; press `q` to leave.
- `tmux show-options -g prefix`: check your configured prefix.
- `tmux show-options -w mode-keys`: check copy-mode style.
- `tmux list-keys -T copy-mode-vi`: inspect Vi copy bindings.
- `tmux list-keys -T copy-mode`: inspect Emacs copy bindings.
- If your terminal or window manager intercepts modified arrow keys, use `resize-pane` from the tmux command prompt.

## References

- [Official tmux getting-started guide](https://github.com/tmux/tmux/wiki/Getting-Started)
- [tmux manual: commands, options, and default bindings](https://man.openbsd.org/tmux)
