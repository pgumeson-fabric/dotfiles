typeset -U fpath FPATH
fpath[1,0]="$HOME/.config/zsh/functions"
autoload -Uz $fpath[1]/*(.:t)
