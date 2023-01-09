set -xg EDITOR nvim
set -Ux fish_user_paths
fish_add_path /usr/local/sbin/

# misc
abbr qs     "open -a Qspace\ Pro"
abbr cat    "bat"
abbr python "python3"
abbr pip    "pip3"
abbr ra     "ranger"
abbr h      "history"
abbr p      "ps -f"
abbr md     "mkdir -o"
abbr rmr    "rm -rf"
abbr grep   "grep --color"
if command -sq lazygit
  abbr lg "lazygit"
end

if command -sq ranger
  abbr ra "ranger"
end

if command -sq bat
  abbr ra "bat"
end

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
abbr ga  "git add"
abbr gb  "git branch"
abbr gd  "git diff -w"
abbr gf  "git fetch"
abbr gl  "git log"
abbr gaa "git add --all"
abbr gst "git status"
abbr gcm "git commit -m"
abbr gcb "git checkout -b"
abbr gps "git push origin"
abbr gpl "git pull"

# cd
# alias for cd
alias  ..="cd .."
alias  ...="cd ../.."
alias  ....="cd ../../.."
alias  .....="cd ../../../.."


starship init fish | source
