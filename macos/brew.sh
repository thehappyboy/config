#!bin/bash



brew install --cask iina
brew install --cask alacritty
brew install --cask iterm2
brew install --cask feishu
brew install --cask microsoft-edge
brew install --cask visual-studio-code
brew install --cask foobar2000
brew install --cask baidunetdisk
brew install --cask adirve
brew install --cask sourcetree
brew install --cask wolai
brew install --cask tencent-lemon
brew install --cask hyperswitch
brew install --cask vnc-viewer
brew install --cask raspberry-pi-imager
brew install --cask arduino-ide


brew install --cask font-hurmit-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-victor-mono-nerd-font

brew install fish
echo "/usr/local/bin/fish" > /etc/shells
chsh -s $(which fish)

brew install node
npm install -g neovim

brew install --cask sogouinput
sogou_base="/usr/local/Caskroom/sogouinput"
sogou_version="$sogou_base/"`ls "$sogou_base"`
sogou_app="$sogou_version/"`ls $sogou_version | grep .app | tail -n 1`
open "$sogou_app"


brew install fzf
$(brew --prefix)/opt/fzf/install --all

brew install --HEAD neovim

