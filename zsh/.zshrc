export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Some automation
ZSH_HOME="$HOME/.zsh"
if [[ ! -d $ZSH_HOME ]]; then
  echo "\n$ZSH_HOME folder is not configured. Installing plugins...\n"
  mkdir $ZSH_HOME && cd $ZSH_HOME
  git clone https://github.com/Aloxaf/fzf-tab.git
  echo "" 
  git clone https://github.com/zsh-users/zsh-completions.git
  echo ""
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  echo ""
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
  cd $HOME
  echo "\nAll plugins successfully installed!"
fi

# Enable shell completions
fpath+=($ZSH_HOME/zsh-completions/src)
autoload -U compinit ; compinit

# Rebuild completions cache
# rm ~/.zcompdump*; compinit

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # Folder preview while pressing Tab
setopt no_case_glob # No difference in case while matching
setopt globdots # Show hidden files by default
stty -ixon <$TTY >$TTY # Fix 'Ctrl + S' Modifier

# Bindings
bindkey '^ ' autosuggest-accept # Ctrl + Space
bindkey '^q' clear-screen # Ctrl + Q

bindkey "^a" beginning-of-line # Ctrl + A
bindkey "^e" end-of-line # Ctrl + E
bindkey "^f" forward-word # Ctrl + F
bindkey "^b" backward-word # Ctrl + B

# bindkey "^[f" forward-char # Alt + F
# bindkey "^[b" backward-char # Alt + B

bindkey "^h" vi-backward-char # Ctrl + H
bindkey "^j" down-line-or-history # Ctrl + J
bindkey "^k" atuin-up-search-viins # Ctrl + K
bindkey "^l" vi-forward-char # Ctrl + L

# Get the keybind
bindkey "^[v" .describe-key-briefly # Alt + V

# Run zoxide in interactive mode
function _run-cdi {
  result=$(zoxide query -i)
  if [[ -n $result ]]; then
    BUFFER="cd ${(q-)result}"
  else
    BUFFER=""
  fi
  zle redisplay
}
zle -N _run-cdi

# Mapping to run Rust coreutils by default
alias arch="uu-arch"
alias b2sum="uu-b2sum"
alias b3sum="uu-b3sum"
alias base32="uu-base32"
alias base64="uu-base64"
alias basename="uu-basename"
alias basenc="uu-basenc"
alias cat="uu-cat"
alias chgrp="uu-chgrp"
alias chmod="uu-chmod"
alias chown="uu-chown"
alias chroot="uu-chroot"
alias cksum="uu-cksum"
alias comm="uu-comm"
alias cp="uu-cp"
alias csplit="uu-csplit"
alias cut="uu-cut"
alias date="uu-date"
alias dd="uu-dd"
alias df="uu-df"
alias dir="uu-dir"
alias dircolors="uu-dircolors"
alias dirname="uu-dirname"
alias du="uu-du"
alias echo="uu-echo"
alias env="uu-env"
alias expand="uu-expand"
alias expr="uu-expr"
alias factor="uu-factor"
alias false="uu-false"
alias fmt="uu-fmt"
alias fold="uu-fold"
alias groups="uu-groups"
alias hashsum="uu-hashsum"
alias head="uu-head"
alias hostid="uu-hostid"
alias hostname="uu-hostname"
alias id="uu-id"
alias install="uu-install"
alias join="uu-join"
alias kill="uu-kill"
alias link="uu-link"
alias ln="uu-ln"
alias logname="uu-logname"
alias ls="uu-ls"
alias md5sum="uu-md5sum"
alias mkdir="uu-mkdir"
alias mkfifo="uu-mkfifo"
alias mknod="uu-mknod"
alias mktemp="uu-mktemp"
alias more="uu-more"
alias mv="uu-mv"
alias nice="uu-nice"
alias nl="uu-nl"
alias nohup="uu-nohup"
alias nproc="uu-nproc"
alias numfmt="uu-numfmt"
alias od="uu-od"
alias paste="uu-paste"
alias pathchk="uu-pathchk"
alias pinky="uu-pinky"
alias pr="uu-pr"
alias printenv="uu-printenv"
alias printf="uu-printf"
alias ptx="uu-ptx"
alias pwd="uu-pwd"
alias readlink="uu-readlink"
alias realpath="uu-realpath"
alias rm="uu-rm"
alias rmdir="uu-rmdir"
alias seq="uu-seq"
alias sha1sum="uu-sha1sum"
alias sha224sum="uu-sha224sum"
alias sha256sum="uu-sha256sum"
alias sha3="224sum uu-sha3-224sum"
alias sha3="256sum uu-sha3-256sum"
alias sha3="384sum uu-sha3-384sum"
alias sha3="512sum uu-sha3-512sum"
alias sha384sum="uu-sha384sum"
alias sha3sum="uu-sha3sum"
alias sha512sum="uu-sha512sum"
alias shake128sum="uu-shake128sum"
alias shake256sum="uu-shake256sum"
alias shred="uu-shred"
alias shuf="uu-shuf"
alias sleep="uu-sleep"
alias sort="uu-sort"
alias split="uu-split"
alias stat="uu-stat"
alias stdbuf="uu-stdbuf"
alias sum="uu-sum"
alias sync="uu-sync"
alias tac="uu-tac"
alias tail="uu-tail"
alias tee="uu-tee"
alias test="uu-test"
alias timeout="uu-timeout"
alias touch="uu-touch"
alias tr="uu-tr"
alias true="uu-true"
alias truncate="uu-truncate"
alias tsort="uu-tsort"
alias tty="uu-tty"
alias uname="uu-uname"
alias unexpand="uu-unexpand"
alias uniq="uu-uniq"
alias unlink="uu-unlink"
alias uptime="uu-uptime"
alias users="uu-users"
alias vdir="uu-vdir"
alias wc="uu-wc"
alias who="uu-who"
alias whoami="uu-whoami"
alias yes="uu-yes"

# Mapping to run eza by default
alias ls="eza"
alias lsn="eza -s=newest"
alias ll="eza -l"
alias lln="eza -l -s=newest"
alias la="eza -la"
alias lan="eza -la -s=newest"


alias v="nvim"
alias dv="doas nvim"


alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"


alias ff="fastfetch"
alias pf="pfetch"
alias md="uu-mkdir -p"

# Enabling tools
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(docker completion zsh)"
bindkey "^r" _run-cdi # Ctrl + R

# Enabling plugins
source $ZSH_HOME/fzf-tab/fzf-tab.plugin.zsh
source $ZSH_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set environment to opencommit
DOTS_HOME="$HOME/dwm-dots"
source "$DOTS_HOME/opencommit/set_env.sh"
