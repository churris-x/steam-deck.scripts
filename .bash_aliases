#!/bin/bash
# Steam Deck (Fran's Steam Deck)

# Aliases
alias src='source ~/Documents/.aliases'
alias cds='cd ~/Documents/.scripts'
alias grep='grep --color'
alias la='ls -lah --group-directories-first'
alias ll='ls -lhG --group-directories-first'
alias trea='tree -a -I .git'
alias pcat='[ ! -f "/opt/homebrew/bin/bat" ] && (pbpaste | cat) || pbpaste | bat'
alias pc='pbcopy'
alias pv='pbpaste'
alias myip='ifconfig en0 | grep '\''inet '\'' | awk {'\''print $2'\''}'
alias pong='ping 8.8.8.8'
# Git
alias gs='lg2 status'
alias gd='lg2 diff'
alias gp='lg2 push'
alias gl='lg2 pull'
alias gb='lg2 branch'
alias gk='lg2 checkout'
alias gc='lg2 commit -v -a'
alias gv='lg2 commit -v'
alias gf='lg2 fetch'
alias ga='lg2 add . && lg2 status'
# alias gr='lg2 log --graph --oneline --full-history --color '
alias gr='lg2 log -2'
alias gkb='lg2 checkout -b'
alias gcm='lg2 commit -m'
alias grune='lg2 fetch -p && lg2 branch --merged | grep -v \* | xargs lg2 branch -d'
alias dirstatus='ls | xargs -I SHA sh -c '\''cd SHA/; echo; echo SHA; lg2 status -s; cd -;'\'''
# Github
alias ghpr='gh pr create -a @me -l enhancement'
alias ghprb='gh pr create -a @me -l bug'
# Editors
alias sublm='lg2 diff --name-only | xargs subl'
alias subll='gd @ @~ --name-only | xargs subl'
# Functions
alias test='sh ~/Documents/.scripts/functions/test.sh'
alias colours='sh ~/Documents/.scripts/functions/colours.sh'


# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

alias ll='ls -lhG --group-directories-first --color'
alias trea='tree -a -I .git'
alias bp='subl ~/.bash_aliases'
alias bpl='subl ~/.bash_aliases_local'
alias pipe='printf \| | pbcopy'
alias backs='printf \\ | pbcopy'
alias pcat='[ ! -f "/opt/homebrew/bin/bat" ] && (pbpaste | cat) || pbpaste | bat'
alias pc='pbcopy'
alias pv='pbpaste'
alias myip='ifconfig en0 | grep '\''inet '\'' | awk {'\''print $2'\''}'
alias cleandock='defaults delete com.apple.systempreferences AttentionPrefBundleIDs && killall Dock'
alias brewls='brew leaves -r | xargs -I @  brew desc --eval-all @'

# Git
alias gf='git fetch'
alias ga='git add . && git status'
alias gx='gitx'
alias gr='git log --graph --full-history --all --color --pretty=tformat:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s%x20%x1b[33m(%an)%x1b[0m"'
alias gkb='git checkout -b'
alias grune='git fetch -p && git branch --merged | grep -v \* | xargs git branch -d'
alias llgs='ls | xargs -I SHA sh -c '\''cd SHA/; echo; echo SHA; git status -s; cd ~-;'\'''

# Github
alias ghpr='gh pr create -a @me -l enhancement'
alias ghprb='gh pr create -a @me -l bug'

# Editors
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias vs='code'
alias vsm='git diff --name-only | xargs code'
alias sublm='git diff --name-only | xargs subl'
alias subll='gd @ @~ --name-only | xargs subl' # TODO: make this also open the parent folder

# Node dev
alias dev='npm run dev'
alias build='npm run build'
alias start='npm start'
alias treen='tree -I node*'
alias env='vercel env pull .env.local'

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


