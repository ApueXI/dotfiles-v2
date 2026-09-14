# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -U colors && colors
PROMPT='%F{yellow}%n@arch%f %F{green}%~%f %# '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cls='clear'
alias ff='fastfetch'
alias fire='firefox'
alias img='swayimg'

# Can also use ip link
alias nmd='nmcli device'
alias nmdw='nmcli device wifi'
alias nmdwl='nmcli device wifi list'
alias nmdwr='nmcli device wifi rescan'
alias nmdwconn='nmcli device wifi connect' # nmdwconn 'ssid' password 'psww' hidden yes
alias nmdshow='nmcli -p device show'

alias avim="NVIM_APPNAME=nvim_acob nvim"
alias kvim="NVIM_APPNAME=nvim_kick nvim"
# alias kvim="NVIM_APPNAME=kick-nvim nvim"

# # Show sched
# alias schd="mdcat /home/cred/.sched/.sched.md"
# alias schd="bat --style=plain --language=markdown --theme='Catppuccin Latte' /home/cred/sched.md"
#
# # How to mount external hdd
# alias how_mnt="mdcat /home/cred/mount-nfts-hdd.md"

# To Update mirror list
alias reflector_scr='reflector --sort score --age 96 --ipv4 --protocol https --connection-timeout 15  --verbose --country Japan,Singapore,South_Korea,Philippines'
alias reflector_spd='reflector --sort rate --age 96 --ipv4 --protocol https --connection-timeout 15 --verbose --country Japan,Singapore,South_Korea,Philippines'
alias reflector_spd_save='reflector --sort rate --age 96 --ipv4 --protocol https --connection-timeout 15 --save /home/cred/mirrorlist_reflector --verbose --country Japan,Singapore,South_Korea,Philippines'

# Extract stuff into dedicated folder
alias extract='7z x -o/home/cred/stuff-extracted'
# Zip file/folder, give the extact directory
alias pyzip='python /home/cred/python_scripts/zipping.py'

# Generate python secrets
alias gen_pysecrets='python /home/cred/python_scripts/gen_secrets.py'

# Copy to clipboard the current directory
alias cpwd='pwd | wl-copy'

# Shutdown in x minutes
alias timed_shutdown='python /home/cred/python_scripts/shutdown.py'


# See packages and put them in a .txt file
alias list_packages='pacman -Qen > /home/cred/list-packages/pacman-packages.txt;
                      pacman -Qn > /home/cred/list-packages/pacman-packages-dependencies.txt;
                      pacman -Qem > /home/cred/list-packages/aur-packages.txt;
                      pacman -Qm > /home/cred/list-packages/aur-packages-dependencies.txt'

# Play that one scene from autofister karaoke where its really really romantic and gigi lifts cece
alias autofister="mpv --fs /home/cred/autofister_unarchived_karaoke.mp4"

# clear all mako notifs
alias makocls="makoctl dismiss -a"

export EDITOR=nvim
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

export PATH="$PATH:/home/cred/.dotnet/tools"
export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$HOME/.local/bin:$PATH"
export PATH="$HOME/develop/flutter/bin:$PATH"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
