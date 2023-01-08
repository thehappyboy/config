
set -xg EDITOR nvim
# set -Ux fish_user_paths
# fish_add_path $GOPATH $GOPATH/bin

# misc
abbr rmr "rm -rf"

# vim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

#tmux
abbr t  "tmux"

# brew
abbr bws "brew search"
abbr bwi "brew install"
abbr bwc "brew install --cask"
abbr bwu "brew update"


# git
abbr g   "git"
abbr gc  "git commit -c"
abbr gl  "git log"
abbr gaa "git add --all"
abbr gst "git status"
abbr gps "git push"
abbr gpl "git pull"

starship init fish | source
