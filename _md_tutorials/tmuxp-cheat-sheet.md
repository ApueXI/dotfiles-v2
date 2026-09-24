# tmuxp Cheat Sheet

A practical reference for creating and managing tmuxp workspaces.

---

## 1. Basic Structure

```yaml
session_name: my-project
start_directory: ~/coding/my-project

windows:
  - window_name: code
    panes:
      -

  - window_name: server
    panes:
      -
```

Hierarchy:

```text
session
└── windows
    └── panes
        └── commands
```

---

## 2. Starting Directories

### Whole session

```yaml
session_name: aisley
start_directory: /home/cred/coding/aisley_app/
```

### Specific window

```yaml
- window_name: android
  start_directory: /home/cred/coding/aisley_app/android/
  panes:
    -
```

### Specific pane

```yaml
panes:
  -
  - start_directory: /home/cred/coding/aisley_app/android/
```

### Portable project-local paths

If the config lives inside the project:

```text
aisley_app/
├── .tmuxp.yaml
├── android/
├── lib/
└── pubspec.yaml
```

you can use:

```yaml
start_directory: ./
```

and:

```yaml
- window_name: run
  panes:
    -
    - start_directory: ./android
```

Then load it with:

```bash
tmuxp load .
```

---

## 3. Blank Panes

These all represent blank panes:

```yaml
panes:
  -
  - null
  - blank
  - pane
```

A blank pane can still have options:

```yaml
panes:
  - focus: true

  - start_directory: ./android
```

---

## 4. Running Commands

Short form:

```yaml
panes:
  - nvim .
  - flutter run
  - git status
```

Long form:

```yaml
panes:
  - shell_command:
      - git status
      - git branch
```

Multiple commands run sequentially in the same pane:

```yaml
panes:
  - shell_command:
      - clear
      - git status
```

---

## 5. Pre-Type a Command Without Executing It

Useful when you want text ready at the prompt but do not want Enter pressed automatically:

```yaml
panes:
  - shell_command:
      - cmd: codex resume
        enter: false
```

Result:

```text
cred@arch ~/coding/aisley_app % codex resume█
```

You can edit the command or press Enter yourself.

You can also write:

```yaml
panes:
  - shell_command: codex resume
    enter: false
```

---

## 6. Focus a Pane

Focus the first pane:

```yaml
panes:
  - focus: true

  - start_directory: ./android
```

Focus the second pane:

```yaml
panes:
  -

  - start_directory: ./android
    focus: true
```

For a pane with commands:

```yaml
panes:
  - shell_command:
      - git status
    focus: true
```

`focus: true` belongs at the pane level, not inside `cmd`.

Correct:

```yaml
panes:
  - shell_command:
      - cmd: git status
    focus: true
```

Not:

```yaml
panes:
  - shell_command:
      - cmd: git status
        focus: true
```

---

## 7. Focus a Window

```yaml
- window_name: vibe code
  focus: true
  panes:
    -
```

You can focus both the startup window and its startup pane:

```yaml
- window_name: vibe code
  focus: true

  panes:
    - shell_command:
        - cmd: codex resume
          enter: false
      focus: true
```

---

## 8. Pane Layouts

Common layouts:

| Layout | Result |
|---|---|
| `even-horizontal` | Equal left/right columns |
| `even-vertical` | Equal top/bottom rows |
| `main-vertical` | Large main pane on the left |
| `main-horizontal` | Large main pane on top |
| `tiled` | Grid-style equal panes |

### Equal left/right

```yaml
layout: even-horizontal

panes:
  -
  -
```

```text
┌────────────┬────────────┐
│            │            │
│   pane 1   │   pane 2   │
│            │            │
└────────────┴────────────┘
```

### Equal top/bottom

```yaml
layout: even-vertical
```

```text
┌─────────────────────────┐
│         pane 1          │
├─────────────────────────┤
│         pane 2          │
└─────────────────────────┘
```

### Main pane on the left

```yaml
layout: main-vertical
```

```text
┌────────────────┬────────┐
│                │ pane 2 │
│     pane 1     ├────────┤
│                │ pane 3 │
└────────────────┴────────┘
```

### Main pane on top

```yaml
layout: main-horizontal
```

```text
┌─────────────────────────┐
│         pane 1          │
├────────────┬────────────┤
│ pane 2     │ pane 3     │
└────────────┴────────────┘
```

---

## 9. Control Main Pane Size

For `main-vertical`:

```yaml
layout: main-vertical

options:
  main-pane-width: 50%
```

Example:

```yaml
- window_name: git
  layout: main-vertical

  options:
    main-pane-width: 50%

  panes:
    - git status
    - git lgg
    - git branch
```

For `main-horizontal`:

```yaml
layout: main-horizontal

options:
  main-pane-height: 60%
```

You can also use terminal-cell counts:

```yaml
options:
  main-pane-height: 30
```

---

## 10. Run Commands Before Every Pane

Use `shell_command_before`.

### Session level

```yaml
session_name: aisley

shell_command_before:
  - clear

windows:
  ...
```

### Window level

```yaml
- window_name: backend

  shell_command_before:
    - source .venv/bin/activate

  panes:
    - python server.py
    - python worker.py
```

---

## 11. Run Something Before Building the Workspace

Use `before_script`:

```yaml
session_name: project

before_script: ./setup.sh

windows:
  ...
```

Useful for:

- checking dependencies
- preparing directories
- running setup scripts
- creating temporary files
- validating environment state

---

## 12. Environment Variables

### Session level

```yaml
environment:
  API_URL: http://localhost:5000
  ENVIRONMENT: development
```

### Window level

```yaml
- window_name: backend

  environment:
    ASPNETCORE_ENVIRONMENT: Development

  panes:
    -
```

### Pane level

```yaml
panes:
  - environment:
      PORT: "5000"

    shell_command:
      - dotnet run
```

---

## 13. Delay Commands

```yaml
panes:
  - shell_command:
      - cmd: flutter pub get
        sleep_after: 2

      - cmd: flutter run
```

Or delay before the pane commands:

```yaml
panes:
  - sleep_before: 2

    shell_command:
      - flutter run
```

---

## 14. Suppress Commands From Shell History

```yaml
suppress_history: true
```

Example:

```yaml
panes:
  - shell_command:
      - flutter run

    suppress_history: true
```

For zsh, this generally pairs with:

```zsh
setopt HIST_IGNORE_SPACE
```

---

## 15. Keep a Pane Visible After Its Command Exits

```yaml
options:
  remain-on-exit: true
```

Example:

```yaml
- window_name: server

  options:
    remain-on-exit: true

  panes:
    - flutter run
    - dotnet run
```

Useful when you want to inspect errors after a command crashes.

---

## 16. Custom Shells

Pane-specific shell:

```yaml
panes:
  - shell: /bin/bash
```

Another example:

```yaml
panes:
  - shell: /usr/bin/nvim
```

Window-wide shell:

```yaml
window_shell: /bin/bash
```

---

## 17. Set Window Numbers

```yaml
windows:
  - window_name: code
    window_index: 1
    panes:
      -

  - window_name: git
    window_index: 5
    panes:
      -
```

Then you can jump directly with tmux:

```text
Ctrl-b 1
Ctrl-b 5
```

---

## 18. Synchronize Panes

```yaml
- window_name: servers

  panes:
    - ssh server1
    - ssh server2

  options_after:
    synchronize-panes: on
```

Typing in one pane will be sent to all synchronized panes.

---

## 19. Multi-Line Commands

```yaml
panes:
  - >
    flutter clean &&
    flutter pub get &&
    flutter run
```

Equivalent to:

```bash
flutter clean && flutter pub get && flutter run
```

---

# Useful tmuxp CLI Commands

## Load workspace

```bash
tmuxp load aisley-flutter
```

Load a specific file:

```bash
tmuxp load ./aisley-flutter.yaml
```

Load project-local config:

```bash
tmuxp load .
```

---

## Edit config

```bash
tmuxp edit aisley-flutter
```

---

## List configs

```bash
tmuxp ls
```

Tree view:

```bash
tmuxp ls --tree
```

---

## Search configs

```bash
tmuxp search aisley
```

---

## Load without attaching

```bash
tmuxp load -d aisley-flutter
```

---

## Add windows to current session

```bash
tmuxp load -a aisley-flutter
```

---

## Override session name

```bash
tmuxp load -s test-aisley aisley-flutter
```

---

## Show diagnostic information

```bash
tmuxp debug-info
```

---

# `tmuxp freeze`

Very useful when designing layouts manually.

First, create the tmux session exactly how you want:

- make windows
- split panes
- resize them
- arrange layouts

Then export the running session:

```bash
tmuxp freeze aisley-flutter
```

Or write it to a specific file:

```bash
tmuxp freeze aisley-flutter -o aisley.yaml
```

Workflow:

```text
build layout manually
        ↓
resize panes
        ↓
tmuxp freeze
        ↓
inspect generated YAML
```

---

# Import tmuxinator Config

```bash
tmuxp import tmuxinator ~/.tmuxinator/project.yml
```

---

# Convert YAML / JSON

```bash
tmuxp convert workspace.yaml
```

or:

```bash
tmuxp convert workspace.json
```

---

# Useful tmux Controls

tmuxp builds the workspace. Once inside it, regular tmux controls apply.

Default prefix:

```text
Ctrl-b
```

## Windows

```text
Ctrl-b c        Create window
Ctrl-b n        Next window
Ctrl-b p        Previous window
Ctrl-b 0..9     Jump to window
Ctrl-b &        Kill window
```

## Panes

```text
Ctrl-b %        Split left/right
Ctrl-b "        Split top/bottom
Ctrl-b ←↑↓→     Move between panes
Ctrl-b z        Zoom/unzoom current pane
Ctrl-b x        Kill pane
```

## Session

```text
Ctrl-b d        Detach
```

## Scroll / Copy Mode

```text
Ctrl-b [
```

## tmux Command Prompt

```text
Ctrl-b :
```

Useful resize commands:

```text
resize-pane -L 5
resize-pane -R 5
resize-pane -U 5
resize-pane -D 5
```

---

# AISLEY Example Config

```yaml
session_name: aisley-flutter
start_directory: ./

workspace_builder_options:
  pane_readiness: auto

windows:

  - window_name: vibe code
    focus: true

    panes:
      - shell_command:
          - cmd: codex resume
            enter: false

        focus: true

  - window_name: document
    panes:
      - shell_command:
          - cmd: codex resume
            enter: false

  - window_name: QA
    panes:
      - shell_command:
          - cmd: codex resume
            enter: false

  - window_name: file manager
    panes:
      - yazi

  - window_name: git
    layout: main-vertical

    options:
      main-pane-width: 50%

    panes:
      - shell_command:
          - git status

        focus: true

      - git lgg

      - git branch

  - window_name: run
    layout: even-horizontal

    panes:
      - focus: true

      - start_directory: ./android

  - window_name: misc
    panes:
      -
```

---

# Most Useful Things to Remember

```yaml
# Focus this window
focus: true

# Focus this pane
panes:
  - focus: true

# Type but don't execute
- cmd: codex resume
  enter: false

# 50/50 left/right
layout: even-horizontal

# 50/50 top/bottom
layout: even-vertical

# Large left pane
layout: main-vertical

# Control large left pane width
options:
  main-pane-width: 60%

# Large top pane
layout: main-horizontal

# Control large top pane height
options:
  main-pane-height: 60%

# Different pane directory
start_directory: ./android
```

And when in doubt about a layout:

```bash
tmuxp freeze <session-name>
```

Create the layout manually first, then let tmuxp generate a starting config for you.
