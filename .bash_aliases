#!/bin/bash
# Steam Deck (Fran's Steam Deck)

# Set hostname to be the same as LocalHostName (and ComputerName!)
# sudo scutil --set HostName $(scutil --get LocalHostName)

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

alias src='source ~/.bash_profile'
alias cdscripts='cd ~/.scripts'
alias grep='grep --color'
alias la='ls -lah --group-directories-first'
alias ll='ls -lhG --group-directories-first --color'
alias trea='tree -a -I .git'
alias myip='ifconfig en0 | grep '\''inet '\'' | awk {'\''print $2'\''}'
# alias pcat='[ ! -f "/opt/homebrew/bin/bat" ] && (pbpaste | cat) || pbpaste | bat'
# alias pc='pbcopy'
# alias pv='pbpaste'
# alias pipe='printf \| | pbcopy'
# alias backs='printf \\ | pbcopy'

# Git
alias gs='git status'
alias gd='git diff'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gk='git checkout'
alias gc='git commit -v -a'
alias gv='git commit -v'
alias gf='git fetch'
alias ga='git add . && git status'
# alias gr='git log --graph --oneline --full-history --color'
alias gr='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'
alias gx='gitg &'              # Using a gitx GNOME clone for now
alias grune='git fetch -p && git branch --merged | grep -v \* | xargs git branch -d'
alias llgs='ls | xargs -I SHA sh -c '\''cd SHA/; echo; echo SHA; git status -s; cd ~-;'\'''
# alias gkb='git checkout -b'
# alias gcm='git commit -m'

# Github
alias ghpr='gh pr create -a @me -l enhancement'
alias ghprb='gh pr create -a @me -l bug'

# Editors
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias vs='code'
alias vsm='git diff --name-only | xargs code'
# alias subl='flatpak run com.sublimetext.three &'    # why in marduks name does this not fucking work
alias subl='kate' # using kate for now since the fucking bin is able to run the background like any process in this cursed earth
alias sublm='git diff --name-only | xargs subl'
alias subll='gd @ @~ --name-only | xargs subl' # TODO: make this also open the parent folder

# Node dev
alias dev='npm run dev'
alias build='npm run build'
alias start='npm start'
alias treen='tree -I node*'
alias env='vercel env pull .env.local'

# Games
alias cdcar='cd /home/deck/.steam/steam/steamapps/compatdata/516750/pfx/drive_c/users/steamuser/AppData/LocalLow/Amistech/My\ Summer\ Car' # enter my summer car save folder

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

# Pings google with current date
myping () {
    local show_date=true
    exit_handler () {
        show_date=false
    }

    ping 8.8.8.8 2>&1 | while read pong; do
        trap "exit_handler" INT

        if [ $show_date = true ]; then
          echo "$(date): $pong";
        else
          echo $pong
        fi
    done
}

# Greps all process that match a string
psgrep () {
    # Show columns heading if not in pipe
    if [ -t 1  ]; then
        ps -f | head -1
    fi

    # search for term
    ps -fe | grep -v grep | grep $1
}

# Greps string inside man page, add -3 to increase grep context
mangrep () {
    man $1 | grep $3 -- "$2"
}

# Display list of bash colour values
# Taken from https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
colours () {
    #   This function echoes a bunch of color codes to the
    #   terminal to demonstrate what's available.  Each
    #   line is the color code of one forground color,
    #   out of 17 (default + 16 escapes), followed by a
    #   test use of that color on all nine background
    #   colors (default + 8 escapes).

    T='gYw'   # The test text

    echo -e "\n                 40m     41m     42m     43m\
        44m     45m     46m     47m";

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
               '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
               '  36m' '1;36m' '  37m' '1;37m';
        do FG=${FGs// /}
        echo -en " $FGs \033[$FG  $T  "
        for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
            do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
        done
        echo;
  done
  echo
}

# -----------------------------------------------------------------------------
# Environment setup
# -----------------------------------------------------------------------------

# Colors for bash terminal
export CLICOLOR=1
export LSCOLORS=cxfxexexDxexexDxDxcxcx

# zoxide init
# eval "$(zoxide init bash)"

# Adds completion for aliases
# alias_completion
