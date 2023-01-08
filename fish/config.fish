
set -xg EDITOR nvim
# set -Ux fish_user_paths
# fish_add_path $GOPATH $GOPATH/bin

# misc
abbr rmr "rm -rf"
abbr python "python3"
abbr pip    "pip3"
abbr lg "lazygit"
abbr ra "ranger"

# vim
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

#tmux
abbr t   "tmux"
abbr ta  "tmux attach -t"
abbr tad "tmux attach -d -t"
abbr ts  "tmux new-session -s"
abbr tks "tmux kill-session -t"

#vf
abbr vfn "vf new"
abbr vfa "vf activate"
abbr vfd "vf deactivate"
abbr vfu "vf upgrade"
abbr vfr "vf rm"

# brew
abbr bws "brew search"
abbr bwi "brew install"
abbr bwc "brew install --cask"
abbr bwu "brew update"


# git
abbr g   "git"
abbr gb  "git branch"
abbr gf  "git fetch"
abbr gl  "git log"
abbr ga  "git add --all"
abbr gaa "git add --all"
abbr gst "git status"
abbr gcm "git commit -m"
abbr gps "git push"
abbr gpl "git pull"

starship init fish | source
