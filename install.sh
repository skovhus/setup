#!/bin/bash

# Inspiration:
# - http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html
# - https://github.com/sorenvind/dev-env
# - https://github.com/mads-hartmann/dotfiles

set -euo pipefail

# Set up OSX settings
echo "> Setting up OS X..."
./OSXsettings.sh

sudo xcode-select --install

# Install homebrew
if test ! $(which brew)
then
  echo "> Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew doctor
fi

# Install latest zsh and oh-my-zsh
OMZ=~/.oh-my-zsh
if test ! -d $OMZ
then
  echo "> Installing oh my zsh..."
  brew install zsh
  curl -L http://install.ohmyz.sh | sh
fi


# up the limit for files opened
sudo launchctl limit maxfiles 2048 unlimited

echo "> Brew: updating and upgrading..."
brew update
brew upgrade


echo "> Brew: Installing common sanity..."
brew update
brew upgrade
brew install coreutils
brew install curl
brew install git
brew install gnu-sed
brew install jq
brew install make
brew install node
brew install yarn
brew install python
brew install ruby


echo "> Brew: Installing apps and packages..."
brew cask install docker
brew cask install dropbox
brew cask install flux
brew cask install font-fira-code
brew cask install google-chrome
brew cask install java
brew cask install jumpcut
brew cask install licecap
brew cask install moom
brew cask install mysql-utilities
brew cask install mysqlworkbench
brew cask install omnigraffle
brew cask install postico
brew cask install spotify
brew cask install visual-studio-code
brew cask install vlc
brew install awscli
brew install pstree
brew install the_silver_searcher
brew install tree
brew install watchman
brew install wget
brew tap caskroom/fonts


echo "> Install python packages..."
pip3 install virtualenv pylint flake8


echo "> Setup symlinks for dotfiles and shell stuff..."
# Symlink dot files
ln -fs $PWD/home/.zshrc ~
ln -fs $PWD/home/.ssh/config ~/.ssh

# move .gitconfig without e-mail
cp home/.gitconfig ~

# And oh my zsh theme
mkdir -p ~/.oh-my-zsh/themes/
ln -fs $PWD/skovhus.zsh-theme ~/.oh-my-zsh/themes/skovhus.zsh-theme


echo "> Setting up VS Code..."
mkdir -p ~/Library/Application\ Support/Code/User
ln -fs $PWD/apps/vs-code/settings.json ~/Library/Application\ Support/Code/User
ln -fs $PWD/apps/vs-code/keybindings.json ~/Library/Application\ Support/Code/User
for module in `cat apps/vs-code/extensions.list`; do
    code --install-extension "$module" || true
done

echo "> Done!"

echo "-----------------------------------------"
echo "Manual steps:"
echo "-----------------------------------------"
echo "- Setup terminal to import solarized-dark.terminal profile, with Menlo Regular 10pt and block cursor."
echo "- add e-mail to ~/.gitconfig"
echo "- Fix all issues from running brew doctor"
echo "- Set up short cuts http://apple.stackexchange.com/questions/167967/creating-system-wide-keyboard-shortcut-to-launch-applications"
echo "- Configure moom, jumpcut to start, etc..."
