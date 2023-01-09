#!bin/bash

# install git
xcode-select install

git config --global user.name thehappyboy
git config --global user.email 27151400@qq.com
git config --global http.proxy "http://127.0.0.1:10010"
git config --global https.proxy "http://127.0.0.1:10010"

# install homebrew
if [[ ! -e /usr/local/bin/brew ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "You have installed brew"
fi


brew tap homebrew/cask-fonts

brew install bat
brew install fd
brew install ripgrep
brew install ranger
brew install ripgrep
brew install lazygit
brew install starship
brew install exa
brew install wget
brew install zoxide
brew install neofetch
brew install tmux
brew install stow
brew install arduino-cli
brew install gnu-sed

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

